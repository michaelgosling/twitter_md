import 'package:flutter/material.dart';

void main() => runApp(MyApp());

var googleSansMaterialTheme = ThemeData(
  primarySwatch: Colors.lightBlue,
  fontFamily: "GoogleSans",
  bottomAppBarColor: Colors.white70,
  primaryColor: Colors.lightBlue[100],
  primaryColorLight: Color.fromRGBO(230,255,255, 1),
  primaryColorDark: Color.fromRGBO(130,179,201, 1)
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TweetMD',
      theme: googleSansMaterialTheme,
      home: Feed(title: 'Feed'),
    );
  }
}

class Feed extends StatefulWidget {
  Feed({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Text"),
          ],
        ),
      ),
      bottomNavigationBar: new BottomAppBar(
          elevation: 50,
          shape: CircularNotchedRectangle(),
          child: Row(
            children: <Widget>[
              Icon(Icons.menu, size: 60,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.person, size: 60),
              ],)

            ],

          )
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
