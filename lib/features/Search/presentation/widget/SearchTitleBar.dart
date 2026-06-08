import 'package:flutter/material.dart';

import '../../../../core/colors/MyColors.dart';
import '../../../../core/widget/BottomCurveClipper.dart';

class SearchTitleBar extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback callback;
  const SearchTitleBar({super.key, required this.textEditingController, required this.callback});

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
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(color: MyColors.white),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        hintText: 'How to ...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        label: Text(
                          'Search Here',
                          style: TextStyle(color: Colors.black54),
                        ),
                        contentPadding: EdgeInsets.only(left: 20)
                    ),
                    style: TextStyle(fontSize: 18),
                    cursorColor: MyColors.primary,
                  ),
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: MyColors.primary,
                  child: IconButton(
                    onPressed: callback,
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
