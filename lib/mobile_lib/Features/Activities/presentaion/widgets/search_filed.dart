import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Core/Utils/App Colors.dart';

class SearchFiled extends StatelessWidget {
  final Function(String)? onChanged;

  const SearchFiled({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 14,
      ),
      decoration: const InputDecoration(
        isDense: true,
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          Iconsax.search_normal_1,
          color: AppColors.black,
          size: 18,
        ),
        hintText: 'Search ...',
        hintStyle: TextStyle(
          color: AppColors.darkGrey,
          fontSize: 14,
        ),
      ),
    );
  }
}
