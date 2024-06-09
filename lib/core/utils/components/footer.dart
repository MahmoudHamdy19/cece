import 'package:cece/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../presentation/home/items/home/home_item.dart';


class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (!isMobile(context)) ? const DesktopFooter() : const MobileFooter();
  }
}

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        children: <Widget>[
          const Expanded(
              flex: 1,
              child: Text(
                'All Right Reserved',
                style: TextStyle(
                    fontSize: 10
                ),
              )
          ),

          Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                ],
              )
          ),
        ],
      ),
    );
  }
}

class MobileFooter extends StatelessWidget {
  const MobileFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        children: <Widget>[
          const Text(
            'All Right Reserved',
            style: TextStyle(
                fontSize: 10
            ),
          ),
          const SizedBox(height: 15,),
          Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
              ]
          )
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key? key,
    required this.title,
    required this.tapEvent
  }) : super(key: key);

  final String title;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      hoverColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          style: AppTextStyles.w600.copyWith(
              color: ColorConstant.primaryColor,
              fontFamily: "Cairo",
              fontSize: 12
          ),
        ),
      ),
    );
  }
}