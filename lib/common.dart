import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String title, String content) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

String? validateEmail(String value) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern.toString());
  if (!regex.hasMatch(value) || value == null)
    return 'Invalid email ';
  else
    return null;
}

Widget inputBorderedTextFormField(String hintText, String emptyText, charText,
    TextInputType keyboardType, TextEditingController controller,
    [int minLines = 1, int maxLines = 1]) {
  return TextFormField(
    autocorrect: true,
    keyboardType: keyboardType,
    maxLines: maxLines,
    controller: controller,
    style: TextStyle(fontSize: 18),
    decoration: InputDecoration(
      isDense: true,
      labelText: hintText,
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.tealAccent, width: 1.0)),
    ),
    validator: (value) {
      if (value!.isEmpty || value == "") {
        return emptyText;
      } else if (value.isNotEmpty && value.length < 2) {
        return charText;
      }
      return null;
    },
    onChanged: (value) {
      value = controller.text;
    },
  );
}

Widget readOnlyBorderedTextFormField(String? initialvalue, String labelText) {
  return TextFormField(
      autocorrect: true,
      readOnly: true,
      initialValue: initialvalue,
      style: TextStyle(fontSize: 18),
      decoration: new InputDecoration(
        isDense: true,
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.tealAccent, width: 1.0),
        ),
      ));
}

AppBar setAppBar(String title, BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Text(title),
  );
}
