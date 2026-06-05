import 'package:flutter/material.dart';
import 'package:yt_down/core/images/ImagePath.dart';
import 'package:yt_down/features/Home/domain/Entity/VideoEntity.dart';
import 'package:yt_down/features/VideoPlayer/presentation/screen/VideoPlayer.dart';
import 'package:yt_down/helper/Helper.dart';

class SingleVideoView extends StatelessWidget {
  final VideoEntity videoEntity;

  const SingleVideoView({super.key, required this.videoEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.only(top: 15, left: 13, right: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VideoPlayer(currentVideoUrl: videoEntity.videoId),
          ),
        ),
        child: Column(
          mainAxisSize: .max,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: FadeInImage(
                placeholder: AssetImage(ImagePath.placeHolder),
                image: NetworkImage(videoEntity.thumbnail, scale: 0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoEntity.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Text(
                    videoEntity.author,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Row(
                    spacing: 15,
                    children: [
                      Text(
                        '${Helper.viewsFormat(views: videoEntity.views)} views',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        videoEntity.UploadDateRaw,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
