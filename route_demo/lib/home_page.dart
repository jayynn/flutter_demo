import 'package:flutter/material.dart';
import 'package:route_demo/first_page.dart';
import 'package:route_demo/second_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'first',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'first':
            builder = (BuildContext context) => FirstPage();
            break;
          case 'second':
            builder = (BuildContext context) => SecondPage();
            break;
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
