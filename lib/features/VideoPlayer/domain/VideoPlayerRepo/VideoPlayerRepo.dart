import '../../../../core/entities/VideoDownloadEntity.dart';
import '../../../../core/entities/VideoEntity.dart';

abstract class VideoPlayerRepo {
  ///get suggested videos
  Future<List<VideoEntity>?> getSuggestedVideo({required String videoTitle});

  ///generate video metadata
  Future<VideoDownloadEntity> getVideoMetaData({
    required String title,
    required String videoId,
    required String thumbnail,
    required String views,
    required String videoDuration,
  });

}
