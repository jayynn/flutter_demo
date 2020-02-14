import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List data=[{
    "latter":"A",
    "group":[
      "A分组1","A分组1","A分组1","A分组1","A分组1","A分组1"
    ]
  },{
    "latter":"B",
    "group":[
      "B分组1","B分组1","B分组1","B分组1","B分组1","B分组1"
    ]
  },{
    "latter":"C",
    "group":[
      "C分组1","C分组1","C分组1","C分组1","C分组1","C分组1"
    ]
  },{
    "latter":"D",
    "group":[
      "D分组1","D分组1","D分组1","D分组1","D分组1","D分组1"
    ]
  },{
    "latter":"E",
    "group":[
      "E分组1","E分组1","E分组1","E分组1","E分组1","E分组1"
    ]
  }];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sticky_headers"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return StickyHeader(
            header: Container(
              height: 50,
              color: Colors.blueGrey[700],
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(data[index]['latter']),
            ),
            content: Column(
              children: buildGroup(data[index]['group']),
            ),
          );
        },
      ),
    );
  }

  List<Widget> buildGroup(List group) {
    return group.map((item) {
      return Container(
        height: 60,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 30),
        child: Text(item),
      );
    }).toList();
  }
}
