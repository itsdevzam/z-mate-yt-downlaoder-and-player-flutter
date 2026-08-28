import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_down/core/colors/MyColors.dart';
import 'package:yt_down/core/enum/DownloadType.dart';
import 'package:yt_down/core/model/DownloadModel.dart';
import 'package:yt_down/features/Download/data/RepoImpl/DownloadRepoImpl.dart';
import 'package:yt_down/features/Download/presentation/widgets/DownloadListItem.dart';

import '../../domain/DownloadRepo/DownloadRepo.dart';

class DownlaodPage extends StatefulWidget {
  final videoUrl;
  final videoTitle;
  final downloadType;
  final downloadFormat;
  final audioTag;
  final videoId;

  const DownlaodPage({
    super.key,
    required this.videoUrl,
    required this.videoTitle,
    required this.downloadType,
    required this.downloadFormat,
    required this.audioTag,
    required this.videoId,
  });

  @override
  State<DownlaodPage> createState() => _DownlaodPageState();
}

List<DownloadModel> downloadModelList = [];
final DownloadRepo downloadRepo = DownloadRepoImpl();

class _DownlaodPageState extends State<DownlaodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Downloads'), centerTitle: true),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (downloadModelList.isNotEmpty) {
            return DownloadListItem(downloadModel: downloadModelList[index]);
          } else {
            return Center(child: Text('No Data to show'));
          }
        },
        itemCount: downloadModelList.length,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDownloadList();
    startDownload();
  }

  void startDownload(){
    downloadRepo.downloadVideo(widget.videoUrl, widget.videoTitle,widget.downloadFormat,widget.downloadType,widget.audioTag,widget.videoId);
    setState(() {});
  }

  Future<void> getDownloadList() async {
    downloadModelList = await downloadRepo.showDownloadList();
    setState(() {});
  }
}
