import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/state_renderer/state_renderer.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:cece/data/remote_data_source/programmer_remote_data_source.dart';


class ShowAllProjectsController extends GetxController {

  ProgrammerRemoteDataSource remoteDataSource = Get.find() ;
  RxList<OrganizerEvents> conferences = <OrganizerEvents>[].obs ;
  Rx<FlowState> state = Rx<FlowState>(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
  getAllConferences() async{
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
    (await remoteDataSource.getConferences()).fold((l){
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r){
      conferences.value = r;//.where((element) => element.status==0).toList();
      if(conferences.isEmpty){
        state.value = EmptyState('Empty Projects');
      }else {

        state.value = ContentState();
      }
    }) ;
  }

  acceptConference(OrganizerEvents conference)async{
    conference.status = 1;
    state.value = LoadingState(stateRendererType: StateRendererType.popupLoadingState);
    (await remoteDataSource.updateConferences(conference)).fold((l){
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r)async{
      await getAllConferences();
      state.value = SuccessState(StateRendererType.popupSuccessState, 'Successfully updated') ;
    }) ;
  }

  rejectConference(OrganizerEvents conference)async{
    conference.status = 3;
    state.value = LoadingState(stateRendererType: StateRendererType.popupLoadingState);
    (await remoteDataSource.updateConferences(conference)).fold((l){
      state.value = ErrorState(StateRendererType.popupErrorState, l.message);
    }, (r)async{
      await getAllConferences();
      state.value = SuccessState(StateRendererType.popupSuccessState, 'Successfully updated') ;
    }) ;
  }



  @override
  void onInit() {
    getAllConferences();
    super.onInit();
  }

}