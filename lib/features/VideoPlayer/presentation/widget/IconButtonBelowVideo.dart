import 'package:flutter/material.dart';

class IconButtonBelowVideo extends StatelessWidget {
  final IconData iconData;
  final String text;
  final String secondaryText;
  final VoidCallback callback;
  const IconButtonBelowVideo({super.key, required this.iconData, required this.text, required this.callback, this.secondaryText='null'});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: InkWell(
        onTap: callback,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            spacing: 5,
            children: [
              Icon(iconData,color: Colors.grey,size: 25,),
              Text(text=='null'?secondaryText:text),
            ],
          ),
        ),
      ),
    );
  }
}
