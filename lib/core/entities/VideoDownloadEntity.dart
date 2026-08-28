import 'package:yt_down/core/entities/VideoDownloadOption.dart';

class VideoDownloadEntity {
  String videoTitle;
  String thumbnail;
  String views;
  String videoDuration;
  String videoId;
  final List<VideoDownloadOption> downloadOptions;

  VideoDownloadEntity({
    required this.videoTitle,
    required this.thumbnail,
    required this.views,
    required this.videoDuration,
    required this.videoId,
    required this.downloadOptions,
  });
}
