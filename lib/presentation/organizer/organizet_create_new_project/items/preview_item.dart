import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/organizer/organizet_create_new_project/controller/organizer_create_new_project_controller.dart';
import 'package:flutter/material.dart';
import '../../../../mobile_lib/app.dart';

class PreviewItem extends GetWidget<OrganizerCreateNewProjectController>{

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        FractionallySizedBox(
          widthFactor: 0.4,
          heightFactor: 1,
          child: RestartWidget(child: MobileMyApp(conference: controller.getConference)),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            onPressed: () {
              scaffoldMessengerKey?.currentState?.build(context);
              Get.dialog(Dialog(child: FractionallySizedBox(
                widthFactor: 0.3,
                heightFactor: 1,
                child: RestartWidget(child: MobileMyApp(conference:  controller.getConference,)),
              ),));
            },
            icon: Icon(Icons.fullscreen),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ElevatedButton(
            onPressed: () {
              // confirmation dialog for add new project
            Get.defaultDialog(
              title: "Create New Project",
              middleText: "Are you sure you want to create new project?",
              onConfirm: () {
                controller.addConference();
              },
            ) ;
            },
            child: Text("Create New Project"),
          ),
        ),
      ],
    );
  }
}
class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}