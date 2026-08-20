import 'package:yt_down/core/entities/VideoDownloadOption.dart';

class VideoDownloadEntity {
  String videoTitle;
  String thumbnail;
  String views;
  String videoDuration;
  final List<VideoDownloadOption> downloadOptions;

  VideoDownloadEntity({
    required this.videoTitle,
    required this.thumbnail,
    required this.views,
    required this.videoDuration,
    required this.downloadOptions,
  });
}
