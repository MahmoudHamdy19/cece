import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/components/programmer_side_menu.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/presentation/home/items/home/home_item.dart';
import 'package:cece/presentation/programmer/show_all_projects/content_project.dart';
import 'package:cece/presentation/programmer/show_all_projects/controller/show_all_projects_controller.dart';
import 'package:flutter/material.dart';


class AllProjectViewItem extends GetWidget<ShowAllProjectsController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.kBgLightColor,
         drawer: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child:   ProgrammerSideMenu(0),
        ),
        body: SingleChildScrollView(
          child: Obx(()=>controller.state.value.getScreenWidget(_body(), (){
            controller.getAllConferences();
          }))
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
      return ContentProject(index);
    },
  );
}

class AllProjectView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: ProgrammerSideMenu(0),
       backgroundColor: ColorConstant.kBgLightColor,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !isDesktop(context)
              ? Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: IconButton(
                    icon: Builder(
                      builder: (context) {
                        return const Icon(Icons.menu);
                      }
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ),
            ],
          )
              : Expanded(
            flex: size.width > 1340 ? 2 : 3,
            child:  ProgrammerSideMenu(0),
          ),
          Expanded(
              flex: 10,
              child: AllProjectViewItem()
          ),
        ],
      ),
    );
  }
}
