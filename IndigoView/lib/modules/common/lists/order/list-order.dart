import 'package:flutter/material.dart';
import 'package:indigo/modules/questionary/models/question-model.dart';
import 'package:indigo/utils/HexColor.dart';

class ListOrder extends StatelessWidget {
  
  final List<Question> list;
  final Function(int oldIndex, int newIndex) reorder;
  final Function(int value, Question item) changeOrder;

  ListOrder({Key key, @required this.list, @required this.reorder, @required this.changeOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        for(final item in list)
          Container(
            key: ValueKey(item),
            child: Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: HexColor.fromHex('f5f6fa')
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 75.0,
                    margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                    padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white
                    ),
                    child: DropdownButton<int>(
                      isDense: true,
                      isExpanded: true,
                      underline: SizedBox(),
                      hint: Text('Orden'),
                      value: item.order,
                      onChanged: (int value) => changeOrder(value, item),
                      items: <DropdownMenuItem<int>>[
                        for(final order in new List<int>.generate(list.length, (i) => i + 1))
                          DropdownMenuItem<int>(
                            value: order,
                            child: Text('$order'),
                          )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text('${item.sentence}')
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.apps, color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          )
      ],
      onReorder: reorder
    );
  }
}