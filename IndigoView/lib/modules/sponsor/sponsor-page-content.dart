import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indigo/utils/CreateInput.dart';
import 'package:indigo/utils/HexColor.dart';
import 'sponsor-page-state.dart';
import 'package:indigo/utils/HoverExtensions.dart';

class SponsorPageContent extends StatelessWidget {
  final SponsorPageState registerPageState;

  const SponsorPageContent({Key key, this.registerPageState});

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
                Container(
                  child: Form(
                    key: registerPageState.formKey,
                    child: Column(
                      children: <Widget>[
                        CreateInput(
                          width: registerPageState.widthContainer,
                          label: 'Nombre*',
                          placeholder: 'Ingresa el nombre del sponsor',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'name');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Razón Social*',
                          placeholder: 'Ingrese la Razón Social',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'businessName');
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
                          placeholder: 'Ingrese la dirección',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'address');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Nombre del Responsable',
                          placeholder: 'Ingrese el responsable',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'responsableName');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Correo del Responsable',
                          placeholder: 'Ingrese el Correo',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'responsableMail');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Teléfono del Responsable',
                          placeholder: 'Ingrese el teléfono',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.text,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'responsablePhone');
                          },
                        ),
                        CreateInput(
                          width: registerPageState.widthContainer, 
                          label: 'Correos para envíos',
                          validator: registerPageState.validEmpy,
                          type: TextInputType.multiline,
                          onSaved: (value) {
                            this.registerPageState.setValue(value, 'mailForShipping');
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
