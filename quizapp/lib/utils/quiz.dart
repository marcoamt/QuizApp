import 'package:quizapp/utils/question.dart';

class Quiz{
  List<Question> _questions;  //_ è il private
  int _currentQuestionIndex = -1;
  int _score = 0;

  Quiz(this._questions){
    _questions.shuffle();  //prende una domanda random
  }

  List<Question> get questions => _questions;
  int get lenght => _questions.length;
  int get questionNumber => _currentQuestionIndex + 1;
  int get score => _score;

  Question get nextQuestion{
    _currentQuestionIndex++;
    if(_currentQuestionIndex >= lenght) return null;
    return _questions[_currentQuestionIndex];
  }

  void answer(bool isCorrect){
    if(isCorrect) _score++;
  }
}