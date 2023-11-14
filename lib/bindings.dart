import 'package:festa_task/controller/home_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // Get.put<HomeController>(HomeController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
