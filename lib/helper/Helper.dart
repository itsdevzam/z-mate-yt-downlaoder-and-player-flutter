import 'dart:math';

import 'package:flutter/cupertino.dart';

class Helper {

  static int getRandomNum({required int maxLength}) {
    int random = Random().nextInt(maxLength);
    return random;
  }

  static String searchTerm(){
    return homeFeedSearches[getRandomNum(maxLength: homeFeedSearches.length)];
  }

  static String viewsFormat({required String views}) {
    final int count = int.tryParse(views) ?? 0;

    if (count >= 1000000000) {
      return '${(count / 1000000000).toStringAsFixed(
        count % 1000000000 == 0 ? 0 : 1,
      )}B';
    } else if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(
        count % 1000000 == 0 ? 0 : 1,
      )}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(
        count % 1000 == 0 ? 0 : 1,
      )}K';
    } else {
      return count.toString();
    }
  }

  static double getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static List<String> homeFeedSearches = [
    "latest trending videos",
    "breaking world news",
    "viral videos today",
    "top music hits",
    "new movie trailers",
    "gaming highlights",
    "funny memes compilation",
    "technology updates",
    "football highlights",
    "cricket match highlights",
    "live concert performances",
    "motivational videos",
    "podcast clips",
    "celebrity interviews",
    "anime trending clips",
    "car reviews",
    "travel vlogs",
    "food recipes",
    "street food videos",
    "DIY hacks",
    "fitness workouts",
    "gym motivation",
    "fashion trends",
    "AI and tech news",
    "smartphone reviews",
    "coding tutorials",
    "luxury lifestyle",
    "business success stories",
    "science discoveries",
    "space documentaries",
    "wildlife videos",
    "history documentaries",
    "comedy skits",
    "prank videos",
    "reaction videos",
    "ASMR relaxation",
    "study motivation",
    "productivity tips",
    "crypto market news",
    "stock market updates",
    "eSports tournaments",
    "Minecraft gameplay",
    "PUBG mobile highlights",
    "Fortnite clips",
    "Valorant gameplay",
    "movie recap videos",
    "web series clips",
    "top TikTok trends",
    "Instagram reels trending",
    "YouTube shorts trending",
  ];

}
