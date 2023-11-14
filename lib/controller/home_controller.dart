import 'package:festa_task/model/user_model.dart';
import 'package:festa_task/networkHelper/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Results> result = RxList.empty();
  Rx<String?> selectedgender = Rx<String?>(null);
  RxBool isloading = false.obs;

  Future<void> getuserinfo(String? gender) async {
    isloading(true);

    result.value = await ApiService.getuserdata(gender);
    isloading(false);
  }

  void changegender(String? value) {
    if (value == null) {
      selectedgender.value = null;
      return;
    }
    selectedgender(value);
    print(value);
  }

  void onbuttonpressed() {
    getuserinfo(selectedgender.value);
    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getuserinfo(null);
  }
}
