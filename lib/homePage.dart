import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cupidknot/common.dart';
import 'package:cupidknot/drawerMenu/webview.dart';
import 'package:cupidknot/drawerMenu/contact.dart';
import 'package:cupidknot/drawerMenu/userprofile.dart';
import 'package:cupidknot/login.dart';
import 'LocalStore.dart';
import 'main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? email, name;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    getinit();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title.toString()),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body.toString())],
                  ),
                ),
              );
            });
      }
    });
  }

  getinit() async {
    String? _email = await getEmail();
    String? _name = await getName();
    setState(() {
      email = _email;
      name = _name;
    });
  }

  void showNotification() {
    setState(() {
      _counter++;
    });
    flutterLocalNotificationsPlugin.show(
        0,
        "Testing $_counter",
        "How you doin ?",
        NotificationDetails(
            android: AndroidNotificationDetails(
                channel.id, channel.name, channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar("Demo", context),
      body: Image.asset("assets/images/flutter.png"),
      drawer: _drawer(context),
    );
  }

  Widget _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              verticalDirection: VerticalDirection.down,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Center(
                        child: Text("Demo",
                            style: TextStyle(
                                fontFamily: 'Logofont',
                                fontWeight: FontWeight.bold,
                                fontSize: 20)))),
                SizedBox(height: 5),
                Text('Hello $name'),
                SizedBox(height: 5),
                Text('Email: $email'),
                SizedBox(height: 5),
              ],
            ),
          ),
          ListTile(
            title: Text('Company Info'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ContactPage()));
            },
          ),
          ListTile(
            title: Text('WebView'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HoblistPage()));
            },
          ),
          ListTile(
            title: Text('UsetProfile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => UserProfile()));
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => UserLogin()));
              },
              child: Text(
                "LogOut",
              )),
          SizedBox(height: 20),
          TextButton(
              onPressed: () {
                removeDetals();
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => UserLogin()));
              },
              child: Text("Delete Account")),
        ],
      ),
    );
  }
}
