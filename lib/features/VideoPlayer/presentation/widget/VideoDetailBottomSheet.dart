import 'package:flutter/material.dart';

import '../../../../core/entities/VideoEntity.dart';
import '../../../../helper/Helper.dart';

class VideoDetailBottomSheet {
  Future<void> showVideoDetailBottomSheet({
    required BuildContext context,
    required VideoEntity videoEntity,
  }) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          height: Helper.getScreenHeight(context) / 2.5,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 10,
              children: [
                Text(
                  videoEntity.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      'Author: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: Text(videoEntity.author)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Views: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        '${Helper.viewsFormat(views: videoEntity.views)} views',
                      ),
                    ),
                  ],
                ),

                Text(
                  'Description:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(videoEntity.Description),
              ],
            ),
          ),
        );
      },
    );
  }
}
