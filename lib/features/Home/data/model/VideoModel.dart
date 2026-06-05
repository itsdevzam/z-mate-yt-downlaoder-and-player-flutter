import 'package:yt_down/features/Home/domain/Entity/VideoEntity.dart';

class VideoModel extends VideoEntity {
  VideoModel({
    required super.videoId,
    required super.title,
    required super.views,
    required super.thumbnail,
    required super.author,
    required super.Description,
    required super.channeld,
    required super.VideoDuration,
    required super.UploadDateRaw,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      videoId: json['videoId'],
      title: json['title'],
      views: json['views'],
      thumbnail: json['thumbnail'],
      author: json['author'],
      Description: json['Description'],
      channeld: json['channeld'],
      VideoDuration: json['VideoDuration'],
      UploadDateRaw: json['UploadDateRaw'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'videoId': videoId,
      'title': title,
      'views': views,
      'thumbnail': thumbnail,
      'author': author,
      'Description': Description,
      'channeld': channeld,
      'Duration': VideoDuration,
      'UploadDateRaw': UploadDateRaw,
    };
  }
}
