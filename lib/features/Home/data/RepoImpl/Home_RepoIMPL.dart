import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:yt_down/features/Home/data/model/VideoModel.dart';
import 'package:yt_down/features/Home/domain/Entity/VideoEntity.dart';
import 'package:yt_down/features/Home/domain/HomeRepo/HomeRepo.dart';
import 'package:yt_down/helper/Helper.dart';

class Home_RepoIMPL implements HomeRepo {
  void getVideoDetail(VideoId videoID) async {
    try {
      var yt = YoutubeExplode();
      var video = await yt.videos.get(videoID);
      // print(video.title);
      // print(video.author);
      // print(video);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<VideoEntity>?> getHomePageFeed() async {
    try {
      var _ytExplode = YoutubeExplode();
      VideoSearchList video = await _ytExplode.search.search(
        Helper.searchTerm(),
      );
      List<VideoEntity> tempList = video.map((e) {
        return VideoModel(
          videoId: e.id.toString(),
          title: e.title,
          views: e.engagement.viewCount.toString(),
          thumbnail: e.thumbnails.mediumResUrl,
          author: e.author,
          Description: e.description,
          channeld: e.channelId.toString(),
          VideoDuration: e.duration.toString(),
          UploadDateRaw: e.uploadDateRaw.toString(),
        );
      }).toList();
      return tempList;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<List<VideoEntity>?> searchOnHomePage(String query) {
    // TODO: implement searchOnHomePage
    throw UnimplementedError();
  }
}
