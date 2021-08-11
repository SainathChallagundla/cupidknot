import 'package:flutter/material.dart';
import 'package:cupidknot/common.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: setAppBar("Company Info", context),
        body: Center(
            child: Text(
                'Company: Flutter XXXXXXXXXXXX\nAddress:  XXXXXXXXXXX, XXXXXXXXXXXXXX\nPhone:XXXXXXXXX09\nEmail: XXXXXX@gmail.com\n')));
  }
}
