

import '../../../../core/entities/VideoEntity.dart';

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
    required super.likesCount,
    required super.dislikeCount,
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
      likesCount: json['likesCount'],
      dislikeCount: json['dislikeCount'],
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
      'likesCount': likesCount,
      'dislikeCount': dislikeCount,
    };
  }
}
