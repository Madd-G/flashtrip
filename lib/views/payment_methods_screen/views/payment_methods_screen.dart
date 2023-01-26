import 'package:flashtrip/views/order_detail_screen/views/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/transaction_controller.dart';
import '../../../models/payment_methods_model.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(12.0, 20.0, 0, 8),
            child: Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
            ),
          ),
          const Divider(
            thickness: 3.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                height: 855,
                color: Colors.white,
                child: Card(
                  elevation: 15.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Toko Retail',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 17.0),
                        ),
                      ),
                      const Divider(
                        thickness: 2.0,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: retailStores.length,
                          itemBuilder: (context, index) => Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        transactionController.image.value =
                                            bankTransfer[index].image;
                                        transactionController.paymentMethod
                                            .value = bankTransfer[index].name;
                                        Get.to(() => const OrderDetailScreen());
                                      },
                                      child: SizedBox(
                                        height: 40.0,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              retailStores[index].image,
                                              height: 80.0,
                                              width: 90.0,
                                              fit: BoxFit.fill,
                                            ),
                                            const SizedBox(
                                              width: 20.0,
                                            ),
                                            Text(
                                              retailStores[index].name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 2.0,
                                  ),
                                ],
                              )),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Transfer Bank',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 17.0),
                        ),
                      ),
                      const Divider(
                        thickness: 2.0,
                      ),
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: bankTransfer.length,
                            itemBuilder: (context, index) => Column(
                                  children: [
                                    // Text(time!),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          transactionController.image.value =
                                              bankTransfer[index].image;
                                          transactionController.paymentMethod
                                              .value = bankTransfer[index].name;
                                          Get.to(
                                              () => const OrderDetailScreen());
                                        },
                                        child: SizedBox(
                                          height: 40.0,
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                bankTransfer[index].image,
                                                height: 80.0,
                                                width: 90.0,
                                                fit: BoxFit.fill,
                                              ),
                                              const SizedBox(
                                                width: 20.0,
                                              ),
                                              Text(
                                                bankTransfer[index].name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 17.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 2.0,
                                    ),
                                  ],
                                )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
