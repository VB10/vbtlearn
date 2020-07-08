import 'package:flutter/material.dart';

import 'email_text_field.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  String text = "";
  bool isAutoValidate = false;

  bool isRequestAvaible = false;

  GlobalKey<FormState> _formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: PageView(
        controller: PageController(viewportFraction: 0.85),
        children: <Widget>[
          Container(color: Colors.red),
          Container(color: Colors.blue),
          Container(color: Colors.red),
          Container(color: Colors.blue),
        ],
      ),
    );
  }

  AppBar get buildAppBar => AppBar(
        title: Text(text),
      );

  Form buildFormView() {
    return Form(
      key: _formState,
      autovalidate: isAutoValidate,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[buildTextFormFieldUser(), EmailTextField(), buildRaisedButtonLogin()],
      ),
    );
  }

  RaisedButton buildRaisedButtonLogin() {
    return RaisedButton(
      onPressed: isRequestAvaible ? null : buttonOnPressed,
      child: buttonChild,
    );
  }

  Widget get buttonChild => isRequestAvaible ? CircularProgressIndicator() : Icon(Icons.send);

  TextFormField buildTextFormFieldPassword() {
    return TextFormField(
      validator: (value) {
        return value.length > 5 ? null : "Have error";
      },
    );
  }

  TextFormField buildTextFormFieldUser() {
    return TextFormField(
      validator: (value) {
        return value.contains(RegExp(r'[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}')) ? null : "This area is not empty";
      },
      decoration: buildInputDecoration(),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(border: UnderlineInputBorder(), labelText: "Hello", counterText: "55", helperText: "Hello2");
  }

  void buttonOnPressed() {
    if (_formState.currentState.validate()) {
      print("Hello");
      setState(() {
        isRequestAvaible = true;
      });
    } else {
      print("Error");
      setState(() {
        isAutoValidate = true;
      });
    }
  }
}
