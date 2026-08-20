import 'package:flutter/material.dart';
import '../../../../core/colors/MyColors.dart';

class DownloadButtonBottomSheet extends StatelessWidget {
  final VoidCallback callback;
  const DownloadButtonBottomSheet({super.key,required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        alignment: .center,
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: MyColors.primary),
        ),
        child: Text(
          'Download',
          style: TextStyle(color: MyColors.primary,fontSize: 16,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
