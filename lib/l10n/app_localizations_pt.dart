// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Flutter Sapo Flex';

  @override
  String get levelSelectTitle => 'Flutter Sapo Flex - Níveis';

  @override
  String levelNumber(int number) {
    return 'Nível $number';
  }

  @override
  String get congratulations => 'Parabéns! 🎉';

  @override
  String levelCompleted(int number) {
    return 'Você completou o nível $number!';
  }

  @override
  String get nextLevel => 'Próximo Nível';

  @override
  String get gameComplete => '🏆 Jogo Completo! 🏆';

  @override
  String get gameCompleteMessage =>
      'Parabéns! Você dominou os layouts do Flutter!';

  @override
  String get playAgain => 'Jogar Novamente';

  @override
  String get resetTooltip => 'Resetar para código original';

  @override
  String get formatTooltip => 'Formatar código';

  @override
  String get codeHint => 'Digite seu código de layout Flutter aqui...';

  @override
  String get checkingSolution => 'Verificando solução...';

  @override
  String get codeFormattingFailed =>
      'Formatação do código falhou - verifique sua sintaxe';

  @override
  String get level1Instructions =>
      'Centralize os sapos verticalmente usando Column e mainAxisAlignment.';

  @override
  String get level1Explanation =>
      'Widgets Column organizam seus filhos verticalmente. mainAxisAlignment controla o posicionamento vertical.';

  @override
  String get level2Instructions =>
      'Centralize os sapos horizontalmente usando Row e mainAxisAlignment.';

  @override
  String get level2Explanation =>
      'Widgets Row organizam seus filhos horizontalmente. mainAxisAlignment controla o posicionamento horizontal.';

  @override
  String get level3Instructions =>
      'Distribua os sapos uniformemente usando Row e mainAxisAlignment.';

  @override
  String get level3Explanation =>
      'Use spaceEvenly para distribuir widgets com espaçamento igual ao redor deles.';

  @override
  String get level4Instructions =>
      'Organize os sapos horizontalmente com espaçamento igual usando Row e mainAxisAlignment.';

  @override
  String get level4Explanation =>
      'Widgets Row organizam seus filhos horizontalmente. Use spaceBetween para distribuí-los com espaçamento igual.';

  @override
  String get level5Instructions =>
      'Posicione os sapos na parte inferior usando Column e mainAxisAlignment.';

  @override
  String get level5Explanation =>
      'Use mainAxisAlignment: MainAxisAlignment.end para posicionar itens na parte inferior de uma Column.';

  @override
  String get level6Instructions =>
      'Centralize os sapos tanto horizontal quanto verticalmente usando Column e Row aninhados.';

  @override
  String get level6Explanation =>
      'Você pode aninhar Row dentro de Column para controlar tanto o alinhamento horizontal quanto vertical.';

  @override
  String get level7Instructions =>
      'Posicione os sapos na parte inferior com espaçamento igual usando widgets aninhados.';

  @override
  String get level7Explanation =>
      'Combine Column e Row com diferentes propriedades de alinhamento para conseguir layouts complexos.';

  @override
  String get level8Instructions =>
      'Organize os sapos verticalmente usando Column.';

  @override
  String get level8Explanation =>
      'Widgets Column organizam seus filhos verticalmente de cima para baixo.';

  @override
  String get level9Instructions =>
      'Posicione os sapos na parte inferior usando Flex e propriedades de direção.';

  @override
  String get level9Explanation =>
      'Widgets Flex podem ser configurados para funcionar como Row ou Column usando a propriedade direction.';

  @override
  String get syntaxErrorInvalidWidget =>
      'Sintaxe inválida: Use um formato válido de widget Flutter como \"row(...)\" ou \"column(...)\" ou \"flex(...)\"';

  @override
  String syntaxErrorUnknownWidget(String widgetName) {
    return 'Widget inválido: \"$widgetName\" não é um widget Flutter válido. Use \"row\" ou \"column\" ou \"flex\".';
  }

  @override
  String get syntaxErrorMismatchedParentheses =>
      'Erro de sintaxe: Parênteses desbalanceados no seu código.';

  @override
  String get syntaxErrorMissingBrackets =>
      'Erro de sintaxe: Children devem estar dentro de colchetes [...].';

  @override
  String get syntaxErrorMissingCommaAfterMainAxis =>
      'Vírgula faltando após mainAxisAlignment. Exemplo: \"mainAxisAlignment: start,\"';

  @override
  String get syntaxErrorMissingCommaAfterCrossAxis =>
      'Vírgula faltando após crossAxisAlignment. Exemplo: \"crossAxisAlignment: start,\"';

  @override
  String get syntaxErrorMissingCommaAfterDirection =>
      'Vírgula faltando após direction. Exemplo: \"direction: horizontal,\"';

  @override
  String get syntaxErrorMissingCommaBetweenProperties =>
      'Vírgula faltando entre propriedades. Cada propriedade deve terminar com vírgula.';

  @override
  String get syntaxErrorMissingCommaAfterChildren =>
      'Vírgula faltando após array de children. Exemplo: \"children: [frog()],\"';

  @override
  String get syntaxErrorMissingColon =>
      'Dois pontos faltando após nome da propriedade. Exemplo: \"direction: horizontal\"';

  @override
  String syntaxErrorInvalidAlignment(String value) {
    return 'Valor de alinhamento inválido \"$value\". Use: start, end, center, spaceBetween, spaceAround, ou spaceEvenly.';
  }

  @override
  String syntaxErrorInvalidDirection(String value) {
    return 'Valor de direção inválido \"$value\". Use: horizontal ou vertical.';
  }

  @override
  String get syntaxErrorMissingParentheses =>
      'Parênteses faltando após frog. Use \"frog()\" ao invés de \"frog\".';

  @override
  String solutionIncorrectFrogCount(int expected, int found) {
    return 'Número incorreto de sapos. Esperado $expected sapos, mas encontrou $found.';
  }

  @override
  String solutionMismatchedCount(int frogCount, int lilypadCount) {
    return 'Número de sapos ($frogCount) não corresponde ao número de vitórias-régias ($lilypadCount).';
  }

  @override
  String get solutionSuccess =>
      'Excelente trabalho! Você completou este nível!';

  @override
  String get solutionIncorrectPlacement =>
      'Não está certo ainda. Certifique-se de que cada sapo está na vitória-régia da cor correspondente.';

  @override
  String solutionCodeError(String error) {
    return 'Houve um erro no seu código: $error';
  }
}
