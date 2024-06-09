 import 'package:flutter/material.dart';

import '../../App Colors.dart';
import '../../App Textstyle.dart';
import '../../Responsive.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabChanged;
  final Color backgroundColor;
    Color? selectedColor = AppColors.primaryColor;
  final bool disableShadow;
  final EdgeInsets padding;
  final EdgeInsets itemPadding;

    CustomTabBar({
     required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
    this.backgroundColor = AppColors.white,
    this.selectedColor ,
    this.disableShadow = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 1),
    this.itemPadding = const EdgeInsets.all(9),
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQueryHelper.sizeFromWidth(context, 1),
      // height: MediaQueryHelper.sizeFromHeight(context, 13),
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      padding: EdgeInsets.all(5),

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          if (!disableShadow)
            const BoxShadow(
              color: AppColors.grey,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < tabs.length; i++)
            CustomTabBarItem(
              padding: itemPadding,
              backgroundColor: backgroundColor,
              label: tabs[i],
              selectedColor: selectedColor??AppColors.primaryColor,
              selected: selectedIndex == i,
              onTap: () => onTabChanged(i),
            )
        ],
      ),
    );
  }
}

class CustomTabBarItem extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color backgroundColor;
    Color? selectedColor= AppColors.primaryColor;
  final EdgeInsets padding;

    CustomTabBarItem({
     required this.label,
    required this.selected,
    required this.onTap,
    this.backgroundColor = AppColors.white,
    this.selectedColor,
    this.padding = const EdgeInsets.all(2),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:5, ),
padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: selected ? selectedColor: backgroundColor,
        borderRadius: BorderRadius.circular(15),

      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Padding(
            padding: padding,
            child: FittedBox(
              child: Text(
                label,
                maxLines: 1,
                style: AppTextStyles.bold.copyWith(
                  color: selected ?  AppColors.white : AppColors.mediumGrey,
                  fontSize: 16,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
