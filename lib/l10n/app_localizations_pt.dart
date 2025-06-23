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
  String levelNumber(Object number) {
    return 'Nível $number';
  }

  @override
  String get congratulations => 'Parabéns! 🎉';

  @override
  String levelCompleted(Object number) {
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
      'Bem-vindo ao Flutter Sapo Flex! Seu objetivo é guiar o sapo até a vitória-régia à direita.\n\nUse a propriedade mainAxisAlignment para posicionar itens horizontalmente em Row. Tente mudar mainAxisAlignment de start para end.';

  @override
  String get level2Instructions =>
      'Ajude os sapos a alcançarem suas vitórias-régias no centro.\n\nA propriedade mainAxisAlignment aceita estes valores:\n• start - alinha à esquerda\n• end - alinha à direita\n• center - centraliza os itens';

  @override
  String get level3Instructions =>
      'Espalhe os sapos uniformemente pelo lago.\n\nUse mainAxisAlignment: spaceEvenly para distribuir itens com espaçamento igual ao redor deles, similar ao CSS justify-content: space-evenly.';

  @override
  String get level4Instructions =>
      'Posicione os sapos com espaço apenas entre eles.\n\nUse mainAxisAlignment: spaceBetween para colocar espaçamento igual entre itens, mas não nas bordas.';

  @override
  String get level5Instructions =>
      'Mova os sapos para a parte inferior do lago.\n\nColumn organiza filhos verticalmente. Use mainAxisAlignment: end para posicionar itens na parte inferior de uma Column.';

  @override
  String get level6Instructions =>
      'Centralize o sapo tanto horizontal quanto verticalmente.\n\nAninhe um Row dentro de uma Column para controlar ambos os eixos:\n• mainAxisAlignment da Column controla posicionamento vertical\n• mainAxisAlignment da Row controla posicionamento horizontal';

  @override
  String get level7Instructions =>
      'Posicione os sapos na parte inferior com espaçamento igual entre eles.\n\nCombine Column e Row:\n• Use Column com mainAxisAlignment: end para posicionamento inferior\n• Use Row com mainAxisAlignment: spaceBetween para espaçamento horizontal';

  @override
  String get level8Instructions =>
      'Empilhe os sapos verticalmente.\n\nColumn organiza filhos de cima para baixo, como CSS flex-direction: column. Este é o equivalente vertical de Row.';

  @override
  String get level9Instructions =>
      'Use Flex para posicionar os sapos na parte inferior.\n\nFlex é o widget base tanto para Row quanto para Column:\n• direction: horizontal cria um Row\n• direction: vertical cria um Column\n• Use mainAxisAlignment: end para posicionar na parte inferior';

  @override
  String get syntaxErrorInvalidWidget =>
      'Sintaxe inválida: Use um formato válido de widget Flutter como \"row(...)\" ou \"column(...)\" ou \"flex(...)\"';

  @override
  String syntaxErrorUnknownWidget(Object widgetName) {
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
  String syntaxErrorInvalidAlignment(Object value) {
    return 'Valor de alinhamento inválido \"$value\". Use: start, end, center, spaceBetween, spaceAround, ou spaceEvenly.';
  }

  @override
  String syntaxErrorInvalidDirection(Object value) {
    return 'Valor de direção inválido \"$value\". Use: horizontal ou vertical.';
  }

  @override
  String get syntaxErrorMissingParentheses =>
      'Parênteses faltando após frog. Use \"frog()\" ao invés de \"frog\".';

  @override
  String solutionIncorrectFrogCount(Object expected, Object found) {
    return 'Número incorreto de sapos. Esperado $expected sapos, mas encontrou $found.';
  }

  @override
  String solutionMismatchedCount(Object frogCount, Object lilypadCount) {
    return 'Número de sapos ($frogCount) não corresponde ao número de vitórias-régias ($lilypadCount).';
  }

  @override
  String get solutionSuccess =>
      'Excelente trabalho! Você completou este nível!';

  @override
  String get solutionIncorrectPlacement =>
      'Não está certo ainda. Certifique-se de que cada sapo está na vitória-régia da cor correspondente.';

  @override
  String solutionCodeError(Object error) {
    return 'Houve um erro no seu código: $error';
  }
}
