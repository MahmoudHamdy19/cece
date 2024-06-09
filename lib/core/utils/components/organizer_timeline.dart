import 'package:cece/core/app_export.dart';
import 'package:flutter/material.dart';


class TimelineItem extends StatelessWidget {
   final int index;
  final String title;
  final int currentTabTagIndex;
  final Function(int) onTap;

    TimelineItem({
     required this.index,
    required this.title,
    required this.currentTabTagIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key ,
      onTap: () {
        onTap(index);
       },
      child: Container(
        width: 141,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: index == currentTabTagIndex
                ? ColorConstant.primaryColor
                : Colors.grey,
            width: 2.2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: index == currentTabTagIndex
                  ? ColorConstant.primaryColor
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
