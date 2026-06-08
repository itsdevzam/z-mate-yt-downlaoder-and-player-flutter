import 'package:flutter/material.dart';
import 'package:yt_down/core/String/MyStrings.dart';
import 'package:yt_down/features/Search/presentation/screen/SearchScreen.dart';
import '../../../../core/colors/MyColors.dart';
import '../../../../core/widget/BottomCurveClipper.dart';


class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      clipper: BottomCurveClipper(),
      color: MyColors.black,
      shadowColor: MyColors.shadowColor,
      elevation: 5,
      child: ClipPath(
        clipper: BottomCurveClipper(),
        child: Container(
          padding: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(color: MyColors.white),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: MyColors.transparent,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu, color: Colors.black),
                  ),
                ),
                Text(
                  MyStrings.appName,
                  style: TextStyle(
                    color: MyColors.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: MyColors.primary,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
                    },
                    icon: Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
