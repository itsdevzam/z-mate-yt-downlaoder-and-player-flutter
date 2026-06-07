import 'package:flutter/material.dart';
import 'package:yt_down/core/entities/VideoEntity.dart';

import '../../../../core/images/ImagePath.dart';
import '../../../../helper/Helper.dart';

class SuggestedVideoLayout extends StatelessWidget {
  final VideoEntity videoEntity;

  const SuggestedVideoLayout({super.key, required this.videoEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: .spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              // width: Helper.getScreenWidth(context) / 2,
              height: 100,
              child: FadeInImage(
                placeholder: AssetImage(ImagePath.placeHolder),
                image: NetworkImage(videoEntity.thumbnail),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: .spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Helper.getScreenWidth(context) / 2,
                child: Text(
                  videoEntity.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Row(
                spacing: 5,
                children: [
                  Text(
                    '${Helper.viewsFormat(views: videoEntity.views)} -',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: Helper.getScreenWidth(context) / 3,
                    child: Text(
                      videoEntity.UploadDateRaw,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: Helper.getScreenWidth(context)/2,
                child: Text(
                  videoEntity.author,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
