import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/services.dart';
import 'dart:async';
import 'Tweet.dart';
import 'faketweets.dart' as tweets;
import 'TweetCard.dart';

// MAIN
void main() => runApp(TweetMD());

/* -------------------------------
   GLOBAL CONSTANTS
   ------------------------------- */
const APP_TITLE = "TweetMD";
const WHITE = Colors.white70; 
const BLACK = Colors.black54;

/* -------------------------------
   GLOBAL VARIABLES
   ------------------------------- */
bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;

/* -------------------------------
   THEME DATA
   ------------------------------- */
final androidAppBarTheme = AppBarTheme(
  elevation: 10.0,
  color: WHITE,
  textTheme: Typography.blackMountainView
);
final androidCardTheme = CardTheme(
  elevation: 0.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
    side: BorderSide(
      color: Colors.black38,
      width: 0.3,
      style: BorderStyle.solid
    ),
  ),
  color: WHITE
);

final androidThemeData = ThemeData(
  primarySwatch: Colors.lightBlue,
  fontFamily: "Raleway",
  bottomAppBarColor: WHITE,
  primaryColor: Colors.lightBlue[100],
  primaryColorLight: Color.fromRGBO(230, 255, 255, 1),
  primaryColorDark: Color.fromRGBO(130, 179, 201, 1),
  accentColor: Colors.lightBlueAccent,
  appBarTheme: androidAppBarTheme,
  backgroundColor: Colors.white,
  bottomAppBarTheme: BottomAppBarTheme(
    color: WHITE,
    elevation: 10.0,
    shape: CircularNotchedRectangle()
  ),
  cardTheme: androidCardTheme,
  // TODO: Finish Theme
);
final iOSThemeData = ThemeData.fallback();

// set theme depending on platform
final theme = isIOS ? iOSThemeData : androidThemeData;

 /* -------------------------------
    ROOT WIDGET
    ------------------------------- */
class TweetMD extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: theme,
      home: Feed(),
    );
  }
}

 /* -------------------------------
    FEED WIDGET
    ------------------------------- */
class Feed extends StatefulWidget {
  Feed({Key key}) : super (key: key);

  @override
  _FeedState createState() => _FeedState();
}

 /* -------------------------------
    FEED STATE
    ------------------------------- */
class _FeedState extends State<Feed> {
  // A global key to access scaffold state in various places
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Set scaffold key
      extendBody: true, // Extend the body into the bottom nav bar
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.accentColor,
        child: const ImageIcon(AssetImage("icons/post_button.png"),
          color: WHITE, size: 50),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10.0,
        shape: CircularNotchedRectangle(),
        color: WHITE,
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Buttons on the bottom bar
            children: <Widget>[
              // Menu Button
              IconButton(
                icon: Icon(Icons.menu, size: 35, color: BLACK),
                onPressed: () {},
              ),
              // Search Button
              IconButton(
                icon: Icon(Icons.search, size: 35, color: BLACK),
                onPressed: () {},
              )
          ],),
          )
      ),
      );
  }
}

// class Feed extends StatefulWidget {
//   Feed({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _FeedState createState() => _FeedState();
// }

// class _FeedState extends State<Feed> {

//   var drawerListTileTextStyle = TextStyle(
//       fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black87);

