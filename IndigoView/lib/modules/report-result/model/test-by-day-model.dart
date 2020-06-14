import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class TestByDayModel {
    final String day;
    final int count;
    final charts.Color color;
    TestByDayModel(this.day, this.count, Color color) : this.color = new charts.Color(r: color.red, g: color.green, b: color.blue, a: color.alpha);
}