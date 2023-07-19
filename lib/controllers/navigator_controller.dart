import 'package:get/get.dart';

class NavigatorController extends GetxController {
  var myIndex = 0.obs;

  void changeIndex(int index) {
    myIndex.value = index;
  }
}