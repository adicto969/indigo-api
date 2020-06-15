import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indigo/utils/CreateInput.dart';
import 'package:indigo/utils/CreateSelect.dart';
import 'package:indigo/utils/HexColor.dart';
import 'user-page-state.dart';
import 'package:indigo/utils/HoverExtensions.dart';

class UserPageContent extends StatelessWidget {
  final UserPageState registerPageState;
  
  const UserPageContent({Key key, this.registerPageState});

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
                CreateSelect(
                  width: registerPageState.widthContainer, 
                  label: 'Empresa*',
                  placeholder: 'Seleccione la empresa',
                  validator: registerPageState.validEmpy,
                  models: [],
                  onChanged: (value) {
                    this.registerPageState.setValue(value, 'companyId');
                  },
                ),
                Container(
                  child: Form(
                    key: registerPageState.formKey,
                    child: Column(
                      children: <Widget>[
                        CreateInput(
                          width: registerPageState.widthContainer,
                          label: 'Nombre*',
                          placeholder: 'Ingrese el nombre',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'firsName');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Apellidos*',
                          placeholder: 'Ingrese los apellidos',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'lastName');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Correo',
                          placeholder: 'Ingrese el Correo',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'mail');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Teléfono',
                          placeholder: 'Ingrese el Teléfono',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'phone');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'RFC*',
                          placeholder: 'Ingrese el RFC',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'rfc');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Dirección',
                          placeholder: 'Ingrese la Dirección',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'address');
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
