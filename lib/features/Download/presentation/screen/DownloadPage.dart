import 'package:flutter/material.dart';
import 'package:yt_down/features/Download/data/RepoImpl/DownloadRepoImpl.dart';

class DownlaodPage extends StatefulWidget {
  final videoUrl;

  const DownlaodPage({super.key, required this.videoUrl});

  @override
  State<DownlaodPage> createState() => _DownlaodPageState();
}

class _DownlaodPageState extends State<DownlaodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Downloads'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () => DownloadRepoImpl().downloadVideo(widget.videoUrl),
              child: Container(height: 100, width: 100, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
