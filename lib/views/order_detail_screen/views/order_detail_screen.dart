import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashtrip/controllers/transaction_controller.dart';
import 'package:flashtrip/utils/constant.dart';
import 'package:flashtrip/views/payment_screen/views/payment_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../constants/text_input_decoration.dart';
import 'package:get/get.dart';

final _firestore = FirebaseFirestore.instance;
User? user = FirebaseAuth.instance.currentUser;

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  bool useData = true;

  @override
  Widget build(BuildContext context) {
    final TransactionController transactionController =
        Get.put<TransactionController>(TransactionController());
    final username = TextEditingController();
    final TextEditingController ktp = TextEditingController();
    final phoneNumber = TextEditingController();

    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    final Random rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

    if (kDebugMode) {
      print("payment Method: ${transactionController.paymentMethod.value}");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF73C7FB),
        title: const Text('Pemesanan'),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 2.5),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Tipe pesanan',
                          style: TextStyle(fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          'Pesanan',
                          style: TextStyle(fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          'Harga',
                          style: TextStyle(fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          'Tanggal',
                          style: TextStyle(fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          'Biaya Admin',
                          style: TextStyle(fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          'Kuantitas',
                          style: TextStyle(fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          'Total Harga',
                          style: TextStyle(fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          'Metode Pembayaran',
                          style: TextStyle(fontSize: Constant.fontSemiRegular),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // ': ${widget.destinationData!.category}',
                          ': ${transactionController.category}',
                          style: const TextStyle(
                              fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          // ': ${widget.destinationData!.name}',
                          ': ${transactionController.productName}',
                          style: const TextStyle(
                              fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          // ': ${Constant.oCcy.format(widget.destinationData!.price)}',
                          ': ${Constant.oCcy.format(transactionController.price.value)}',
                          style: const TextStyle(
                              fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          // ': ${widget.date}',
                          ': ${transactionController.bookingDate}',
                          overflow: TextOverflow.fade,
                          style:
                              const TextStyle(fontSize: Constant.fontRegular),
                        ),
                        Text(
                          ': ${Constant.oCcy.format(2500)}',
                          style: const TextStyle(
                              fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          // ': ${widget.amount}',
                          ': ${transactionController.amount}',
                          style: const TextStyle(
                              fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          // ': ${Constant.oCcy.format(widget.destinationData!.price! * widget.amount! + 2500)}',
                          ': ${Constant.oCcy.format(transactionController.price.value * transactionController.amount.value + 2500)}',
                          style: const TextStyle(
                              fontSize: Constant.fontSemiRegular),
                        ),
                        Text(
                          ': ${transactionController.paymentMethod}',
                          style: const TextStyle(
                              fontSize: Constant.fontSemiRegular),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                'Detail Pembeli',
                style: TextStyle(
                    fontSize: Constant.fontBig, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 2.5),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nama Lengkap',
                      style: TextStyle(
                          fontSize: Constant.fontSemiBig,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffD9D9D9)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      // readOnly: true,
                      controller: username,
                      keyboardType: TextInputType.text,
                      decoration: textInputDecoration,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'NIK',
                      style: TextStyle(
                          fontSize: Constant.fontSemiBig,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffD9D9D9)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: ktp,
                      keyboardType: TextInputType.text,
                      decoration: textInputDecoration,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Nomor Telepon',
                      style: TextStyle(
                          fontSize: Constant.fontSemiBig,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffD9D9D9)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: phoneNumber,
                      keyboardType: TextInputType.number,
                      decoration: textInputDecoration,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        // https://stackoverflow.com/questions/61370071/checkbox-value-i-want-to-add-if-user-check-the-checkbox-then-it-should-add-amo
                        Checkbox(
                          activeColor: Colors.black,
                          value: useData,
                          onChanged: (value) {
                            setState(() {
                              useData = value!;
                            });
                          },
                        ),
                        const Text(
                          'Gunakan data yang sudah ada',
                          style: TextStyle(
                            fontSize: Constant.fontSemiBig,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              GestureDetector(
                onTap: () {
                  _firestore.collection('transactions').add({
                    'uid': user!.uid,
                    'username': user!.displayName,
                    'email': user!.email,
                    'phone': '081234567890',
                    'KTP': '3329384710067583',
                    'product-name': transactionController.productName.value,
                    'category': transactionController.category.value,
                    'price': transactionController.price.value,
                    'amount': transactionController.amount.value,
                    // 'total-price': transactionController.totalPrice.value,
                    'payment-method': transactionController.paymentMethod.value,
                    'booking-date': transactionController.bookingDate.value,
                    'payment-deadline':
                        transactionController.paymentDeadline.value,
                    'booking-code': getRandomString(12),
                    'status': 'success',
                    'time-open': transactionController.openTime.value,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                  Get.to(() => const PaymentScreen());
                },
                child: Container(
                  height: 55.0,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(Constant.mainColor),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: const Center(
                      child: Text(
                    'Lanjutkan Pembayaran',
                    style: TextStyle(
                        fontSize: Constant.fontBig,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
