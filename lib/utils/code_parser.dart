import 'package:flutter/material.dart';
import 'package:tcc2/enums/bird_color.dart';
import 'package:tcc2/theme/app_text_styles.dart';
import 'package:tcc2/utils/syntax_validator.dart';
import 'package:tcc2/widgets/game_components.dart';

import '../l10n/app_localizations.dart';

class CodeParser {
  static Widget parseCode(
    String code,
    List<Widget> birds,
    AppLocalizations l10n,
  ) {
    // First validate syntax using the same validation as SolutionChecker
    final syntaxValidation = SyntaxValidator.validateCodeSyntax(code, l10n);
    if (!syntaxValidation.isValid) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '❌ ${syntaxValidation.errorMessage}',
            style: AppTextStyles.error,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    // Remove extra whitespace and normalize the code
    code = code.trim().toLowerCase().replaceAll('\n', ' ');

    try {
      // Parse the outermost widget
      return _parseWidget(code, birds);
    } catch (e) {
      // Return a centered error message if parsing fails
      return Center(
        child: Text(
          'Invalid code: ${e.toString()}',
          style: AppTextStyles.error,
        ),
      );
    }
  }

  static Widget _parseWidget(String code, List<Widget> birds) {
    // Handle empty code
    if (code.trim().isEmpty) {
      return const SizedBox.shrink(); // Return an empty widget
    }

    // Extract widget name and content
    final match = RegExp(r'(\w+)\s*\((.*)\)').firstMatch(code);
    if (match == null) throw 'Invalid widget format';

    final widgetName = match.group(1)!;
    final content = match.group(2)!;

    // Parse properties and children
    final properties = _parseProperties(content);
    final children = _parseChildren(properties.remove('children') ?? '', birds);

    // Handle child property safely
    final childProperty = properties.remove('child') ?? '';
    final child = childProperty.trim().isEmpty
        ? const SizedBox.shrink()
        : _parseWidget(childProperty, birds);

    // Create the appropriate widget
    switch (widgetName) {
      case 'row':
        return Row(
          mainAxisAlignment: _parseMainAxisAlignment(
              properties['mainaxisalignment'] ?? 'start'),
          crossAxisAlignment: _parseCrossAxisAlignment(
              properties['crossaxisalignment'] ?? 'start'),
          children: children,
        );
      case 'column':
        return Column(
          mainAxisAlignment: _parseMainAxisAlignment(
              properties['mainaxisalignment'] ?? 'start'),
          crossAxisAlignment: _parseCrossAxisAlignment(
              properties['crossaxisalignment'] ?? 'start'),
          children: children,
        );
      case 'flex':
        return Flex(
          direction: _parseAxis(properties['direction'] ?? 'horizontal'),
          mainAxisAlignment: _parseMainAxisAlignment(
              properties['mainaxisalignment'] ?? 'start'),
          crossAxisAlignment: _parseCrossAxisAlignment(
              properties['crossaxisalignment'] ?? 'start'),
          children: children,
        );
      case 'expanded':
        return Expanded(
          flex: parseFlex(properties['flex'] ?? '0'),
          child: child,
        );
      case 'flexible':
        return Flexible(
          flex: parseFlex(properties['flex'] ?? '0'),
          fit: _parseFlexFit(properties['fit'] ?? 'tight'),
          child: child,
        );
      case 'spacer':
        return const Spacer();
      case 'stack':
        return Stack(children: children);
      case 'wrap':
        return Wrap(
          direction: _parseAxis(properties['direction'] ?? 'horizontal'),
          alignment: _parseWrapAlignment(properties['alignment'] ?? 'start'),
          children: children,
        );
      case 'center':
        return Center(child: child);
      case 'bird':
        return const Bird(color: BirdColor.green);
      default:
        throw 'Unknown widget: $widgetName';
    }
  }

  static Map<String, String> _parseProperties(String content) {
    final properties = <String, String>{};

    // Find the children section if it exists
    final childrenStart = content.indexOf('children:');
    final propertiesSection =
        childrenStart != -1 ? content.substring(0, childrenStart) : content;

    // Parse individual properties
    final propertyRegex = RegExp(r'(\w+):\s*([^,]+)');
    final matches = propertyRegex.allMatches(propertiesSection);

    for (final match in matches) {
      final name = match.group(1)!.toLowerCase();
      final value = match.group(2)!.trim().toLowerCase();
      properties[name] = value;
    }

    // If children section exists, add it as a property
    if (childrenStart != -1) {
      final childrenContent = content.substring(childrenStart);
      properties['children'] = childrenContent.substring('children:'.length);
    }

    return properties;
  }

