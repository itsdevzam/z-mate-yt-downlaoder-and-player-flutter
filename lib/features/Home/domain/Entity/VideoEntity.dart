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
  });
}
