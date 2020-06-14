import 'package:flutter/material.dart';
import 'package:indigo/modules/report-result/report-result-page.dart';
import 'package:indigo/utils/HexColor.dart';

class ReportResultModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indigo',
      theme: ThemeData(
        primaryColor: HexColor.fromHex('#3742b6'),
        fontFamily: 'NunitoSans'
      ),
      home: ReportResultPage(title: 'Reporte de Resultados'),
      debugShowCheckedModeBanner: false,
    );
  }
}