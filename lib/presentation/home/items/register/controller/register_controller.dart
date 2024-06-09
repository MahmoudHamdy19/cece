import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/state_renderer/state_renderer.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/data/models/user/user_model.dart';
import 'package:cece/data/remote_data_source/user_remote_data_source.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  Rx<FlowState> state = Rx<FlowState>(ContentState());
  UserRemoteDataSource remoteDataSource = Get.find<UserRemoteDataSource>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordVerificationController = TextEditingController();
  register()async {
    state.value = LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState);
    if (passwordController.text == passwordVerificationController.text) {
      UserModel user = UserModel(
        name: nameController.text,
        email: emailController.text,
        userType: 'User',
      );
      (await remoteDataSource.register(user, passwordController.text)).fold((
          l) {
        state.value = ErrorState(StateRendererType.popupErrorState, l.message);
      }, (r) {
        Get.offAllNamed(AppRoutes.organizerCreateNewProject);
        state.value = ContentState();
      });
    }
    else {
      state.value =
          ErrorState(StateRendererType.popupErrorState, 'Password not match');
    }
  }

}