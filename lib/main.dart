import 'package:flutter/material.dart';

import 'Tweet.dart';
import 'TweetCard.dart';

void main() => runApp(TweetMD());

var androidThemeData = ThemeData(
  primarySwatch: Colors.lightBlue,
  fontFamily: "Raleway",
  bottomAppBarColor: Colors.white70,
  primaryColor: Colors.lightBlue[100],
  primaryColorLight: Color.fromRGBO(230, 255, 255, 1),
  primaryColorDark: Color.fromRGBO(130, 179, 201, 1),
  accentColor: Colors.lightBlueAccent,
);


class TweetMD extends StatelessWidget {
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

  var drawerListTileTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Colors.black87
  );

  void composeTweet(BuildContext context) {
    showModalBottomSheet(context: context,
        builder: (BuildContext bc) {
      return
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          child: Text("Compose Tweet",
            style: TextStyle(color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
                fontSize: 24),
            textAlign: TextAlign.left,
          )),
          TextField(
            autofocus: true,
            maxLength: 280,
            decoration: InputDecoration(hintText: "Tweet tweet..."),
            maxLengthEnforced: true,
            textAlign: TextAlign.justify,
          ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
              children: <Widget>[
                OutlineButton(
                onPressed: () {return true;},
                textColor: Colors.redAccent,
                child: Text("Discard"),
                borderSide: BorderSide(color: Colors.redAccent, width: 0.3, style: BorderStyle.solid),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              FlatButton(
                color: Colors.lightBlueAccent,
                splashColor: Colors.lightBlueAccent,
                textColor: Colors.white,
                child: Text("Post"),
                onPressed: () {return true;},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              )],
              )
        ],
      ));
    }
    );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: InkWell(
                onTap: (){
                  _scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text("Profile Opened")));
                },
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.account_circle, size: 60,),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Your Name", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      Text("@yourusername", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal))
                    ],
                  )
                ],
              ))
            ),
            ListTile(
              leading: Icon(Icons.notifications_none, color: Colors.lightBlueAccent,),
              title: Text("Notifications", style: drawerListTileTextStyle),
              onTap: () {return true;},
            ),
            ListTile(
              leading: Icon(Icons.message, color: Colors.lightBlueAccent,),
              title: Text("Messages", style: drawerListTileTextStyle),
              onTap: () {return true;},
            ),
            ListTile(
              leading: Icon(Icons.collections_bookmark, color: Colors.lightBlueAccent),
              title: Text("Bookmarks", style: drawerListTileTextStyle),
              onTap: () {return true;},
            ),
            ListTile(
              leading: Icon(Icons.list, color: Colors.lightBlueAccent),
              title: Text("Lists", style: drawerListTileTextStyle),
              onTap: () {return true;},
            ),
            Divider(),
        ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings", style: drawerListTileTextStyle,),
                onTap: () {return true;}
              ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: androidThemeData.accentColor,
        child: const ImageIcon(AssetImage("icons/post_button.png"),
            color: Colors.white, size: 50),
        onPressed: () {
          composeTweet(_scaffoldKey.currentContext);
        },
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
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
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
