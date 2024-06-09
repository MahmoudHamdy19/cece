

import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/components/programmer_side_menu.dart';
import 'package:cece/presentation/programmer/view_details/contenet_details_view.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.kBgLightColor,
        key: _scaffoldKey,
        drawer: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child:   ProgrammerSideMenu(0),
        ),
        body:  SingleChildScrollView(
          child: Center( child: ContenetDetailsView(),)
        ));
  }
}
