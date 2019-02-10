import 'package:flutter/material.dart';

import 'Tweet.dart';
import 'TweetCard.dart';

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
  // Fake random tweets courtesy of http://rasmusrasmussen.com/rtweets/
  var tweets = [
    new Tweet(
        "Melanie Joy",
        "melaniej",
        DateTime.utc(2018, DateTime.january, 20, 0, 0, 0, 0, 0),
        "My big mug is a fairytale, and I want to change. Let there be funky nature, I say. #bunnybag #randomtweet"),
    new Tweet(
        "Hubert Gotfried",
        "bigH",
        DateTime.utc(2018, DateTime.january, 19, 0, 0, 0, 0, 0),
        "My better half is glorious, and I want to get more retweets. More funky tapestries, bro. #sickslam #randomtweet"),
    new Tweet(
        "Fred Reynolds",
        "freddieR",
        DateTime.utc(2018, DateTime.january, 18, 0, 0, 0, 0, 0),
        "My mid-day hunger is funded by fools, and I want to die trying. A bit of hot drugs, man. #stickyslam #randomtweet"),
    new Tweet(
        "Melanie Joy",
        "melaniej",
        DateTime.utc(2018, DateTime.january, 17, 0, 0, 0, 0, 0),
        "My cat is a pain, and I want to go swimming. It's the bad ass weather, they told me. #nogate #randomtweet"),
    new Tweet(
        "Kenny G",
        "kennyg",
        DateTime.utc(2018, DateTime.january, 16, 0, 0, 0, 0, 0),
        "My game is so robust, and I want to run a marathon. It's the thirsty dates, politically. #flasheats #randomtweet"),
    new Tweet(
        "Big Mart™",
        "capitalism",
        DateTime.utc(2018, DateTime.january, 15, 0, 0, 0, 0, 0),
        "Why waste your money when you don't have to? Today's deal: Milk \$2. #LowPricesEveryDay"),
    new Tweet(
        "Local Grocery",
        "localgrocer",
        DateTime.utc(2018, DateTime.january, 15, 0, 0, 0, 0, 0),
        "We've got milk on for a whopping low price of \$3, come on down and support local #local #milk"),
    new Tweet(
        "Melanie Joy",
        "melaniej",
        DateTime.utc(2018, DateTime.january, 15, 0, 0, 0, 0, 0),
        "My job is getting old, and I want to pluck a cactus. A hint of casual tapestries, you see. #healthydiet #randomtweet"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        backgroundColor: androidThemeData.accentColor,
        child: const ImageIcon(AssetImage("icons/post_button.png"),
            color: Colors.white, size: 50),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: tweets.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0)
            return SafeArea(child: new TweetCard(tweets[index]));
          else
            return new TweetCard(tweets[index]);
        },
      ),
      bottomNavigationBar: new BottomAppBar(
          elevation: 10.0,
          shape: CircularNotchedRectangle(),
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu, size: 35, color: Colors.black54),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search, size: 35, color: Colors.black54),
                    onPressed: () {},
                  ),
                ],
              ))), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
