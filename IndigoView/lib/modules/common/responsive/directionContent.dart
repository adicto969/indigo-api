import 'package:flutter/material.dart';

class DirectionContent extends StatelessWidget{

  final List<Widget> children;
  final bool validationRow;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  DirectionContent({
    Key key, 
    @required this.children,
    @required this.validationRow,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center
  });

  @override 
  Widget build(BuildContext context) {
    return this.validationRow ? 
    Row(
      crossAxisAlignment: this.crossAxisAlignment,
      mainAxisAlignment: this.mainAxisAlignment,
      children: this.children,
    ) : Column(
      crossAxisAlignment: this.crossAxisAlignment,
      mainAxisAlignment: this.mainAxisAlignment,
      children: this.children,
    );
  }
}
