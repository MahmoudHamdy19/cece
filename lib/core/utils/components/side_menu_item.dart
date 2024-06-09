
import 'package:cece/core/utils/color_constant.dart';
import 'package:flutter/material.dart';



class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    required this.isActive,
    this.isHover = false,
    required this.itemCount,
    this.showBorder = true,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) ;

  final bool isActive, isHover, showBorder;
  final int itemCount;
  final String  title;
  final IconData iconSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
             Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 12, right: 13 , top: 12 , left: 13),
                decoration: showBorder
                    ?    BoxDecoration(
                    color: isActive == true ?ColorConstant.primaryColor :null,
                   borderRadius: const BorderRadius.all(Radius.circular(6.0)),

                      )
                    : null,
                child: Row(
                  children: [
                     Icon(
                      iconSrc,
                      size: 22,
                      color: isActive ?Colors.white :ColorConstant.kGrayColor,
                    ),
                    const SizedBox(width:10.0),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.button?.copyWith(
                            color:
                                (isActive || isHover) ? Colors.white : ColorConstant.kGrayColor,
                          ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
