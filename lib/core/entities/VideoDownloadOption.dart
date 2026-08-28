import '../enum/DownloadStreamType.dart';

class VideoDownloadOption {
  final String quality;
  final String format;
  final String url;
  final String size;
  final String trackName;
  final String audioTag;
  final DownloadStreamType type;

  VideoDownloadOption({
    required this.quality,
    required this.format,
    required this.url,
    required this.size,
    required this.trackName,
    required this.type,
    required this.audioTag,
  });
}