  static List<Widget> _parseChildren(String childrenStr, List<Widget> birds) {
    if (childrenStr.isEmpty) return [];

    // Extract content between square brackets
    final bracketMatch = RegExp(r'\[(.*)\]').firstMatch(childrenStr);
    if (bracketMatch == null) throw 'Invalid children format';

    final childrenContent = bracketMatch.group(1)!;
    final children = <Widget>[];
    int birdIndex = 0;

    // Split by commas, but respect nested brackets
    final childItems = _splitByTopLevelCommas(childrenContent);

    for (final child in childItems) {
      final trimmed = child.trim();
      if (trimmed.isEmpty) continue; // Skip empty items

      if (trimmed.startsWith('bird')) {
        if (birdIndex >= birds.length) {
          throw 'Too many birds specified';
        }
        children.add(birds[birdIndex++]);
      } else {
        // Recursively parse nested widgets, but only if not empty
        try {
          children.add(_parseWidget(trimmed, birds.sublist(birdIndex)));
        } catch (e) {
          // If parsing fails, skip this child widget
          continue;
        }
      }
    }

    return children;
  }

  static List<String> _splitByTopLevelCommas(String content) {
    final parts = <String>[];
    int bracketCount = 0;
    int start = 0;

    for (int i = 0; i < content.length; i++) {
      switch (content[i]) {
        case '(':
        case '[':
          bracketCount++;
          break;
        case ')':
        case ']':
          bracketCount--;
          break;
        case ',':
          if (bracketCount == 0) {
            parts.add(content.substring(start, i));
            start = i + 1;
          }
          break;
      }
    }

    if (start < content.length) {
      parts.add(content.substring(start));
    }

    return parts.map((p) => p.trim()).where((p) => p.isNotEmpty).toList();
  }

  static MainAxisAlignment _parseMainAxisAlignment(String value) {
    switch (value) {
      case 'start':
        return MainAxisAlignment.start;
      case 'end':
        return MainAxisAlignment.end;
      case 'center':
        return MainAxisAlignment.center;
      case 'spacebetween':
        return MainAxisAlignment.spaceBetween;
      case 'spacearound':
        return MainAxisAlignment.spaceAround;
      case 'spaceevenly':
        return MainAxisAlignment.spaceEvenly;
      default:
        return MainAxisAlignment.start;
    }
  }

  static CrossAxisAlignment _parseCrossAxisAlignment(String value) {
    switch (value) {
      case 'start':
        return CrossAxisAlignment.start;
      case 'end':
        return CrossAxisAlignment.end;
      case 'center':
        return CrossAxisAlignment.center;
      case 'stretch':
        return CrossAxisAlignment.stretch;
      case 'baseline':
        return CrossAxisAlignment.baseline;
      default:
        return CrossAxisAlignment.start;
    }
  }

  static Axis _parseAxis(String value) {
    switch (value) {
      case 'horizontal':
        return Axis.horizontal;
      case 'vertical':
        return Axis.vertical;
      default:
        return Axis.horizontal;
    }
  }

  static int parseFlex(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      return 1;
    }
  }

  static FlexFit _parseFlexFit(String value) {
    switch (value) {
      case 'tight':
        return FlexFit.tight;
      case 'loose':
        return FlexFit.loose;
      default:
        return FlexFit.tight;
    }
  }

  static WrapAlignment _parseWrapAlignment(String value) {
    switch (value) {
      case 'start':
        return WrapAlignment.start;
      case 'end':
        return WrapAlignment.end;
      case 'center':
        return WrapAlignment.center;
      case 'spacebetween':
        return WrapAlignment.spaceBetween;
      case 'spacearound':
        return WrapAlignment.spaceAround;
      case 'spaceevenly':
        return WrapAlignment.spaceEvenly;
      default:
        return WrapAlignment.start;
    }
  }
}
