import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:quizapp/utils/question.dart';
import 'package:quizapp/utils/quiz.dart';
import '../ui/answer_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';

//stateful perchè cambia il suo stato, è mutabile grazie alla estensione sotto dello state
class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage>{

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("You are human", true),
    new Question("false", false),
    new Question("flutter is awesome", true),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;

  @override
  void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState((){
      overlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          //pagina principale
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false))
          ]
        ),
        overlayVisible == true ? new CorrectWrongOverlay(
          isCorrect,
          (){
            currentQuestion = quiz.nextQuestion;
            this.setState((){
              overlayVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          } 
          ) : new Container(),
      ],
    );
  }
}