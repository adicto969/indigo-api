import 'package:flutter/material.dart';
import 'package:indigo/modules/report-result/report-result-state.dart';

class ReportResultPage extends StatefulWidget {

  final String title;

  ReportResultPage({Key key, this.title = ''}) : super(key: key);

  @override
  ReportResultState createState() => ReportResultState();
}