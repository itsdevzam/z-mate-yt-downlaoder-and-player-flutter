import 'dart:io';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:yt_down/core/enum/DownloadType.dart';
import 'package:yt_down/core/model/DownloadModel.dart';
import 'package:yt_down/core/services/PythonServices.dart';
import 'package:yt_down/helper/Helper.dart';
import '../../../../core/colors/MyColors.dart';
import '../../domain/DownloadRepo/DownloadRepo.dart';

class DownloadRepoImpl implements DownloadRepo {
  List<DownloadModel> downloadModelListRepo = [];

  @override
  Future<List<DownloadModel>> showDownloadList() async {
    final List<DownloadTask>? tasks = await FlutterDownloader.loadTasks();
    if (tasks != null) {
      downloadModelListRepo.clear();
      downloadModelListRepo = tasks.map((element) {
        return DownloadModel(
          taskId: element.taskId,
          allowCellular: element.allowCellular,
          filename: element.filename,
          progress: element.progress,
          savedDir: element.savedDir,
          status: element.status,
          timeCreated: element.timeCreated,
          url: element.url,
        );
      }).toList();
      return downloadModelListRepo;
    }
    return [];
  }

  @override
  Future<void> cancelTask(String taskId) async {
    FlutterDownloader.cancel(taskId: taskId);
  }

  @override
  Future<void> openFile(String taskId) async {
    FlutterDownloader.open(taskId: taskId);
  }

  @override
  Future<void> pauseTask(String taskId) async {
    FlutterDownloader.pause(taskId: taskId);
  }

  @override
  Future<void> removeTask(String taskId) async {
    FlutterDownloader.remove(taskId: taskId, shouldDeleteContent: true);
  }

  @override
  Future<void> resumeTask(String taskId) async {
    FlutterDownloader.resume(taskId: taskId);
  }

  @override
  Future<void> retryTask(String taskId) async {
    FlutterDownloader.retry(taskId: taskId);
  }

  @override
  Future<void> downloadVideo({
    required String videoUrl,
    required String videoTitle,
  }) async {
    final taskId = await FlutterDownloader.enqueue(
      url: videoUrl,
      savedDir: '/storage/emulated/0/Download',
      showNotification: true,
      openFileFromNotification: true,
      fileName: Helper.sanitizeFileName(videoTitle),
    );
    if (taskId == null) {
      Fluttertoast.showToast(msg: 'Download not started',backgroundColor: MyColors.primary);
      return;
    } else {
      Fluttertoast.showToast(msg: 'Download started',backgroundColor: MyColors.primary);
    }
  }

  ///unused we use mux only
  // @override
  // Future<void> downloadVideo(
  //   String videoUrl,
  //   String videoTitle,
  //   String downloadFormat,
  //   DownloadType downloadType,
  //   String audioTag,
  //   String videoId,
  // ) async {
  //
  //   // Check/request storage first.
  //   final directory =
  //   await PythonServices.ensureStorageAccess();
  //
  //   if (directory == null) {
  //
  //     print(
  //       'Storage permission not granted yet.',
  //     );
  //
  //     return;
  //   }
  //
  //   print(
  //     'Download directory: $directory',
  //   );
  //
  //
  //   final postfix = downloadType == DownloadType.audio ? '__audio' : '__video';
  //   final fileName =
  //       '${Helper.sanitizeFileName(videoTitle)}$postfix.${downloadFormat.toLowerCase()}';
  //
  //   ///for audio
  //   final savePath = '/storage/emulated/0/Download/$fileName';
  //   if (downloadType == DownloadType.video) {
  //     final taskId = await FlutterDownloader.enqueue(
  //       url: videoUrl,
  //       savedDir: '/storage/emulated/0/Download',
  //       showNotification: true,
  //       openFileFromNotification: true,
  //       fileName: fileName,
  //     );
  //   } else {
  //     final success = await PythonServices.downloadAudio(
  //       videoId: videoId,
  //       audioTag: audioTag,
  //     );
  //
  //     print('DOWNLOAD RESULT: $success');
  //   }
  // }
}
