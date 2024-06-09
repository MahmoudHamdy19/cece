import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/presentation/programmer/coding_stage/contenet_coding_stage.dart';
import 'package:cece/presentation/programmer/coding_stage/controller/coding_stage_controller.dart';
import 'package:flutter/material.dart';

class CodingStageView extends GetWidget<CodingStageController>{

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.kBgLightColor,
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Obx(()=>controller.state.value.getScreenWidget(_body(), (){})),
        ));
  }

  _body()=>GridView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,childAspectRatio: .9
    ),
    itemCount: controller.conferences.length,
    itemBuilder: (BuildContext ctx, index) {
      return ContentCodingStageItem(index);
    },
  );
}
