import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:yt_down/features/VideoPlayer/data/model/VideoModel.dart';
import '../../../../core/entities/VideoEntity.dart';
import '../../domain/VideoPlayerRepo/VideoPlayerRepo.dart';

class VideoPlayerRepoImpl implements VideoPlayerRepo {
  @override
  Future<List<VideoEntity>?> getSuggestedVideo({
    required String videoTitle,
  }) async {
    try {
      var _ytExplode = YoutubeExplode();
      VideoSearchList video = await _ytExplode.search.search(videoTitle);
      List<VideoEntity> tempList = video
          .where((e) => e.title != videoTitle)
          .take(10)
          .map((e) {
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
              likesCount: e.engagement.likeCount.toString(),
              dislikeCount: e.engagement.dislikeCount.toString(),
            );
          })
          .toList();
      return tempList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
