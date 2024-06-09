import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/state_renderer/state_renderer.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/data/models/user/user_model.dart';
import 'package:cece/data/remote_data_source/user_remote_data_source.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  Rx<UserModel?> user =Rx<UserModel?>(null);
  Rx<FlowState> state =Rx<FlowState>(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
  UserRemoteDataSource remoteDataSource = Get.find<UserRemoteDataSource>();
  late TextEditingController firstnameController = TextEditingController();
  late TextEditingController lastnameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();

  RxBool isEditing = false.obs;

  editMode(){
    isEditing.value = !isEditing.value ;
  }

  Future<void>getProfile()async{
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
    (await remoteDataSource.getProfile()).fold((l){
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r){
      user.value = r ;
      state.value = ContentState();
    });
  }


  Future<void>updateProfile()async {
  UserModel userModel = UserModel(
    lastName: lastnameController.text,
    email: user.value?.email??'',
    uId:  user.value?.uId??'',
    userType:  user.value?.userType??'',
    name: firstnameController.text ,
    phone: phoneController.text,
  );
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
    (await remoteDataSource.updateProfile(userModel)).fold((l){
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r){
      isEditing.value = false ;
      state.value =SuccessState(StateRendererType.popupSuccessState, 'Successfully profile updated');
    });
  }

  @override
  void onInit() async{
    await getProfile();
    firstnameController .text =  user.value!.name??'';
    lastnameController .text =  user.value!.lastName??'';
    emailController.text =  user.value!.email??'';
    phoneController.text = user.value!.phone??'';
    super.onInit();
  }

}