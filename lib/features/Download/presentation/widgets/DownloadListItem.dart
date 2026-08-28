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
  final VoidCallback onDelete;
  DownloadListItem({super.key, required this.downloadModel,required this.onDelete});

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
              Icon(Iconsax.video, color: MyColors.primary),
              // Icon(switch (downloadModel.fileType) {
              //   DownloadType.video => Iconsax.video,
              //   DownloadType.audio => Iconsax.music,
              //   DownloadType.unknown => Iconsax.folder,
              // }, color: MyColors.primary),
              SizedBox(
                width: Helper.getScreenWidth(context) / 2.2,
                child: Text(
                  downloadModel.filename!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Spacer(),
              downloadModel.status == DownloadTaskStatus.complete
                  ? const Icon(
                      Iconsax.tick_circle,
                      size: 20,
                      color: Colors.green,
                    )
                  : downloadModel.status == DownloadTaskStatus.failed
                  ? const Icon(
                      Iconsax.close_circle,
                      size: 20,
                      color: Colors.redAccent,
                    )
                  : SizedBox(
                      width: 30,
                      height: 30,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: MyColors.primary,
                            strokeWidth: 2,
                            backgroundColor: MyColors.secondary.withAlpha(100),
                            value: downloadModel.progress != null
                                ? downloadModel.progress! / 100
                                : 0,
                          ),
                          Text(
                            '${downloadModel.progress ?? 0}',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Are you sure you want delete this file?'),
                      backgroundColor: Colors.white,
                      titleTextStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            _downloadRepoImpl.removeTask(downloadModel.taskId!);
                            Navigator.pop(context);
                            onDelete();
                          },
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Iconsax.trash, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
