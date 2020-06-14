import 'package:flutter/material.dart';
import 'package:indigo/modules/common/dialog/dialog-video.dart';
import 'package:indigo/modules/common/video-item/video-item.dart';
import 'package:indigo/modules/questionary/models/question-model.dart';
import 'package:indigo/modules/questionary/questionary-content.dart';
import 'package:indigo/modules/questionary/questionary-page.dart';
import 'package:indigo/utils/HoverExtensions.dart';
import 'package:video_player/video_player.dart';

class QuestionaryState extends State<QuestionaryPage> {
  
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  double padValue = 0;
  int currentStep = 1;

  List<Question> questions = <Question>[
    Question(index: 0, order: null, sentence: 'Con este anillo yo te desposo'),
    Question(index: 1, order: null, sentence: 'Una idea absurda, tonta'),
    Question(index: 2, order: null, sentence: 'Quemar a un hereje en la hoguera'),
    Question(index: 3, order: null, sentence: 'Torturar a una persona en un campo de concentración'),
    Question(index: 4, order: null, sentence: 'Una buena comida'),
    Question(index: 5, order: null, sentence: 'Un bebé'),
    Question(index: 6, order: null, sentence: 'Un científico dedicado'),
    Question(index: 7, order: null, sentence: 'Un montón de basura'),
    Question(index: 8, order: null, sentence: 'Un mejoramiento técnico'),
    Question(index: 9, order: null, sentence: 'Una línea de producción en serie'),
    Question(index: 10, order: null, sentence: 'Una multa'),
    Question(index: 11, order: null, sentence: 'Un loco'),
    Question(index: 12, order: null, sentence: 'Amor por la naturaleza'),
    Question(index: 13, order: null, sentence: 'Un genio matemático'),
    Question(index: 14, order: null, sentence: 'Un uniforme'),
    Question(index: 15, order: null, sentence: 'Un corto circuito eléctrico'),
    Question(index: 16, order: null, sentence: 'Hacer estallar un avión con pasajeros en pleno vuelo'),
    Question(index: 17, order: null, sentence: 'Esclavitud'),
  ];

  List<Question> questions2 = <Question>[
    Question(index: 0, order: null, sentence: 'Soy capaz de amar'),
    Question(index: 1, order: null, sentence: 'No me importa saber'),
    Question(index: 2, order: null, sentence: 'Nunca puedo hacer las cosas en forma práctica'),
    Question(index: 3, order: null, sentence: 'Cuando hay orden todo me funciona mejor'),
    Question(index: 4, order: null, sentence: 'Me gusta ganar dinero'),
    Question(index: 5, order: null, sentence: 'Siento que no existe la justicia'),
    Question(index: 6, order: null, sentence: 'No me quiero a mí mismo'),
    Question(index: 7, order: null, sentence: 'Lo que hago siempre es imperfecto'),
    Question(index: 8, order: null, sentence: 'Lo que hago es útil'),
    Question(index: 9, order: null, sentence: 'Vivir en sociedad me desagrada'),
    Question(index: 10, order: null, sentence: 'Lo que pienso funciona en realidad'),
    Question(index: 11, order: null, sentence: 'Me agrada saber'),
    Question(index: 12, order: null, sentence: 'Mi mente es confusa'),
    Question(index: 13, order: null, sentence: 'Me alegra recibir regalos'),
    Question(index: 14, order: null, sentence: 'Odio las cosas que hago'),
    Question(index: 15, order: null, sentence: 'Pienso ordenadamente'),
    Question(index: 16, order: null, sentence: 'Mis ideas nunca funcionan'),
    Question(index: 17, order: null, sentence: 'Mi vida va en la dirección correcta'),
  ];

  List<Question> listSentence;

  double get getWidth {
    return MediaQuery.of(context).size.width;
  }

  double get widthContainer {
    return getWidth > 800 ? getWidth * .50 : getWidth * .90;
  }

  double get widthContainerHeader {
    return getWidth > 944 ? getWidth * .50 : getWidth * .90;
  }

  double get widthDescriptionVideo {
    double result = getWidth > 800 ? ((getWidth * .50) * .60 - 15.0) : widthContainer;
    return result > 340 ? result : getWidth;
  }

  double get widthButtonVideo {
    double result = getWidth > 800 ? (getWidth * .50) * .40 : getWidth;
    return result > 237 ? result : getWidth;
  }

  void updateList(int oldIndex, int newIndex) {
    
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    updateListItems(oldIndex, newIndex);
  }

  void updateListItems(int oldIndex, int newIndex) {
    final oldValue = listSentence.asMap()[oldIndex];
    final newValue = listSentence.asMap()[newIndex];

    final sentenceOldValue = oldValue.toJson()['sentence'];
    final sentenceNewValue = newValue.toJson()['sentence'];

    setState(() {
      listSentence.asMap().forEach((index, item) => {
        if (index == oldIndex) {
          item.order = index + 1,
          item.sentence = sentenceNewValue
        } else if (index == newIndex) {
          item.order = index + 1,
          item.sentence = sentenceOldValue
        }
      });  
    });

    /*final Question item = questions.removeAt(oldIndex);
    item.order = newIndex + 1;
    item.index = newIndex;

    questions.insert(newIndex, item);*/
  }

  void changeOrderItem(int value, Question item) {
    item.order = value;
    this.updateListItems(item.index, value - 1);
  }

  void changeStep() {
    setState(() {
      if (currentStep == 2) {
        this.listSentence = questions;
        currentStep = 1;
      } else {
        this.listSentence = questions2;
        currentStep = 2;
      }
    });
  }

  void beforeStep() {
    setState(() {
      if (currentStep == 2) {
        this.listSentence = questions;
        currentStep = 1;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    listSentence = questions;
  }

  void showSlide() {
    scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(getWidth, 200),
        child: Container(
          height: 70.0,
          width: getWidth,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Container(
              width: widthContainerHeader,
              height: 70.0,
              child: getWidth > 600 ? Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Text('Horkest $getWidth', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 35.0))
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: FlatButton.icon(
                          color: Colors.black,
                          icon: Icon(Icons.play_circle_outline, color: Colors.white),
                          label: Text('VER VIDEO INSTRUCTIVO', style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            showDialogVideo(context, VideoItem(
                                      videoPlayerController: VideoPlayerController.asset('assets/videos/Axiologia.mp4'),
                                    ), widthContainer);
                          },
                        ).showCursorOnHover,
                      ),
                    ),
                  )
                ],
              ) : Center(
                child: Text('Horkest $getWidth', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 35.0))
              ),
            ),
          ),
        )
      ),
      drawer: Container(
        color: Colors.red,
        width: 300,
      ),
      body: QuestionaryContent(questionaryState: this),
    );
  }
}