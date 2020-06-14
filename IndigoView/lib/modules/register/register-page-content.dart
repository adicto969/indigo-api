import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indigo/modules/common/dialog/dialog-video.dart';
import 'package:indigo/modules/common/video-item/video-item.dart';
import 'package:indigo/utils/CreateInput.dart';
import 'package:indigo/utils/HexColor.dart';
import 'register-page-state.dart';
import 'package:indigo/utils/HoverExtensions.dart';
import 'package:video_player/video_player.dart';

class RegisterPageContent extends StatelessWidget {
  final RegisterPageState registerPageState;

  const RegisterPageContent({Key key, this.registerPageState});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        children: <Widget>[
          Container(
            color: HexColor.fromHex('#f5f6fa'),
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
                minHeight: 300,
                maxHeight: double.infinity
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                        child: Text('OBJETIVO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(width: 80.0, height: 4.0, color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                    child: Column (
                      children: <Widget>[
                        Text ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec interdum est, non cursus nulla. Donec cursus elit eu magna lobortis interdum. Proin ut feugiat ex. Proin nec lacus consequat, vestibulum diam at, venenatis semLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec interdum est, non cursus nulla. Donec cursus elit eu magna lobortis interdum. Proin ut feugiat ex. Proin nec lacus consequat, vestibulum diam at, venenatis sem', textAlign: TextAlign.left)
                      ],
                    ),
                  )
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15.0, 0, 40.0),
                    child: Column (
                      children: <Widget>[
                        Text ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec interdum est, non cursus nulla. Donec cursus elit eu magna lobortis interdum. Proin ut feugiat ex. Proin nec lacus consequat, vestibulum diam at, venenatis semLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec interdum est, non cursus nulla. Donec cursus elit eu magna lobortis interdum. Proin ut feugiat ex. Proin nec lacus consequat, vestibulum diam at, venenatis sem', textAlign: TextAlign.left)
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              minHeight: 300,
              maxHeight: double.infinity
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                        child: Text('INSTRUCCIONES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(width: 80.0, height: 4.0, color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 8.0, 
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                                  child: Column (
                                    children: <Widget>[
                                      Text ('Llena tus datos para acceder a la prueba.', textAlign: TextAlign.left)
                                    ],
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 8.0, 
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                                  child: Column (
                                    children: <Widget>[
                                      Text ('Lee cuidadosamente las instrucciones y asegúrate de enterderlas antes de comenzar.', textAlign: TextAlign.left)
                                    ],
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 8.0, 
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                                  child: Column (
                                    children: <Widget>[
                                      Text ('Si hay alguna palabra que no entiendas, sugerimos que busques el significado en Internet.', textAlign: TextAlign.left)
                                    ],
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 8.0, 
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                                  child: Column (
                                    children: <Widget>[
                                      Text ('Llena la prueba en un momento en el que estés lo más tranquilo(a) posible y sin distracciones.', textAlign: TextAlign.left)
                                    ],
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 8.0, 
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                                  child: Column (
                                    children: <Widget>[
                                      Text ('Decide rápidamente; tu reacción inicial será la que mejor refleje quien eres.', textAlign: TextAlign.left)
                                    ],
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 8.0, 
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                                  child: Column (
                                    children: <Widget>[
                                      Text ('No hay tiempo límite. La mayoría de las personas pueden terminar en 20 minutos.', textAlign: TextAlign.left)
                                    ],
                                  ),
                                )
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                    child: Column (
                      children: <Widget>[
                        Text ('En las siguientes dos páginas encontrarás 18 frases y 18 citas que refieren a situaciones consideradas como significativas o valiosas, o bien que expresan valores negativos.', textAlign: TextAlign.left)
                      ],
                    ),
                  )
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                    child: Column (
                      children: <Widget>[
                        RichText(
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
                        )
                      ],
                    ),
                  )
                ),
                Container(
                  width: registerPageState.widthContainer,
                  margin: EdgeInsets.only(bottom: 45.0),
                  constraints: BoxConstraints(
                    minHeight: registerPageState.widthButtonVideo == registerPageState.getWidth ? 120.0 : 100.0,
                    maxHeight: double.infinity
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center (
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          width: registerPageState.widthDescriptionVideo,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10.0, 0, 0, registerPageState.widthButtonVideo == registerPageState.getWidth ? 15.0 : 0),
                              child: Column (
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(color: Colors.white),
                                      children: <TextSpan>[
                                        TextSpan(text: 'IMPORTANTE:', style: TextStyle(fontWeight: FontWeight.bold)),
                                        TextSpan(text: ' Los números'),
                                        TextSpan(text: ' NO', style: TextStyle(fontWeight: FontWeight.bold)),
                                        TextSpan(text: ' podrán tener un mismo número; tendrás que decidir cuál es mejor o peor para ti.')
                                      ]
                                    ),
                                  )
                                ],
                              ),
                            )
                          ),
                        ),
                        Container(
                          width: registerPageState.widthButtonVideo,
                          child: Center(
                            child: Container(
                              width: 300.0,
                              height: 40.0,
                              child: Center(
                                child:  FlatButton.icon(
                                  color: Colors.black,
                                  icon: Icon(Icons.play_circle_outline, color: Colors.white,),
                                  label: Text('VER VIDEO INSTRUCTIVO', style: TextStyle(color: Colors.white),),
                                  onPressed: () {
                                    //Code to execute when Floating Action Button is clicked
                                    //...
                                    showDialogVideo(context, VideoItem(
                                      videoPlayerController: VideoPlayerController.asset('assets/videos/Axiologia.mp4'),
                                    ), registerPageState.widthContainer);
                                  },
                                ).showCursorOnHover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: HexColor.fromHex('#f5f6fa'),
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              minHeight: 300.0,
              maxHeight: double.infinity
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                        child: Text('DATOS GENERALES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(width: 80.0, height: 4.0, color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text ('Llena correctamente los campos.', textAlign: TextAlign.left)
                      ],
                    ),
                  )
                ),
                Container(
                  child: Form(
                    key: registerPageState.formKey,
                    child: Column(
                      children: <Widget>[
                        CreateInput(
                          width: registerPageState.widthContainer,
                          label: 'Nombre*',
                          placeholder: 'Ingresa tu nombre',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'name');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Apellido Paterno*',
                          placeholder: 'Ingresa tu apellido paterno',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'lastName');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Apellido Materno*',
                          placeholder: 'Ingresa tu apellido materno',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'secondLastName');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Correo electrónico*',
                          placeholder: 'Ingresa tu dirección de correo',
                          validator: registerPageState.validEmail,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'email');
                          },
                        ),
                        Container(
                          width: registerPageState.widthContainer,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                            child: Row(
                              children: <Widget>[
                                Text('He leído y entendido las instrucciones', style: TextStyle(color: registerPageState.readerColor)),
                                Checkbox(
                                  value: registerPageState.reader,
                                  onChanged: registerPageState.chageReader
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: registerPageState.widthContainer,
                          child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                            child: SizedBox(
                                width: double.infinity,
                                child: FlatButton(
                                        onPressed: registerPageState.submit,
                                        child: Text(
                                          'COMENZAR PRUEBA',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        color: Theme.of(context).primaryColor
                                ).showCursorOnHover)
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  margin: EdgeInsets.only(bottom: 45.0)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
