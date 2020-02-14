import 'package:flutter/material.dart';
import 'package:route_demo/second_page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一个页面'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
//            Navigator.pushNamed(context, 'second');
//            Navigator.pushNamed(context, 'test');
          },
          child: Text('跳转到第二个页面'),
        ),
      ),
    );
  }
}
