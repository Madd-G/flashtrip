import 'package:flashtrip/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/transaction_controller.dart';
import '../../../utils/constant.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransactionController transactionController =
        Get.put<TransactionController>(TransactionController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pembayaran',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10),
            child: SizedBox(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    transactionController.image.value,
                    height: 80.0,
                    width: 90.0,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    transactionController.paymentMethod.value,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 3.0,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              // height: 330.0,
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      child: Text(
                        Constant.oCcy.format(transactionController.price.value *
                            transactionController.amount.value),
                        style: const TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w900),
                      ),
                    ),
                    const Divider(
                      thickness: 2.0,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      child: Column(
                        children: const [
                          Text(
                            'Nomor Virtual Account',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w900),
                          ),
                          Text(
                            '928764629201982736454',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2.0,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      child: Column(
                        children: [
                          const Text(
                            'Batas Pembayaran',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w900),
                          ),
                          Text(
                            transactionController.paymentDeadline.value,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                Color(Constant.mainColor),
              ),
            ),
            onPressed: () {
              Get.toNamed('/order_screen');
            },
            child: const Text(
              'Riwayat Pesanan',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
