import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListViewHome(),
      initialRoute: '/',
      routes: {
        // '/': (context) =>  ListViewHome(),
        '/channel': (context) => const FlutterChannelPage(),
        '/httpAndException': (context) => const FlutterChannelPage(),
      },
    );
  }
}

class FlutterChannelPage extends StatelessWidget {
  const FlutterChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // 현재 route를 스택에서 제거함으로써 첫 번째 스크린으로 되돌아 갑니다.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class ListViewHome extends StatelessWidget {
  const ListViewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("플러터 공부"),
      ),
      body: Center(
          child:
              _ListView()), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> entries =
      {'/channel': '플러터 채널','/httpAndException': '플러터 예외처리 및 http 통신'};
   //   {'/httpAndException': '플러터 예외처리 및 http 통신'},
    //;

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.keys.length,
        itemBuilder: (BuildContext context, int index) {

          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context,entries.keys.toList()[index]);
              },
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                height: 50,
                child: Center(child: Text(' ${entries.values.toList()[index]}')),
              ),
            ),
          );
        });
  }
}
