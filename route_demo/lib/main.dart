import 'package:flutter/material.dart';
import 'package:route_demo/main_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
//      routes: {
//        'first': (context) => FirstPage(),
//        'second': (context) => SecondPage(),
//      },
//      initialRoute: 'first',
//      onUnknownRoute: (RouteSettings setting) => MaterialPageRoute(builder: (context) => UnknownPage()),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
