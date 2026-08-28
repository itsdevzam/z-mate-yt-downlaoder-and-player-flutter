
import '../../../../core/enum/DownloadType.dart';
import '../../../../core/model/DownloadModel.dart';

abstract class DownloadRepo{
  ///Download Video
  ///Unused we use mux only
  // Future<void> downloadVideo(String videoUrl,String videoTitle,String downloadFormat,DownloadType downloadType,String audioTag,String videoId);
  Future<void> downloadVideo({required String videoUrl,required String videoTitle});
  ///Show Download List
  Future<List<DownloadModel>> showDownloadList();
  ///Cancel task
  Future<void> cancelTask(String taskId);
  ///Pause task
  Future<void> pauseTask(String taskId);
  ///Resume task
  Future<void> resumeTask(String taskId);
  ///Remove task
  Future<void> removeTask(String taskId);
  ///Retry Task
  Future<void> retryTask(String taskId);
  ///open File
  Future<void> openFile(String taskId);
}