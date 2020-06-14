import 'package:flutter/material.dart';
import 'package:indigo/modules/common/responsive/screenResponsive.dart';
import 'package:indigo/modules/tests/models/test-model.dart';
import 'package:indigo/modules/tests/tests-content.dart';
import 'package:indigo/modules/tests/tests-page.dart';

class TestsState extends State<TestsPage> {

  GlobalKey<ScaffoldState> keyScaffold = new GlobalKey<ScaffoldState>();

  ScreenResponsive screen;
  List<TestModel> tests = new List<TestModel>();

  @override
  void initState() {
    super.initState();
    this.screen = new ScreenResponsive(context);
    this.tests = <TestModel>[
      TestModel(name: 'Nombre 1', model: 'Modelo 4', sponsor: 'Índigo', client: 'Reto Zapopan', dateStart: new DateTime(2020, 1, 31), dateEnd: new DateTime(2020, 2, 29), status: 'Activa' ),
      TestModel(name: 'Nombre 2', model: 'Aleatorio', sponsor: 'Coca Cola', client: 'Sprite', dateStart: new DateTime(2020, 1, 31), dateEnd: new DateTime(2020, 2, 29), status: 'Inactiva' ),
      TestModel(name: 'Nombre 3', model: 'Personalizado', sponsor: 'Coca Cola', client: 'Fanta', dateStart: new DateTime(2020, 2, 1), dateEnd: new DateTime(2020, 3, 5), status: 'Activa' ),
      TestModel(name: 'Nombre 4', model: 'Modelo 1', sponsor: 'Índigo', client: 'Mirka', dateStart: new DateTime(2020, 2, 31), dateEnd: new DateTime(2020, 3, 29), status: 'Pausada' )
    ];
  }

  double get widthMenu {
    return screen.isDesktop ? 80 : 0;
  }

  void sortTests(int i, bool b) {
    print("order ");
    setState(() {
      tests.sort((x, y) => x.name.compareTo(y.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyScaffold,
      body: TestsContent(state: this),
    );
  }
}