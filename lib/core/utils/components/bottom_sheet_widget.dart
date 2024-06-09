 import 'package:cece/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';


class BottomSheetWidget extends StatelessWidget {
  final String name;
  final String title;
  final String label;
  final VoidCallback onTap;
  final String? value;
  final IconData? leadingIcon;
  bool isShow;

  BottomSheetWidget({
     required this.name,
    required this.label,
    required this.onTap,
    this.value,
    this.leadingIcon,
    this.isShow = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          const SizedBox(
            height: 10,
          ),
          FormBuilderField(
            name: name,
            builder: (field) {
              return CustomInputDecorator(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                onTap: onTap,
                leadingIcon: leadingIcon,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (value == null)
                      Text(
                        label,
                        style: const TextStyle(
                          color: ColorConstant.darkGrey,
                          fontSize: 14,
                        ),
                      )
                    else ...[
                      Text(
                        label,
                        style: const TextStyle(
                          color: ColorConstant.darkGrey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        value!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ],
                ),
                trailing: isShow == false ?   Icon(
                  Iconsax.edit_2,
                  color: ColorConstant.primaryColor,
                  size: 24,
                ) : null,
              );
            },
          ),
        ],
      ),
    );
  }
}


class CustomInputDecorator extends StatelessWidget {
  final Widget body;
  final IconData? leadingIcon;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color leadingIconColor;
  final bool focused;
  final EdgeInsets padding;
  final bool disableTapRippleEffect;

  const CustomInputDecorator({
     required this.body,
    this.leadingIcon,
    this.trailing,
    this.onTap,
    this.leadingIconColor = Colors.black,
    this.focused = false,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.disableTapRippleEffect = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        overlayColor: disableTapRippleEffect
            ? MaterialStateColor.resolveWith(
              (states) => Colors.transparent,
        )
            : null,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorConstant.primaryColor,
                width:2,
                strokeAlign: 1,
              )),
          child: Row(
            children: [
              if (leadingIcon != null) ...[
                Icon(
                  leadingIcon,
                  color: leadingIconColor,
                  size: 24,
                ),
                const SizedBox(width: 12),
              ],
              Expanded(child: body),
              if (trailing != null) ...[
                const SizedBox(width: 12),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}