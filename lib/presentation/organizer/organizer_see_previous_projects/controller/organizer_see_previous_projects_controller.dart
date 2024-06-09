import 'package:cece/core/app_export.dart';
import 'package:cece/core/utils/state_renderer/state_renderer.dart';
import 'package:cece/core/utils/state_renderer/state_renderer_impl.dart';
import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:cece/data/remote_data_source/user_remote_data_source.dart';

class OrganizerSeePreviousProjectsController extends GetxController {
  Rx<FlowState> state =Rx<FlowState>(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
  RxList<OrganizerEvents> conferences = RxList<OrganizerEvents>([]);
  UserRemoteDataSource remoteDataSource = Get.find<UserRemoteDataSource>() ;

  getConferences()async{
    state.value = LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState);
    (await remoteDataSource.getConferences()).fold((l){
      state.value = ErrorState(StateRendererType.popupErrorState, l.message) ;
    }, (r){
      conferences.value = r;
      if(conferences.isEmpty){
        state.value = EmptyState('No conferences found') ;
      }else{
      state.value = ContentState() ;
      }
    });
  }

  @override
  void onInit() {
    getConferences();
    super.onInit();
  }
}