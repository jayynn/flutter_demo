import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    final scratchKey = GlobalKey<ScratcherState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Text("默认用法"),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB((screenWidth - 300) / 2.0, 10, 0, 0),
            child: Scratcher(
              brushSize: 30,
              threshold: 50,
              color: Colors.grey,
              onChange: (value) {
                print("当前刮开比例：$value");
              },
              onThreshold: () {
                print("触发完全刮开阈值");
              },
              child: Container(
                width: 300,
                height: 150,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text("自定义"),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB((screenWidth - 300) / 2.0, 10, 0, 0),
            child: Scratcher(
              key: scratchKey,
              brushSize: 30,
              threshold: 50,
              color: Colors.pink,
              onChange: (value) {
                print("当前刮开比例: $value%");
              },
              onThreshold: () {
                print("已触发设置的全部刮开阈值");
                scratchKey.currentState.reveal(duration: Duration(milliseconds: 500));
              },
              child: Container(
                width: 300,
                height: 150,
                child: Image.network(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576490211410&di=92a92e4f1033cc71931283dfa9a39ebd&imgtype=0&src=http%3A%2F%2Fimg.weixinyidu.com%2F150902%2Fd629d64e.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('重置'),
                onPressed: () {
                  scratchKey.currentState.reset();
                },
              ),
              RaisedButton(
                child: Text('刮开'),
                onPressed: () {
                  scratchKey.currentState.reveal(duration: Duration(milliseconds: 500));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
