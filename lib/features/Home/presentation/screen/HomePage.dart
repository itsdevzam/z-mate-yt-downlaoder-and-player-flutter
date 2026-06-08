import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:yt_down/core/colors/MyColors.dart';
import 'package:yt_down/features/Home/data/RepoImpl/Home_RepoIMPL.dart';
import 'package:yt_down/features/Home/presentation/widget/CustomAppbar.dart';
import 'package:yt_down/features/Home/presentation/widget/SingleVideoView.dart';

import '../../../../core/entities/VideoEntity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<VideoEntity>? homePageFeedList = [];
bool isLoading = false;
bool isLock = false;
int maxVideoList = 1;
int maxVideoListStop = 10; ///per page 20 videos
ScrollController _scrollController = ScrollController();

bool get maxCondition => (maxVideoList == maxVideoListStop);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///when load first time
          if (isLoading)
            Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: MyColors.primary,
                size: 50,
              ),
            ),

          ///when loading false and list empty
          if ((homePageFeedList == null || homePageFeedList!.isEmpty) && !isLoading)
            Center(
              child: Text(
                'Video List Not Available',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ///when list is not empty
          if (homePageFeedList != null && homePageFeedList!.isNotEmpty)
            Positioned.fill(
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.only(bottom: 15, top: 110),
                ///lock so when loading no other loading call happen
                ///max list mena on homepage max amount of list
                ///add extra one for loading or condition
                itemCount: isLock || maxCondition
                    ? homePageFeedList!.length + 1
                    : homePageFeedList!.length,
                itemBuilder: (context, index) {
                  ///when item added and show loading or video list ended
                  if (index == homePageFeedList!.length) {
                    ///when max video limit reach
                    if (maxCondition) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Center(
                          child: Text(
                            'Video List Ended',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      );
                    } else {
                      ///when loading animation need show
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: MyColors.primary,
                            size: 50,
                          ),
                        ),
                      );
                    }
                  }
                  ///single video item for video
                  return SingleVideoView(videoEntity: homePageFeedList![index]);
                },
              ),
            ),

          ///custom app bar
          Positioned(top: 0, right: 0, left: 0, child: CustomAppbar()),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomePage();
  }

  void getHomePage() async {
    ///only first time when app init then isLoading used
    isLoading = true;
    homePageFeedList = await Home_RepoIMPL().getHomePageFeed();
    isLoading = false;
    setState(() {});
    ///scroll check so show loading when scroll end
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !isLock &&
          maxVideoList < maxVideoListStop) {
        ///is lock so no multiple call made same time
        isLock = true;
        setState(() {});
        var temp = await Home_RepoIMPL().getHomePageFeed();
        homePageFeedList!.addAll(temp!);
        maxVideoList++;
        isLock = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}
