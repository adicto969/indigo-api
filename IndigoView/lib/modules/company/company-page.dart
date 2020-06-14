import 'package:flutter/material.dart';
import 'company-page-state.dart';

class CompanyPage extends StatefulWidget {
  
  final String title;

  CompanyPage({Key key, this.title = ''}) : super(key: key);

  @override
  CompanyPageState createState() => CompanyPageState();
}