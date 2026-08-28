import 'package:flutter/material.dart';
import 'package:yt_down/core/entities/VideoDownloadEntity.dart';
import 'package:yt_down/core/enum/DownloadStreamType.dart';
import 'package:yt_down/core/enum/DownloadType.dart';
import 'package:yt_down/features/VideoPlayer/presentation/widget/DownloadButtonBottomSheet.dart';
import '../../../../core/colors/MyColors.dart';
import '../../../../core/images/ImagePath.dart';
import '../../../../helper/Helper.dart';
import '../../../Download/presentation/screen/DownloadPage.dart';

class VideoDownloadBottomSheet {
  Future<void> showVideoDownloadBottomSheet({
    required BuildContext context,
    required VideoDownloadEntity videoDownloadEntity,
  }) {
    final videoOptions = videoDownloadEntity.downloadOptions
        .where((e) => e.type == DownloadStreamType.video)
        .toList();
    final muxOptions = videoDownloadEntity.downloadOptions
        .where((e) => e.type == DownloadStreamType.muxed)
        .toList();
    final audioOptions = videoDownloadEntity.downloadOptions
        .where((e) => e.type == DownloadStreamType.audio)
        .toList();

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        int selectedVideoIndex = 0;
        int selectedAudioIndex = 0;
        return StatefulBuilder(
          builder: (context, setState) => SizedBox(
            height: Helper.getScreenHeight(context) * 0.6,
            child: DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Column(
                children: [
                  ///header
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        right: 15,
                        left: 15,
                      ),
                      child: Row(
                        spacing: 7,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(10),
                              child: FadeInImage(
                                placeholder: AssetImage(ImagePath.placeHolder),
                                image: NetworkImage(
                                  videoDownloadEntity.thumbnail,
                                  scale: 0.5,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              videoDownloadEntity.videoTitle,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///Tab Buttons
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: TabBar(
                      dividerColor: MyColors.shadowColor,
                      indicatorColor: MyColors.primary,
                      labelColor: MyColors.primary,
                      tabs: const [
                        Tab(text: 'Video'),
                        Tab(text: 'Audio'),
                      ],
                    ),
                  ),

                  ///Tab View Body
                  Expanded(
                    child: ClipRect(
                      child: TabBarView(
                        children: [
                          ///VIEW 1
                          Stack(
                            clipBehavior: Clip.antiAlias,
                            children: [
                              ListView.builder(
                                itemBuilder: (context, index) => ListTile(
                                  tileColor: index == selectedVideoIndex
                                      ? MyColors.primary.withAlpha(150)
                                      : MyColors.transparent,
                                  leading: Container(
                                    alignment: .center,
                                    width: 80,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: MyColors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      '${muxOptions[index].quality} \n ${Helper.getFormat(muxOptions[index].format)}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    videoDownloadEntity.videoTitle,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(muxOptions[index].size),
                                  minTileHeight: 70,
                                  onTap: () {
                                    setState(() {
                                      selectedVideoIndex = index;
                                    });
                                  },
                                ),
                                itemCount: muxOptions.length,
                                padding: EdgeInsets.only(top: 5, bottom: 80),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: DownloadButtonBottomSheet(
                                    callback: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DownlaodPage(
                                            videoUrl:
                                                muxOptions[selectedVideoIndex]
                                                    .url,
                                            videoTitle:
                                                videoDownloadEntity.videoTitle,
                                            downloadType: DownloadType.video,
                                            audioTag:
                                                audioOptions[selectedAudioIndex]
                                                    .audioTag,
                                            videoId:
                                                videoDownloadEntity.videoId,
                                            downloadFormat: Helper.getFormat(
                                              muxOptions[selectedVideoIndex]
                                                  .format,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),

                          ///VIEW 2
                          Stack(
                            clipBehavior: Clip.antiAlias,
                            children: [
                              ListView.builder(
                                itemBuilder: (context, index) => ListTile(
                                  tileColor: index == selectedAudioIndex
                                      ? MyColors.primary.withAlpha(150)
                                      : MyColors.transparent,
                                  leading: Container(
                                    alignment: .center,
                                    width: 80,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: MyColors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      'Audio \n ${Helper.getFormat(audioOptions[index].format)}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  title: Text(audioOptions[index].trackName),
                                  subtitle: Text(audioOptions[index].size),
                                  minTileHeight: 70,
                                  onTap: () {
                                    setState(() {
                                      selectedAudioIndex = index;
                                    });
                                  },
                                ),
                                itemCount: audioOptions.length,
                                padding: EdgeInsets.only(top: 5, bottom: 80),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: DownloadButtonBottomSheet(
                                    callback: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DownlaodPage(
                                            videoUrl:
                                                audioOptions[selectedAudioIndex]
                                                    .url,
                                            videoTitle:
                                                videoDownloadEntity.videoTitle,
                                            downloadType: DownloadType.audio,
                                            audioTag:
                                                audioOptions[selectedAudioIndex]
                                                    .audioTag,
                                            videoId:
                                                videoDownloadEntity.videoId,
                                            downloadFormat: Helper.getFormat(
                                              audioOptions[selectedAudioIndex]
                                                  .format,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
