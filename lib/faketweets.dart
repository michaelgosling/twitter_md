import 'dart:math';
import 'Tweet.dart';
  
/* 
 Fake random tweets courtesy of http://rasmusrasmussen.com/rtweets/
 */

class FakeTweets {
  final _rand = new Random();

  // Generate random index and return that tweet
  Tweet getRandomTweet() => tweets[_rand.nextInt(tweets.length)];

  // fake tweet data
  final tweets = [
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
}