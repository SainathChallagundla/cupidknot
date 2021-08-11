import 'package:flutter/material.dart';
import 'package:cupidknot/common.dart';
import 'package:cupidknot/LocalStore.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? name, email, password, contact, profession;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getint();
  }

  getint() async {
    String? _name = await getName();
    String? _email = await getEmail();
    String? _password = await getPassword();
    String? _contact = await getPhoneNo();
    String? _profession = await getProfession();
    setState(() {
      name = _name;
      email = _email;
      password = _password;
      contact = _contact;
      profession = _profession;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar("Profile", context),
      body: Center(
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                readOnlyBorderedTextFormField(name!, "Name"),
                readOnlyBorderedTextFormField(email, "Email"),
                readOnlyBorderedTextFormField(contact, "Contact"),
                readOnlyBorderedTextFormField(profession, "Profession")
              ],
            )),
      ),
    );
  }
}
