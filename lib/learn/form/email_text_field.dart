import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final Key formKey;
  final TextEditingController controller;

  const EmailTextField({Key key, this.formKey, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      validator: (value) {
        return value.contains(RegExp(r'[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}')) ? null : "sadas";
      },
      decoration: buildInputDecoration(),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(border: UnderlineInputBorder(), labelText: "Email", helperText: "Hello2");
  }
}
