import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  final bool answer;
  final VoidCallback _onTap;  //funzione dove non dobbiamo ritornare niente

  AnswerButton(this.answer, this._onTap);

  @override
  Widget build(BuildContext context){
    return new Expanded(
      child: new Material( //true button
        color: answer == true ? Colors.greenAccent : Colors.redAccent,
        child: InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.white, width: 5.0)
              ),
              padding: new EdgeInsets.all(20.0),
              child: new Text(answer == true ? "True" : "False",
              style: new TextStyle(color: Colors.white, fontSize: 40.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
            )
          ),
        ),
      )
    );
  }
}