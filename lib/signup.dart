import 'package:flutter/material.dart';
import 'package:cupidknot/login.dart';
import 'LocalStore.dart';
import 'common.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _namecontroller = new TextEditingController();
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();
  TextEditingController _phoneNocontroller = new TextEditingController();
  String? profession;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: setAppBar("SignUp", context),
      body: Center(
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: inputBorderedTextFormField(
                        "Enter Name",
                        "Name field must not be empty",
                        "name must be minimum 3 characters",
                        TextInputType.name,
                        _namecontroller,
                      )),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Email',
                          hintText: 'Enter Email Address'),
                      controller: _emailcontroller,
                      validator: (value) => validateEmail(value!),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: inputBorderedTextFormField(
                          "Enter Password",
                          "Password must not be empty",
                          "Password must be minimum 3 characters",
                          TextInputType.emailAddress,
                          _passwordcontroller)),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: inputBorderedTextFormField(
                          "Enter Phone Number",
                          "PhoneNo must not be empty",
                          "PhoneNo must be minimum 3 characters",
                          TextInputType.phone,
                          _phoneNocontroller)),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: new DropdownButton<String>(
                      items: <String>[
                        'Student',
                        'Employe',
                        'Self Employe',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text("Select a Profession"),
                      onChanged: (newVal) async {
                        setState(() {
                          profession = newVal!;
                        });
                      },
                      value: profession,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.cyan[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () async {
                          if (profession==null) {
                            showAlertDialog(context, "Profession empty", "please select a profession");
                          }
                          if (_formkey.currentState!.validate()&&(profession!=null)) {
                            await setName(_namecontroller.text);
                            await setEmail(_emailcontroller.text);
                            await setPassword(_passwordcontroller.text);
                            await setPhoneNo(_phoneNocontroller.text);
                            await setProfession(profession!);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext) => UserLogin()));
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      )),
                ],
              ))),
    );
  }
}

