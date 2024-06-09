import 'package:cece/core/app_export.dart';
import 'package:cece/mobile_lib/Core/Utils/App%20Colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconData coloredIcon;
  final bool selected;

  const CustomBottomNavigationBarItem({
     required this.label,
    required this.icon,
    required this.coloredIcon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (selected)
            Stack(
              children: [
                Icon(
                  coloredIcon,
                  size: 22,
                  color: AppColors.white,
                ),
                Icon(
                  icon,
                  size: 30,
                ),
              ],
            )
          else
            Icon(
              icon,
              size: 22,
              color: AppColors.darkGrey.withOpacity(0.5),
            ),
          const SizedBox(height: 4),
          Text(label,
              style: AppTextStyles.w600.copyWith(
                fontSize: 12,
                color: selected
                    ? AppColors.primaryColor
                    : AppColors.darkGrey.withOpacity(0.45),
              )),
        ],
      ),
    );
  }
}
