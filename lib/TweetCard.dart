import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Tweet.dart';

class TweetCard extends Card {
  final tweetShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
    side:
        BorderSide(color: Colors.black38, width: 0.3, style: BorderStyle.solid),
  );
  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    side: BorderSide(color: Colors.black, width: 0.1, style: BorderStyle.solid),
  );

  final Tweet tweet;

  TweetCard(this.tweet);

  @override
  Widget build(BuildContext context) {
    var dateTimeDisplay;
    if (tweet.dateTime.year < DateTime.now().year)
      dateTimeDisplay = DateFormat.yMMMMd("en_US").format(tweet.dateTime);
    else if (tweet.dateTime.month < DateTime.now().month)
      dateTimeDisplay =
          (DateTime.now().month - tweet.dateTime.month).toString() +
              " months ago";
    else if (tweet.dateTime.day < DateTime.now().day) {
      var dayDiff = DateTime.now().day - tweet.dateTime.day;
      if (dayDiff == 7)
        dateTimeDisplay = "A week ago";
      else if (dayDiff < 7)
        dateTimeDisplay = tweet.dateTime.weekday;
      else
        dateTimeDisplay = dayDiff.toString() + " days ago";
    } else if (tweet.dateTime.hour < DateTime.now().hour)
      dateTimeDisplay =
          (DateTime.now().hour - tweet.dateTime.hour).toString() + "h ago";
    else {
      if (tweet.dateTime.minute == DateTime.now().minute)
        dateTimeDisplay = "Just now";
      else
        dateTimeDisplay =
            (DateTime.now().minute - tweet.dateTime.minute).toString() +
                "m ago";
    }

    return Card(
        elevation: 0,
        shape: tweetShape,
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: GestureDetector(
                onLongPress: () {
                  // TODO: retweet code
                  Scaffold.of(context).showSnackBar(new SnackBar(
                    content: Text("Retweet"),
                  ));
                },
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.person, size: 60),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tweet.name,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "@" + tweet.handle + " – " + dateTimeDisplay,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            return true;
                          },
                          icon: Icon(Icons.share),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Text(tweet.message),
                    ),
                    // Retweet/Reply
                    ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[
                        OutlineButton(
                          onPressed: () {
                            return true;
                          },
                          textTheme: ButtonTextTheme.accent,
                          padding: EdgeInsets.all(0),
                          shape: buttonShape,
                          child: Text("like"),
                        ),
                        OutlineButton(
                          onPressed: () {
                            return true;
                          },
                          textTheme: ButtonTextTheme.accent,
                          padding: EdgeInsets.all(0),
                          shape: buttonShape,
                          child: Text("reply"),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
