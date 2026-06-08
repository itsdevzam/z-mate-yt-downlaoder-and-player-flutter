import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:yt_down/core/entities/VideoEntity.dart';
import 'package:yt_down/features/Search/domain/SearchRepo/SearchRepo.dart';

import '../../../../core/model/VideoModel.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<List<VideoEntity>?> getSearchSuggestions({
    required String query,
  }) async {
    try {
      var _ytExplode = YoutubeExplode();
      VideoSearchList video = await _ytExplode.search.search(query);
      List<VideoEntity> tempList = video
          .where((e) => e.title != query)
          .take(20)
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
