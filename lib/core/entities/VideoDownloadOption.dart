import '../enum/DownloadStreamType.dart';

class VideoDownloadOption {
  final String quality;
  final String format;
  final String url;
  final DownloadStreamType type;

  VideoDownloadOption({
    required this.quality,
    required this.format,
    required this.url,
    required this.type
  });
}