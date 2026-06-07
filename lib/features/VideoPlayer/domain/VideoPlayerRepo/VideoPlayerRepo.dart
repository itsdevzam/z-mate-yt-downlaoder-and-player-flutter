

import '../../../../core/entities/VideoEntity.dart';

abstract class VideoPlayerRepo {
  ///get suggested videos
  Future<List<VideoEntity>?> getSuggestedVideo({required String videoTitle});
}