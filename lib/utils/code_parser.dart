import 'package:flutter/material.dart';

class CodeParser {
  static Widget parseCode(String code, List<Widget> frogs) {
    // Remove extra whitespace and normalize the code
    code = code.trim().toLowerCase().replaceAll('\n', ' ');

    try {
      // Parse the outermost widget
      return _parseWidget(code, frogs);
    } catch (e) {
      // Return a centered error message if parsing fails
      return Center(
        child: Text(
          'Invalid code: ${e.toString()}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }
  }

  static Widget _parseWidget(String code, List<Widget> frogs) {
    // Extract widget name and content
    final match = RegExp(r'(\w+)\s*\((.*)\)').firstMatch(code);
    if (match == null) throw 'Invalid widget format';

    final widgetName = match.group(1)!;
    final content = match.group(2)!;

    // Parse properties and children
    final properties = _parseProperties(content);
    final children = _parseChildren(properties.remove('children') ?? '', frogs);

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

  static List<Widget> _parseChildren(String childrenStr, List<Widget> frogs) {
    if (childrenStr.isEmpty) return [];

    // Extract content between square brackets
    final bracketMatch = RegExp(r'\[(.*)\]').firstMatch(childrenStr);
    if (bracketMatch == null) throw 'Invalid children format';

    final childrenContent = bracketMatch.group(1)!;
    final children = <Widget>[];
    int frogIndex = 0;

    // Split by commas, but respect nested brackets
    final childItems = _splitByTopLevelCommas(childrenContent);

    for (final child in childItems) {
      final trimmed = child.trim();
      if (trimmed.startsWith('frog')) {
        if (frogIndex >= frogs.length) {
          throw 'Too many frogs specified';
        }
        children.add(frogs[frogIndex++]);
      } else if (trimmed.isNotEmpty) {
        // Recursively parse nested widgets
        children.add(_parseWidget(trimmed, frogs.sublist(frogIndex)));
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
      case 'center':
        return MainAxisAlignment.center;
      case 'end':
        return MainAxisAlignment.end;
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
      case 'center':
        return CrossAxisAlignment.center;
      case 'end':
        return CrossAxisAlignment.end;
      case 'stretch':
        return CrossAxisAlignment.stretch;
      default:
        return CrossAxisAlignment.start;
    }
  }
}
