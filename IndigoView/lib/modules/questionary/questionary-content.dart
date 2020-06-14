import 'package:flutter/material.dart';
import 'package:indigo/modules/common/lists/order/list-order.dart';
import 'package:indigo/utils/HexColor.dart';
import 'questionary-state.dart';
import 'package:indigo/utils/HoverExtensions.dart';

class QuestionaryContent extends StatelessWidget {
  
  final QuestionaryState questionaryState;

  const QuestionaryContent({Key key, @required this.questionaryState});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        children: <Widget>[
          Container(
            color: HexColor.fromHex('#f5f6fa'),
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              minHeight: 100,
              maxHeight: double.infinity
            ),
            child: Center(
              child: Container(
                width: questionaryState.widthContainer,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Selecciona el número uno ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: '(1)', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' en la frase que tú consideras'),
                        TextSpan(text: ' mejor o más valiosa', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ', y así sucesivamente hasta llegar al dieciocho '),
                        TextSpan(text: '(18)', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ', que es la fraseque para ti representa lo '),
                        TextSpan(text: 'peor o lo más malo', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: '.')
                      ]
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                width: questionaryState.widthContainer,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 35.0, 0, 10.0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      child: Text(
                        questionaryState.currentStep == 1 ? 'PRIMERA PARTE' : 'SEGUNDA PARTE', 
                        key: ValueKey('text${questionaryState.currentStep}'), 
                        style: TextStyle(
                          fontWeight: FontWeight.w700, 
                          color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                )
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 850.0,
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 5.0),
                child: Container(
                  width: questionaryState.widthContainer,
                  height: 850.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 850.0,
                        width: (questionaryState.widthContainer - 30.0),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 600),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            final positionChil = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(animation);

                            return ClipRect(
                              child: SlideTransition(
                                position: positionChil,
                                child: child,
                              ),
                            );
                          },
                          child: ListOrder(key: ValueKey(questionaryState.currentStep), list: questionaryState.listSentence, changeOrder: questionaryState.changeOrderItem, reorder: questionaryState.updateList),
                        ),
                      ),
                      Container(
                        height: 850.0,
                        width: 15.0,
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(3.0, 0.0, 0.0, 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft, // 10% of the width, so there are ten blinds.
                                colors: [Colors.green, Colors.yellow, Colors.red], // whitish to gray
                                tileMode: TileMode.repeated, // repeats the gradient over the canvas
                              ),
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              minHeight: 50,
              maxHeight: double.infinity
            ),
            child: Center(
              child: Container(
                width: questionaryState.widthContainer,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 30.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: questionaryState.widthContainer * .30,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: FlatButton(
                            onPressed: questionaryState.beforeStep,
                            child: Text('REGRESAR', style: TextStyle(color: Colors.white)),
                            color: Colors.grey,
                          ).showCursorOnHover,
                        ),
                      ),
                      Container(
                        width: questionaryState.widthContainer * .30,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: FlatButton(
                            onPressed: questionaryState.changeStep,
                            child: Text(questionaryState.currentStep == 1 ? 'SEGUNDA PARTE' : 'TERMINAR Y ENVIAR', style: TextStyle(color: Colors.white)),
                            color: Theme.of(context).primaryColor,
                          ).showCursorOnHover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}