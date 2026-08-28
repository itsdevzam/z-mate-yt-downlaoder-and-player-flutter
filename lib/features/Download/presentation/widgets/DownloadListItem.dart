import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_down/core/enum/DownloadType.dart';
import 'package:yt_down/core/model/DownloadModel.dart';
import 'package:yt_down/features/Download/data/RepoImpl/DownloadRepoImpl.dart';
import 'package:yt_down/helper/Helper.dart';

import '../../../../core/colors/MyColors.dart';

class DownloadListItem extends StatelessWidget {
  final DownloadModel downloadModel;

  DownloadListItem({super.key, required this.downloadModel});

  final _downloadRepoImpl = DownloadRepoImpl();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: MyColors.white,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        splashColor: Colors.grey.withValues(alpha: 0.2),
        highlightColor: Colors.grey.withValues(alpha: 0.1),
        onTap: () {
          if (downloadModel.status == DownloadTaskStatus.complete) {
            _downloadRepoImpl.openFile(downloadModel.taskId!);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(switch (downloadModel.fileType) {
                DownloadType.video => Iconsax.video,
                DownloadType.audio => Iconsax.music,
                DownloadType.unknown => Iconsax.folder,
              }, color: MyColors.primary),
              SizedBox(
                width: Helper.getScreenWidth(context) / 2,
                child: Text(
                  downloadModel.filename!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Spacer(),
              Icon(
                downloadModel.status == DownloadTaskStatus.complete
                    ? Iconsax.tick_circle
                    : Iconsax.arrow_down,
                size: 20,
                color: downloadModel.status == DownloadTaskStatus.complete
                    ? Colors.green
                    : Colors.red,
              ),
              IconButton(onPressed: () {}, icon: Icon(Iconsax.trash, size: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
