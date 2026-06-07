import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:yt_down/core/colors/MyColors.dart';
import 'package:yt_down/features/VideoPlayer/data/RepoImpl/VideoPlayerRepoImpl.dart';
import 'package:yt_down/features/VideoPlayer/presentation/widget/BottomCurveClipper.dart';
import 'package:yt_down/features/VideoPlayer/presentation/widget/IconButtonBelowVideo.dart';
import 'package:yt_down/features/VideoPlayer/presentation/widget/SuggestedVideoLayout.dart';
import 'package:yt_down/features/VideoPlayer/presentation/widget/VideoDetailBottomSheet.dart';
import '../../../../core/entities/VideoEntity.dart';
import '../widget/OmniPlayer.dart';

class VideoPlayer extends StatefulWidget {
  final VideoEntity videoEntity;

  const VideoPlayer({super.key, required this.videoEntity});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

List<VideoEntity>? suggestedVideoList = [];
bool _isLoading = false;

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: [
              Positioned.fill(
                top: 300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Column(
                    children: [
                      ///when load first time
                      if (_isLoading)
                        Expanded(
                          child: Center(
                            child: LoadingAnimationWidget.fourRotatingDots(
                              color: MyColors.primary,
                              size: 50,
                            ),
                          ),
                        ),

                      ///when loading false and list empty
                      if ((suggestedVideoList == null || suggestedVideoList!.isEmpty) &&
                          !_isLoading)
                        Expanded(
                          child: Center(
                            child: Text(
                              'Video List Not Available',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                      ///when list is not empty
                      if (suggestedVideoList != null &&
                          suggestedVideoList!.isNotEmpty &&
                          !_isLoading)
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 25,
                                    bottom: 20,
                                  ),
                                  child: Text(
                                    'Suggested Videos',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return SuggestedVideoLayout(
                                      videoEntity: suggestedVideoList![index],
                                    );
                                  },
                                  itemCount: suggestedVideoList!.length,
                                  shrinkWrap: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              PhysicalShape(
                clipper: BottomCurveClipper(),
                color: Colors.white,
                elevation: 5,
                child: ClipPath(
                  clipper: BottomCurveClipper(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: .start,
                    children: [
                      ///Youtube Player
                      OmniPlayer(currentVideoUrl: widget.videoEntity.videoId),

                      ///Title Area
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.videoEntity.title,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                ///Video Detail Bottom Sheet
                                VideoDetailBottomSheet()
                                    .showVideoDetailBottomSheet(
                                  context: context,
                                  videoEntity: widget.videoEntity,
                                );
                              },
                              icon: Icon(Iconsax.arrow_down_1),
                            ),
                          ],
                        ),
                      ),

                      ///Buttons Area
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            IconButtonBelowVideo(
                              iconData: Iconsax.like_1,
                              text: widget.videoEntity.likesCount,
                              secondaryText: 'Like',
                              callback: () {},
                            ),
                            IconButtonBelowVideo(
                              iconData: Iconsax.dislike,
                              text: widget.videoEntity.likesCount,
                              secondaryText: 'Dislike',
                              callback: () {},
                            ),
                            IconButtonBelowVideo(
                              iconData: Iconsax.copy,
                              text: 'Copy ID',
                              callback: () {
                                ///copy to clipboard
                                Clipboard.setData(
                                  ClipboardData(
                                    text:
                                    'https://www.youtube.com/watch?v=${widget.videoEntity.videoId}',
                                  ),
                                );
                                Fluttertoast.showToast(
                                  msg: "Video URL Copied",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: MyColors.primary,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              },
                            ),
                            IconButtonBelowVideo(
                              iconData: Iconsax.arrow_down_2,
                              text: 'Download',
                              secondaryText: 'Likes',
                              callback: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSuggestedVideos();
  }

  void getSuggestedVideos() async {
    ///only first time when app init then isLoading used
    _isLoading = true;
    suggestedVideoList = await VideoPlayerRepoImpl().getSuggestedVideo(
      videoTitle: widget.videoEntity.title,
    );
    _isLoading = false;
    setState(() {});
  }


}
