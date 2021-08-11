import 'package:flutter/material.dart';
import 'package:cupidknot/LocalStore.dart';
import 'package:cupidknot/signup.dart';
import 'homePage.dart';
import 'common.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();

  String? email, password;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    this.loggedin_check();
    getinit();
  }

  loggedin_check() async {
    newuser = await getbool() ?? true;

    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  getinit() async {
    String? _email = await getEmail();
    String? _password = await getPassword();
    setState(() {
      email = _email;
      password = _password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: setAppBar("LogIn", context),
        body: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                  padding: const EdgeInsets.all(15.0),
                  child: inputBorderedTextFormField(
                      "Enter Password",
                      "invalid password",
                      "",
                      TextInputType.multiline,
                      _passwordcontroller),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.cyan[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      onSubmit();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Don't have an account?"),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.cyan[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext) => SignUpPage()));
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void onSubmit() {
    print("=================email$email");
    print("=========password$password");
    print("=================_email$_emailcontroller");
    print("=========_password$_passwordcontroller");

    if (_formkey.currentState!.validate()&&(password==_passwordcontroller.text&&email==_emailcontroller.text)) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (BuildContext) => HomePage()));
    }else{
      showAlertDialog(context, "Invelid Credentials", "Please enter valid email or password");
    }
  }
}
