import 'package:shared_preferences/shared_preferences.dart';

setName(String name) async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  prefs.setString("name", name);
}

setEmail(String email) async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  prefs.setString("email", email);
}

setPassword(String password) async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  prefs.setString("password", password);
}

setPhoneNo(String phoneNo) async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  prefs.setString("phoneNo", phoneNo);
}
setProfession(String phoneNo) async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  prefs.setString("profession", phoneNo);
}

setbool(String password) async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  prefs.setBool("login", false);
}

getName() async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  return prefs.getString("name");
}

getEmail() async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  return prefs.getString("email");
}

getPassword() async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  return prefs.getString("password");
}

getPhoneNo() async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  return prefs.getString("phoneNo");
}
getProfession() async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  return prefs.getString("profession");
}

getbool() async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  return prefs.getBool("login");
}

removeDetals() async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  prefs.remove("name");
  prefs.remove("email");
  prefs.remove("password");
  prefs.remove("phoneNo");
}
