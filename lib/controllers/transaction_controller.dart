import 'package:get/get.dart';

class TransactionController extends GetxController {
  static TransactionController get transactionController => Get.find();

  RxString bookingCode = ''.obs;
  RxString uid = ''.obs;
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString ktp = ''.obs;
  RxString productName = ''.obs;
  RxString category = ''.obs;
  RxString bookingDate = ''.obs;
  RxString openTime = ''.obs;
  RxString paymentMethod = ''.obs;
  RxString image = ''.obs;
  RxString paymentDeadline = ''.obs;
  RxInt price = 0.obs;
  RxInt amount = 1.obs;
  RxInt totalPrice = 0.obs;
  RxString status = ''.obs;
  RxString timestamp = ''.obs;
}
