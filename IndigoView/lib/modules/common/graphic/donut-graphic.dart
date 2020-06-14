import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DonutGraphic extends StatelessWidget {
  final List<charts.Series> data;
  final arcWidth;

  const DonutGraphic({Key key, this.data, this.arcWidth = 80 }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
        this.data,
        animate: true,
        defaultRenderer: new charts.ArcRendererConfig(
                          arcWidth: this.arcWidth,
                          arcRendererDecorators: [
                            new charts.ArcLabelDecorator()
                          ]),
    );
  }
}