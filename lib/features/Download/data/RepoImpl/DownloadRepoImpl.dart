
import 'package:awesome_video_downloader/awesome_video_downloader.dart';

import '../../domain/DownloadRepo/DownloadRepo.dart';

class DownloadRepoImpl implements DownloadRepo{

  @override
  Future<void> downloadVideo(String videoUrl) async {
    final downloader = AwesomeVideoDownloader();
    await downloader.initialize();
    try {
      await downloader.startDownload(
        url: 'invalid_url',
        fileName: 'video.mp4',
        format: 'mp4',
      );
    } catch (e) {
      if (e is ArgumentError) {
        print('Invalid arguments: ${e.message}');
      } else {
        print('Download failed: $e');
      }
    }
  }

}