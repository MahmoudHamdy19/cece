import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/state_renderer/state_renderer.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/data/remote_data_source/user_remote_data_source.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  Rx<FlowState> state = Rx<FlowState>(ContentState());
  UserRemoteDataSource remoteDataSource = Get.find<UserRemoteDataSource>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  login() async {
    state.value = LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState);
    (await remoteDataSource.login(
            emailController.text, passwordController.text))
        .fold((l) {
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r) {
      if (r == 'Programmer') {
        Get.offAndToNamed(AppRoutes.programmerShowAllProjects);
      } else {
        Get.offAllNamed(AppRoutes.organizerCreateNewProject);
      }
      state.value = ContentState();
    });
  }
}
