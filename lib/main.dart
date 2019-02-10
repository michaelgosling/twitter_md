import 'package:flutter/material.dart';

void main() => runApp(MyApp());

var androidThemeData = ThemeData(
  primarySwatch: Colors.lightBlue,
  fontFamily: "Raleway",
  bottomAppBarColor: Colors.white70,
  primaryColor: Colors.lightBlue[100],
  primaryColorLight: Color.fromRGBO(230, 255, 255, 1),
  primaryColorDark: Color.fromRGBO(130, 179, 201, 1),
  accentColor: Colors.lightBlueAccent,
);
var cardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(4),
  side: BorderSide(
      color: Colors.black38,
      width: 0.3,
      style: BorderStyle.solid),
);
var tempTweet = Card(
    elevation: 0,
    shape: cardShape,
    child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Icon(Icons.person, size: 60),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Melanie Joy",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Text("@melaniej – 10h",
                        style: TextStyle(fontSize: 18))
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                  "Lorem ipsum, swiggity swooty comin for that swoody grommet."
                      " Mambo 1, 2, 3 4 5. Test tweet 2020 greco"),
            ),
          ],
        )));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TweetMD',
      theme: androidThemeData,
      home: Feed(title: 'Feed'),
    );
  }
}

class Feed extends StatefulWidget {
  Feed({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        backgroundColor: androidThemeData.accentColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Center(
          child: ListView(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            children: <Widget>[
              tempTweet,
              tempTweet,
              tempTweet,
              tempTweet,
              tempTweet,
              tempTweet,
              tempTweet,
              tempTweet,
            ],
          )),
      bottomNavigationBar: new BottomAppBar(
          elevation: 50,
          shape: CircularNotchedRectangle(),
          child: Row(
            children: <Widget>[
              Padding(
                child: Icon(Icons.menu, size: 30, color: Colors.black54,),
                padding: EdgeInsets.all(12),
              ),
              Padding(
                child: Icon(Icons.account_circle, size: 30, color: Colors.black54),
                padding: EdgeInsets.all(12),
              )
            ],
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
