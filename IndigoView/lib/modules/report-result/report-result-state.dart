import 'package:flutter/material.dart';
import 'package:indigo/modules/common/responsive/screenResponsive.dart';
import 'package:indigo/modules/report-result/model/isps-model.dart';
import 'package:indigo/modules/report-result/model/test-by-day-model.dart';
import 'package:indigo/modules/report-result/model/test-by-gender-model.dart';
import 'package:indigo/modules/report-result/report-result-content.dart';
import 'package:indigo/modules/report-result/report-result-page.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:indigo/utils/HexColor.dart';

class ReportResultState extends State<ReportResultPage> with SingleTickerProviderStateMixin {

  GlobalKey<ScaffoldState> keyScaffold = new GlobalKey<ScaffoldState>();
  GlobalKey keyTabBar = new GlobalKey();
  GlobalKey keyTabBarView = new GlobalKey();
  TabController tabController;
  List<charts.Series> seriesList;
  List<charts.Series> testsPerDay;
  List<ISPSModel> entornoList;
  List<ISPSModel> indentidadList;
  List<ISPSModel> saludList;
  TextStyle styleTimes = TextStyle(fontWeight: FontWeight.bold, fontSize: 22, fontFamily: 'NunitoSansBack');
  TextStyle styleTimesLabel = TextStyle(color: HexColor.fromHex('#3e48ac'), fontSize: 11, fontWeight: FontWeight.w900);

  ScreenResponsive screen;

  @override
  void initState() {
    super.initState();
    this.screen = new ScreenResponsive(context);
    tabController = new TabController(length: 2, vsync: this);
    seriesList = <charts.Series<TestByGenderModel, String>>[
      charts.Series(
        id: 'Tests',
        domainFn: (TestByGenderModel test, _) => test.gender,
        measureFn: (TestByGenderModel test, _) => test.count,
        data: [
          TestByGenderModel('Mujeres', 6, HexColor.fromHex('#3e48ac')),
          TestByGenderModel('Hombre', 3, HexColor.fromHex('#a3aac4'))
        ],
        colorFn: (TestByGenderModel test, _) => test.color,
        labelAccessorFn: (TestByGenderModel test, _) => '${test.count}',
      )
    ];

    testsPerDay = <charts.Series<TestByDayModel, String>>[
      charts.Series(
        id: 'Days',
        domainFn: (TestByDayModel day, _) => day.day,
        measureFn: (TestByDayModel day, _) => day.count,
        data: [
          TestByDayModel('Lunes', 10, HexColor.fromHex('#3e48ac')),
          TestByDayModel('Martes', 3, HexColor.fromHex('#3e48ac')),
          TestByDayModel('Miercoles', 7, HexColor.fromHex('#3e48ac')),
          TestByDayModel('Jueves', 5, HexColor.fromHex('#3e48ac')),
          TestByDayModel('Viernes', 9, HexColor.fromHex('#3e48ac')),
          TestByDayModel('Sabado', 10, HexColor.fromHex('#3e48ac')),
          TestByDayModel('Domingo', 1, HexColor.fromHex('#3e48ac'))
        ],
        colorFn: (TestByDayModel day, _) => day.color,
        labelAccessorFn: (TestByDayModel day, _) => '${day.count}'
      )
    ];
  
    entornoList = <ISPSModel>[
      ISPSModel(color: HexColor.fromHex('#ffb822'), label: 'Empatía', value: 5.0),
      ISPSModel(color: HexColor.fromHex('#ffb822'), label: 'Resolución de Problemas', value: 5.6),
      ISPSModel(color: HexColor.fromHex('#ffb822'), label: 'Distinción Positivo/Negativo', value: 6.7),
      ISPSModel(color: HexColor.fromHex('#f14b4b'), label: 'Adaptación al Cambio', value: 7.3)
    ];
    indentidadList = <ISPSModel>[
      ISPSModel(color: HexColor.fromHex('#ffb822'), label: 'Autoestima', value: 5.0),
      ISPSModel(color: HexColor.fromHex('#ffb822'), label: 'Aceptación del Mundo', value: 5.6),
      ISPSModel(color: HexColor.fromHex('#ffb822'), label: 'Control Emocional', value: 6.7),
      ISPSModel(color: HexColor.fromHex('#f14b4b'), label: 'Sentida de Autologro', value: 7.3),
      ISPSModel(color: HexColor.fromHex('#f14b4b'), label: 'Autoexigencia', value: 7.3)
    ];
    saludList = <ISPSModel>[
      ISPSModel(color: HexColor.fromHex('#f14b4b'), label: 'Ansiedad', value: 5.0),
      ISPSModel(color: HexColor.fromHex('#f14b4b'), label: 'Depresión', value: 5.6)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyScaffold,
      body: ReportResultContent(state: this),
    );
  }
}