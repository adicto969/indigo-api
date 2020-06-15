import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:indigo/utils/CreateInput.dart';
import 'package:indigo/utils/CreateSelect.dart';
import 'package:indigo/utils/HexColor.dart';
import 'test-question-page-state.dart';
import 'package:indigo/utils/HoverExtensions.dart';

class TestQuestionPageContent extends StatelessWidget {
  final TestQuestionPageState registerPageState;
  
  const TestQuestionPageContent({Key key, this.registerPageState});

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
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[                           
                                CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),  
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              CreateInput(
                                  width: (registerPageState.widthContainer / 3),
                                  label: '',
                                  placeholder: '',
                                  validator: registerPageState.validEmpy,
                                  type: TextInputType.text,
                                  onSaved: (value) {
                                    this.registerPageState.setValue(value, 'productId');
                                  },
                                ),  
                                CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                              ],
                          ),
                          new Row(
                            children: <Widget>[
                              CreateInput(
                                  width: (registerPageState.widthContainer / 3),
                                  label: '',
                                  placeholder: '',
                                  validator: registerPageState.validEmpy,
                                  type: TextInputType.text,
                                  onSaved: (value) {
                                    this.registerPageState.setValue(value, 'productId');
                                  },
                                ),  
                                CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                              ],
                          ),
                          new Row(
                            children: <Widget>[
                              CreateInput(
                                  width: (registerPageState.widthContainer / 3),
                                  label: '',
                                  placeholder: '',
                                  validator: registerPageState.validEmpy,
                                  type: TextInputType.text,
                                  onSaved: (value) {
                                    this.registerPageState.setValue(value, 'productId');
                                  },
                                ),  
                                CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                              ],
                          ),
                          new Row(
                            children: <Widget>[
                              CreateInput(
                                  width: (registerPageState.widthContainer / 3),
                                  label: '',
                                  placeholder: '',
                                  validator: registerPageState.validEmpy,
                                  type: TextInputType.text,
                                  onSaved: (value) {
                                    this.registerPageState.setValue(value, 'productId');
                                  },
                                ),  
                                CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                              ],
                          ),
                          new Row(
                            children: <Widget>[
                              CreateInput(
                                  width: (registerPageState.widthContainer / 3),
                                  label: '',
                                  placeholder: '',
                                  validator: registerPageState.validEmpy,
                                  type: TextInputType.text,
                                  onSaved: (value) {
                                    this.registerPageState.setValue(value, 'productId');
                                  },
                                ),  
                                CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                              ],
                          ),
                          new Row(
                            children: <Widget>[
                              CreateInput(
                                  width: (registerPageState.widthContainer / 3),
                                  label: '',
                                  placeholder: '',
                                  validator: registerPageState.validEmpy,
                                  type: TextInputType.text,
                                  onSaved: (value) {
                                    this.registerPageState.setValue(value, 'productId');
                                  },
                                ),  
                                CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                              ],
                          ),
                          new Row(
                            children: <Widget>[
                              CreateInput(
                                  width: (registerPageState.widthContainer / 3),
                                  label: '',
                                  placeholder: '',
                                  validator: registerPageState.validEmpy,
                                  type: TextInputType.text,
                                  onSaved: (value) {
                                    this.registerPageState.setValue(value, 'productId');
                                  },
                                ),  
                                CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                              ],
                          ),
                          new Row(
                            children: <Widget>[
                              CreateInput(
                                  width: (registerPageState.widthContainer / 3),
                                  label: '',
                                  placeholder: '',
                                  validator: registerPageState.validEmpy,
                                  type: TextInputType.text,
                                  onSaved: (value) {
                                    this.registerPageState.setValue(value, 'productId');
                                  },
                                ),  
                                CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                                  CreateInput(
                                    width: (registerPageState.widthContainer / 3),
                                    label: '',
                                    placeholder: '',
                                    validator: registerPageState.validEmpy,
                                    type: TextInputType.text,
                                    onSaved: (value) {
                                      this.registerPageState.setValue(value, 'productId');
                                    },
                                  ),
                              ],
                          ),
                            
                        ],
                      ),        
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
