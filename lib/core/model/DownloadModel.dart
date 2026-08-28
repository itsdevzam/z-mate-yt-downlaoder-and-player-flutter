import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:yt_down/core/enum/DownloadType.dart';

class DownloadModel {
  String? taskId;
  DownloadTaskStatus? status;
  int? progress;
  String? url;
  String? filename;
  String? savedDir;
  int? timeCreated;
  bool? allowCellular;

  DownloadModel(
      {this.taskId,
        this.status,
        this.progress,
        this.url,
        this.filename,
        this.savedDir,
        this.timeCreated,
        this.allowCellular});

  DownloadModel.fromJson(Map<String, dynamic> json) {
    taskId = json['taskId'];
    status = json['status'];
    progress = json['progress'];
    url = json['url'];
    filename = json['filename'];
    savedDir = json['savedDir'];
    timeCreated = json['timeCreated'];
    allowCellular = json['allowCellular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskId'] = this.taskId;
    data['status'] = this.status;
    data['progress'] = this.progress;
    data['url'] = this.url;
    data['filename'] = this.filename;
    data['savedDir'] = this.savedDir;
    data['timeCreated'] = this.timeCreated;
    data['allowCellular'] = this.allowCellular;
    return data;
  }

  DownloadType get fileType {
    final name = filename?.toLowerCase() ?? '';

    if (name.contains('__audio.')) {
      return DownloadType.audio;
    }

    if (name.contains('__video.')) {
      return DownloadType.video;
    }

    return DownloadType.unknown;
  }

  DownloadModel copyWith({
    int? progress,
    DownloadTaskStatus? status,
  }) {
    return DownloadModel(
      taskId: taskId,
      allowCellular: allowCellular,
      filename: filename,
      progress: progress ?? this.progress,
      savedDir: savedDir,
      status: status ?? this.status,
      timeCreated: timeCreated,
      url: url,
    );
  }
}
