import 'package:get/get.dart';

class Controllers extends GetxController {

  RxBool isMax = true.obs;
  RxBool isHidden = true.obs;
  RxInt amount = 1.obs;
  RxBool isExpandCategory = false.obs;

  bool show() {
    return isMax.value = !isMax.value;
  }

  bool showFullCategory() {
    return isExpandCategory.value = !isExpandCategory.value;
  }

  add() {
    return amount++;
  }

  subtract() {
    if (amount >= 1) {
      amount--;
    }
    return amount;
  }

  toggleVisibility() {
    return isHidden.value = !isHidden.value;
  }
}
