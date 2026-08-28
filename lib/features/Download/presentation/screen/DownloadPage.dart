import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_down/core/colors/MyColors.dart';
import 'package:yt_down/core/enum/DownloadType.dart';
import 'package:yt_down/core/model/DownloadModel.dart';
import 'package:yt_down/features/Download/data/RepoImpl/DownloadRepoImpl.dart';
import 'package:yt_down/features/Download/presentation/widgets/DownloadListItem.dart';

import '../../../Home/presentation/widget/CustomAppbar.dart';
import '../../domain/DownloadRepo/DownloadRepo.dart';

class DownlaodPage extends StatefulWidget {
  // final videoUrl;
  // final videoTitle;
  // final downloadType;
  // final downloadFormat;
  // final audioTag;
  // final videoId;

  const DownlaodPage({
    super.key,
    // required this.videoUrl,
    // required this.videoTitle,
    // required this.downloadType,
    // required this.downloadFormat,
    // required this.audioTag,
    // required this.videoId,
  });

  @override
  State<DownlaodPage> createState() => _DownlaodPageState();
}

@pragma('vm:entry-point')
void downloadCallback(String id, int status, int progress) {
  final SendPort? send = IsolateNameServer.lookupPortByName(
    'downloader_send_port',
  );

  send?.send([id, status, progress]);
}

ReceivePort _port = ReceivePort();
List<DownloadModel> downloadModelList = [];
final DownloadRepo downloadRepo = DownloadRepoImpl();

class _DownlaodPageState extends State<DownlaodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          downloadModelList.isEmpty
              ? const Center(child: Text('No Data to show'))
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 110),
                  itemCount: downloadModelList.length,
                  itemBuilder: (context, index) {
                    final download =
                    downloadModelList[downloadModelList.length - 1 - index];
                    return DownloadListItem(
                      downloadModel: download,
                      onDelete: () {
                        getDownloadList();
                      },
                    );
                  },
                ),

          ///custom app bar
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: CustomAppbar(text: 'Downloads'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getDownloadList();
        },
        backgroundColor: MyColors.primary,
        child: Icon(Iconsax.refresh, color: Colors.white),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    progressCallback();
  }

  void progressCallback(){
    IsolateNameServer.removePortNameMapping('downloader_send_port');

    IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );

    _port.listen((dynamic data) {
      final String id = data[0];
      final DownloadTaskStatus status = DownloadTaskStatus.fromInt(data[1]);
      final int progress = data[2];
      final index = downloadModelList.indexWhere((item) => item.taskId == id);
      if (index == -1) {
        getDownloadList();
        return;
      }
      if (!mounted) return;
      setState(() {
        downloadModelList[index] = downloadModelList[index].copyWith(
          progress: progress,
          status: status,
        );
      });
    });

    FlutterDownloader.registerCallback(downloadCallback);

    getDownloadList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  // void startDownload(){
  //   downloadRepo.downloadVideo(widget.videoUrl, widget.videoTitle,widget.downloadFormat,widget.downloadType,widget.audioTag,widget.videoId);
  //   setState(() {});
  // }

  Future<void> getDownloadList() async {
    downloadModelList = await downloadRepo.showDownloadList();
    setState(() {});
  }
}
