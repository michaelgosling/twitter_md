import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Tweet.dart';

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


class TweetCard extends Card {
  var tweetShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
    side: BorderSide(
        color: Colors.black38,
        width: 0.3,
        style: BorderStyle.solid),
  );

  final Tweet tweet;

  TweetCard(this.tweet);

  @override
  Widget build(BuildContext context) {
    var dateTimeDisplay;
    if (tweet.dateTime.year < DateTime.now().year)
      dateTimeDisplay = DateFormat.yMMMMd("en_US").format(tweet.dateTime);
    else if (tweet.dateTime.month < DateTime.now().month)
      dateTimeDisplay = (DateTime.now().month - tweet.dateTime.month).toString() + " months ago";
    else if (tweet.dateTime.day < DateTime.now().day) {
      var dayDiff = DateTime.now().day-tweet.dateTime.day;
      if (dayDiff == 7)
        dateTimeDisplay = "A week ago";
      else if (dayDiff < 7)
        dateTimeDisplay = tweet.dateTime.weekday;
      else
        dateTimeDisplay = dayDiff.toString() + " days ago";
    } else if (tweet.dateTime.hour < DateTime.now().hour)
      dateTimeDisplay = (DateTime.now().hour - tweet.dateTime.hour).toString() + "h ago";
    else {
      if (tweet.dateTime.minute == DateTime.now().minute)
        dateTimeDisplay = "Just now";
      else
        dateTimeDisplay = (DateTime.now().minute - tweet.dateTime.minute).toString() + "m ago";
    }

    return Card(
        elevation: 0,
        shape: tweetShape,
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(Icons.person, size: 60),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tweet.name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.start,
                        ),
                        Text("@" + tweet.handle + " – " + dateTimeDisplay,
                            style: TextStyle(fontSize: 16, color: Colors.black54), textAlign: TextAlign.start,)
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(tweet.message),
                ),
              ],
            )));
  }
}

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
    new Tweet("Melanie Joy", "melaniej", DateTime.utc(2018, DateTime.january, 20, 0, 0, 0, 0, 0),
        "My big mug is a fairytale, and I want to change. Let there be funky nature, I say. #bunnybag #randomtweet"),
    new Tweet("Hubert Gotfried", "bigH", DateTime.utc(2018, DateTime.january, 19, 0, 0, 0, 0, 0),
        "My better half is glorious, and I want to get more retweets. More funky tapestries, bro. #sickslam #randomtweet"),
    new Tweet("Fred Reynolds", "freddieR", DateTime.utc(2018, DateTime.january, 18, 0, 0, 0, 0, 0),
        "My mid-day hunger is funded by fools, and I want to die trying. A bit of hot drugs, man. #stickyslam #randomtweet"),
    new Tweet("Melanie Joy", "melaniej", DateTime.utc(2018, DateTime.january, 17, 0, 0, 0, 0, 0),
        "My cat is a pain, and I want to go swimming. It's the bad ass weather, they told me. #nogate #randomtweet"),
    new Tweet("Kenny G", "kennyg", DateTime.utc(2018, DateTime.january, 16, 0, 0, 0, 0, 0),
        "My game is so robust, and I want to run a marathon. It's the thirsty dates, politically. #flasheats #randomtweet"),
    new Tweet("Big Mart™", "capitalism", DateTime.utc(2018, DateTime.january, 15, 0, 0, 0, 0, 0),
        "Why waste your money when you don't have to? Today's deal: Milk \$2. #LowPricesEveryDay"),
    new Tweet("Local Grocery", "localgrocer", DateTime.utc(2018, DateTime.january, 15, 0, 0, 0, 0, 0),
        "We've got milk on for a whopping low price of \$3, come on down and support local #local #milk"),
    new Tweet("Melanie Joy", "melaniej", DateTime.utc(2018, DateTime.january, 15, 0, 0, 0, 0, 0),
        "My job is getting old, and I want to pluck a cactus. A hint of casual tapestries, you see. #healthydiet #randomtweet"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        backgroundColor: androidThemeData.accentColor,
        child: const ImageIcon(AssetImage("icons/post_button.png"), color: Colors.white, size: 50),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView.builder(
              padding: EdgeInsets.all(5),
              itemCount: tweets.length,
              itemBuilder: (BuildContext context, int index){
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
              IconButton(icon: Icon(Icons.menu, size: 35, color: Colors.black54), onPressed: (){},),
              IconButton(icon: Icon(Icons.account_circle, size: 35, color: Colors.black54), onPressed: (){},),
            ],
          ))
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
