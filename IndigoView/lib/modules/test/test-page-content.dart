import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indigo/utils/CreateInput.dart';
import 'package:indigo/utils/CreateSelect.dart';
import 'package:indigo/utils/HexColor.dart';
import 'test-page-state.dart';
import 'package:indigo/utils/HoverExtensions.dart';

class TestPageContent extends StatelessWidget {
  final TestPageState registerPageState;
  
  const TestPageContent({Key key, this.registerPageState});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        children: <Widget>[
          Container(
            color: HexColor.fromHex('#f5f6fa'),
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
              minHeight: 300.0,
              maxHeight: double.infinity
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                        child: Text('DATOS GENERALES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(width: 80.0, height: 4.0, color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text ('Llena correctamente los campos.', textAlign: TextAlign.left)
                      ],
                    ),
                  )
                ),
                CreateInput(
                          width: registerPageState.widthContainer,
                          label: 'Nombre*',
                          placeholder: 'Ingrese el nombre',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'name');
                          },
                        ),
                Container(
                  child: Form(
                    key: registerPageState.formKey,
                    child: Column(
                      children: <Widget>[
                        CreateSelect(
                          width: registerPageState.widthContainer, 
                          label: 'Modelo de Prueba*',
                          placeholder: 'Seleccione una opción',
                          validator: registerPageState.validEmpy,
                          models: [],
                          onChanged: (value) {
                            this.registerPageState.setValue(value, 'testModelId');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer,
                          label: 'Producto*',
                          placeholder: 'Seleccione una opción',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'productId');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Empresa*',
                          placeholder: 'Selecciona una opción',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'companyId');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Fecha de Inicio',
                          placeholder: 'Ingrese la Fecha de Inicio',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'startDate');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Fecha de Término',
                          placeholder: 'Ingrese el Fecha Final',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'endDate');
                          },
                        ),
                        Text('Enabled', style: TextStyle(color: registerPageState.readerColor)),
                        Checkbox(
                                  value: registerPageState.reader,
                                  onChanged: (value){
                                    this.registerPageState.setValue(value, 'enabled');
                                  },
                                  
                        ),
                        
                        Container(
                          width: registerPageState.widthContainer,
                          child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                            child: SizedBox(
                                width: double.infinity,
                                child: FlatButton(
                                        onPressed: registerPageState.submit,
                                        child: Text(
                                          'Guardra',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        color: Theme.of(context).primaryColor
                                ).showCursorOnHover)
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: registerPageState.widthContainer,
                  margin: EdgeInsets.only(bottom: 45.0)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
