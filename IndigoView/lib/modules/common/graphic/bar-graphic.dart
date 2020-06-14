import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_common/src/common/color.dart' as colorBar;
import 'package:indigo/utils/HexColor.dart';

class BarGraphic extends StatelessWidget {
  final List<charts.Series> data;
  static Color colorBackgroundBar = HexColor.fromHex('#e5e8f0');

  const BarGraphic({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      this.data,
      animate: true,
      barGroupingType: charts.BarGroupingType.grouped,
      behaviors: [
        new charts.DomainHighlighter(),
        new charts.PercentInjector(
            totalType: charts.PercentInjectorTotalType.series)
      ],
      primaryMeasureAxis: new charts.PercentAxisSpec(
        tickProviderSpec: new charts.BasicNumericTickProviderSpec(
          dataIsInWholeNumbers: false,
          desiredTickCount: 6,
          zeroBound: true
        )
      ),
      defaultInteractions: false,
      defaultRenderer: new charts.BarLaneRendererConfig(
        barRendererDecorator: new charts.BarLabelDecorator<String>(),
        mergeEmptyLanes: false,
        //border radius
        //cornerStrategy: const charts.ConstCornerStrategy(30),
        backgroundBarColor: colorBar.Color(r: colorBackgroundBar.red, g: colorBackgroundBar.green, b: colorBackgroundBar.blue, a: 200),
      )
    );
  }
}