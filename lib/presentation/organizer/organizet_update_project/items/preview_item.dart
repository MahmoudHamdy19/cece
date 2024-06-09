import 'package:cece/core/app_export.dart';
import 'package:cece/presentation/organizer/organizet_update_project/controller/organizer_update_project_controller.dart';
import 'package:flutter/material.dart';
import '../../../../mobile_lib/app.dart';

class PreviewItem extends GetWidget<OrganizerUpdateProjectController>{

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
          alignment: Alignment.topRight,
          child: ElevatedButton(
            onPressed: () {
              // confirmation dialog for add new project
              Get.defaultDialog(
                title: "Update Project",
                middleText: "Are you sure you want to update project?",
                onConfirm: () {
                  controller.updateConference();
                },
              ) ;
            },
            child: Text("Update Project"),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            onPressed: () {
              scaffoldMessengerKey?.currentState?.build(context);
              Get.dialog(Dialog(child: FractionallySizedBox(
                widthFactor: 0.3,
                heightFactor: 1,
                child: RestartWidget(child: MobileMyApp(conference:controller.getConference,)),
              ),));
            },
            icon: Icon(Icons.fullscreen),
          ),
        )
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