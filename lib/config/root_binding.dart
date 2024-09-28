import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:randomusers_getx/controllers/home_controller.dart';

class RootBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(()=> HomeController(), fenix: true);

  }
}