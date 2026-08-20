import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:yt_down/core/entities/VideoDownloadOption.dart';
import 'package:yt_down/core/enum/DownloadStreamType.dart';
import '../../../../core/entities/VideoDownloadEntity.dart';
import '../../../../core/entities/VideoEntity.dart';
import '../../../../core/model/VideoModel.dart';
import '../../domain/VideoPlayerRepo/VideoPlayerRepo.dart';

class VideoPlayerRepoImpl implements VideoPlayerRepo {
  var _ytExplode = YoutubeExplode();

  @override
  Future<List<VideoEntity>?> getSuggestedVideo({
    required String videoTitle,
  }) async {
    try {
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

  @override
  Future<VideoDownloadEntity> getVideoMetaData({
    required String title,
    required String videoId,
    required String thumbnail,
    required String views,
    required String videoDuration,
  }) async {
    var manifest = await _ytExplode.videos.streams.getManifest(videoId);
    List<VideoDownloadOption> downloadOptionsList = manifest.streams.map((
      element,
    ) {
      final DownloadStreamType streamType = getStreamType(element);
      return VideoDownloadOption(
        quality: element.qualityLabel,
        format: element.codec.toString(),
        url: element.url.toString(),
        type: streamType,
      );
    }).toList();
    return VideoDownloadEntity(
      videoTitle: title,
      thumbnail: thumbnail,
      views: views,
      videoDuration: videoDuration,
      downloadOptions: downloadOptionsList,
    );
  }

  DownloadStreamType getStreamType(StreamInfo element) {
    if (element is MuxedStreamInfo) {
      return DownloadStreamType.muxed;
    } else if (element is VideoOnlyStreamInfo) {
      return DownloadStreamType.video;
    } else if (element is AudioOnlyStreamInfo) {
      return DownloadStreamType.audio;
    }

    throw UnsupportedError('Unsupported stream type: ${element.runtimeType}');
  }
}
