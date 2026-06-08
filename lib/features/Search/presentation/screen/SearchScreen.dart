import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:yt_down/features/Search/data/RepoImpl/SearchRepoImpl.dart';
import 'package:yt_down/features/Search/presentation/widget/SearchTitleBar.dart';

import '../../../../core/colors/MyColors.dart';
import '../../../../core/entities/VideoEntity.dart';
import '../widget/SingleVideoView.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

TextEditingController textEditingController = TextEditingController();
List<VideoEntity>? searchFeedList = [];
bool isLoading = false;

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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

          //when loading false and list empty
          if ((searchFeedList == null || searchFeedList!.isEmpty) && !isLoading)
            Center(
              child: Text(
                'Search Videos Here',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ///when list is not empty
          if (searchFeedList != null && searchFeedList!.isNotEmpty)
            Positioned.fill(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 15, top: 130),
                itemCount: searchFeedList!.length,
                itemBuilder: (context, index) {
                  ///single video item for video
                  return SingleVideoView(videoEntity: searchFeedList![index]);
                },
              ),
            ),

          ///search top bar
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SearchTitleBar(
              textEditingController: textEditingController,
              callback: () {
                callSearch(query: textEditingController.text.trim());
              },
            ),
          ),
        ],
      ),
    );
  }

  void callSearch({required String query}) async {
    isLoading = true;
    searchFeedList = null;
    setState(() {});
    searchFeedList = await SearchRepoImpl().getSearchSuggestions(query: query);
    isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    searchFeedList=null;
    textEditingController.clear();
    super.dispose();
  }
}
