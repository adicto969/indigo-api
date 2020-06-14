import 'package:flutter/material.dart';
import 'package:indigo/modules/report-result/model/isps-model.dart';
import 'package:indigo/utils/HexColor.dart';

class ISPSWidget extends StatelessWidget {
  final String title;
  final Color color;
  final List<ISPSModel> listIsps;

  ISPSWidget({Key key, this.title, this.color, this.listIsps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  color: this.color
                ),
                alignment: Alignment.center,
                child: Text(this.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'NunitoSansBack', fontSize: 20),),
                padding: EdgeInsets.all(5),
              ),
              SizedBox(
                height: 20,
              ),
              for (ISPSModel item in listIsps)
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: HexColor.fromHex('#ebedf3')
                      )
                    )
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(item.label, style: TextStyle(color: HexColor.fromHex('#82889a'), fontWeight: FontWeight.w600),),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          color: item.color,
                        ),
                        alignment: Alignment.center,
                        
                        width: 100,
                        child: Text(item.value.toString(), 
                          style: TextStyle(color: Colors.white, 
                            fontFamily: 'NunitoSansBack'),),
                      )
                    ],
                  ),
                )
              ,
            ],
          )
        ),
      )
    );
  }
}