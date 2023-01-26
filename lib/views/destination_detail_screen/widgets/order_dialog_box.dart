import 'package:flashtrip/views/payment_methods_screen/views/payment_methods_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../../controllers/controllers.dart';
import '../../../controllers/transaction_controller.dart';
import '../../../models/destination_model.dart';

class OrderDialogBox extends StatefulWidget {
  final DestinationData? destinationData;

  const OrderDialogBox({super.key, this.destinationData});

  @override
  State<OrderDialogBox> createState() => _OrderDialogBoxState();
}

class _OrderDialogBoxState extends State<OrderDialogBox> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController dayNow = TextEditingController();
  TextEditingController paymentDeadline = TextEditingController();
  TextEditingController timeDeadline = TextEditingController();
  final Controllers c = Get.put<Controllers>(
    Controllers(),
  );
  final TransactionController transactionController =
      Get.put<TransactionController>(TransactionController());

  @override
  Widget build(BuildContext context) {
    transactionController.amount.value = c.amount.value;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.lightBlue,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                left: Constants.padding,
                top: 20,
                right: Constants.padding,
                bottom: Constants.padding),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color(0xff97D2F8),
                borderRadius: BorderRadius.circular(Constants.padding),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 10),
                      blurRadius: 10),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0))),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ))),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      size: 30.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      // width: 200,
                      child: TextField(
                        controller: dateInput,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xffEBE4E4),
                            hintText: 'dd/mm/yyyy',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)))),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat.yMMMMEEEEd().format(pickedDate);
                            // String date = '${DateFormat.yMMMMEEEEd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}';
                            // String countdown = DateFormat.jms().format(DateTime.now());
                            String deadline =
                                '${DateFormat.yMMMMEEEEd().format(DateTime.now().add(const Duration(days: 1)))} ${DateFormat.jm().format(DateTime.now())}';
                            setState(() {
                              dateInput.text = formattedDate;
                              transactionController.bookingDate.value =
                                  formattedDate;
                              // dayNow.text = date;
                              transactionController.paymentDeadline.value =
                                  deadline;
                            });
                          } else {}
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 30.0,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffEBE4E4),
                              border: Border.all(color: Colors.black38),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          height: 55,
                          width: 70,
                          child: Obx(
                            () => Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  c.amount.toString(),
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                        onTap: () => c.add(),
                                        child: const Icon(
                                            Icons.keyboard_arrow_up)),
                                    GestureDetector(
                                        onTap: () => c.subtract(),
                                        child: const Icon(
                                            Icons.keyboard_arrow_down)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                            side: MaterialStatePropertyAll(
                                BorderSide(color: Colors.white, width: 2)),
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color(0xff01B96C))),
                        onPressed: () =>
                            Get.to(() => const PaymentMethodsScreen()),
                        child: const Text(
                          'Lanjut',
                          style: TextStyle(fontSize: 18),
                        )),
                  ],
                ),
                // const SizedBox(
                //   height: 22,
                // ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: ElevatedButton(
                //       style: const ButtonStyle(
                //           backgroundColor: MaterialStatePropertyAll<Color>(
                //               Color(0xff8FD0F7))),
                //       onPressed:
                //         () => Get.toNamed('/payment_method_screen'),
                //       child: const Text(
                //         'Lanjut',
                //         style: TextStyle(fontSize: 18),
                //       )),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Constants {
  Constants._();

  static const double padding = 20;
  static const double avatarRadius = 45;
}
