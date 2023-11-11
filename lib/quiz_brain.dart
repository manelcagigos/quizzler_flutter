import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
        questText: 'Some cats are actually allergic to humans',
        questAnswer: true),
    Question(
        questText: 'You can lead a cow down stairs but not up stairs.',
        questAnswer: false),
    Question(
        questText: 'Approximately one quarter of human bones are in the feet.',
        questAnswer: true),
    Question(questText: 'A slug\'s blood is green.', questAnswer: true),
    Question(
        questText: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
        questAnswer: true),
    Question(
        questText: 'It is illegal to pee in the Ocean in Portugal.',
        questAnswer: true),
    Question(
        questText:
            'No piece of square dry paper can be folded in half more than 7 times.',
        questAnswer: false),
    Question(
        questText:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        questAnswer: true),
    Question(
        questText:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        questAnswer: false),
    Question(
        questText:
            'The total surface area of two human lungs is approximately 70 square metres.',
        questAnswer: true),
    Question(
        questText: 'Google was originally called "Backrub".',
        questAnswer: true),
    Question(
        questText:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        questAnswer: true),
    Question(
        questText:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        questAnswer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