//   void composeTweet() {
//     showModalBottomSheet(
//       context: _scaffoldKey.currentContext,
//       builder: (BuildContext bc) {
//         // tweet sheet
//         return new Container(
//             color: Color(0xFF737373),
//             child: new Container(
//                 padding: EdgeInsets.only(top: 10, left: 15, right: 15),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: new BorderRadius.only(
//                       topLeft: const Radius.circular(20.0),
//                       topRight: const Radius.circular(20.0),
//                     )),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.max,
//                   children: <Widget>[
//                     Text(
//                       "Compose Tweet",
//                       style: TextStyle(
//                           color: Colors.lightBlue,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 22),
//                       textAlign: TextAlign.left,
//                     ),
//                     TextField(
//                       autofocus: true,
//                       maxLength: 280,
//                       decoration: InputDecoration(hintText: "Tweet tweet..."),
//                       maxLengthEnforced: true,
//                       textAlign: TextAlign.justify,
//                       maxLines: null,
//                     ),
//                     ButtonBar(
//                       alignment: MainAxisAlignment.end,
//                       children: <Widget>[
//                         OutlineButton(
//                           onPressed: () {
//                             return true;
//                           },
//                           textColor: Colors.redAccent,
//                           child: Text("Discard"),
//                           borderSide: BorderSide(
//                               color: Colors.redAccent,
//                               width: 0.3,
//                               style: BorderStyle.solid),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                         ),
//                         FlatButton(
//                           color: Colors.lightBlueAccent,
//                           splashColor: Colors.lightBlueAccent,
//                           textColor: Colors.white,
//                           child: Text("Post"),
//                           onPressed: () {
//                             return true;
//                           },
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 )));
//       },
//     );
//   }

//   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     var mySystemTheme = SystemUiOverlayStyle.light.copyWith(
//         systemNavigationBarColor: Colors.white,
//         statusBarColor: Colors.white,
//         statusBarIconBrightness: Brightness.dark,
//         systemNavigationBarIconBrightness: Brightness.dark);
//     SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
//     return Scaffold(
//       extendBody: true,
//       key: _scaffoldKey,
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//                 child: InkWell(
//                     onTap: () {
//                       _scaffoldKey.currentState.showSnackBar(
//                           new SnackBar(content: Text("Profile Opened")));
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Padding(
//                           padding: EdgeInsets.only(right: 10),
//                           child: Icon(
//                             Icons.account_circle,
//                             size: 60,
//                           ),
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               "Your Name",
//                               style: TextStyle(
//                                   fontSize: 24, fontWeight: FontWeight.bold),
//                             ),
//                             Text("@yourusername",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.normal))
//                           ],
//                         )
//                       ],
//                     ))),
//             ListTile(
//               leading: Icon(
//                 Icons.notifications_none,
//                 color: Colors.lightBlueAccent,
//               ),
//               title: Text("Notifications", style: drawerListTileTextStyle),
//               onTap: () {
//                 return true;
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.message,
//                 color: Colors.lightBlueAccent,
//               ),
//               title: Text("Messages", style: drawerListTileTextStyle),
//               onTap: () {
//                 return true;
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.collections_bookmark,
//                   color: Colors.lightBlueAccent),
//               title: Text("Bookmarks", style: drawerListTileTextStyle),
//               onTap: () {
//                 return true;
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.list, color: Colors.lightBlueAccent),
//               title: Text("Lists", style: drawerListTileTextStyle),
//               onTap: () {
//                 return true;
//               },
//             ),
//             Divider(),
//             ListTile(
//                 leading: Icon(Icons.settings),
//                 title: Text(
//                   "Settings",
//                   style: drawerListTileTextStyle,
//                 ),
//                 onTap: () {
//                   return true;
//                 }),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: androidThemeData.accentColor,
//         child: const ImageIcon(AssetImage("icons/post_button.png"),
//             color: Colors.white, size: 50),
//         onPressed: () {
//           composeTweet();
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       body: ListView.builder(
//         padding: EdgeInsets.all(5),
//         itemCount: tweets.length,
//         itemBuilder: (BuildContext context, int index) {
//           if (index == 0)
//             return SafeArea(child: new TweetCard(tweets[index]));
//           else
//             return new TweetCard(tweets[index]);
//         },
//       ),
//       bottomNavigationBar: new BottomAppBar(
//           elevation: 10.0,
//           shape: CircularNotchedRectangle(),
//           color: Colors.white,
//           child: Padding(
//               padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   IconButton(
//                     icon: Icon(Icons.menu, size: 35, color: Colors.black54),
//                     onPressed: () {
//                       _scaffoldKey.currentState.openDrawer();
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.search, size: 35, color: Colors.black54),
//                     onPressed: () {},
//                   ),
//                 ],
//               ))), 
//     );
//   }
// }
