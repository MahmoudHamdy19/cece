import 'package:cece/data/models/conference/organizer_events_model.dart';
import 'package:get/get.dart';

class TabsController extends GetxController{
    RxInt selectedIndex = 0.obs;
    toggleIndex(int index){
        selectedIndex.value = index;
    }

}