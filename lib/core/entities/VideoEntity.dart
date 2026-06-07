class VideoEntity {
  String videoId;
  String title;
  String views;
  String thumbnail;
  String author;
  String Description;
  String channeld;
  String VideoDuration;
  String UploadDateRaw;
  String likesCount;
  String dislikeCount;

  VideoEntity({
    required this.videoId,
    required this.title,
    required this.views,
    required this.thumbnail,
    required this.author,
    required this.Description,
    required this.channeld,
    required this.VideoDuration,
    required this.UploadDateRaw,
    required this.likesCount,
    required this.dislikeCount,
  });
}
