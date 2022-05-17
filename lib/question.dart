import 'package:meta/meta.dart';

@immutable
class Question {
  final String questionText;
  final bool questionAnswer;

  const Question(this.questionText, this.questionAnswer);
}
