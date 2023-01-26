import 'package:flashtrip/controllers/transaction_controller.dart';
import 'package:flashtrip/utils/constant.dart';
import 'package:flashtrip/views/destination_detail_screen/widgets/order_dialog_box.dart';
import 'package:flashtrip/views/home_screen/views/home_screen.dart';
import 'package:flashtrip/views/maps_screen/views/maps_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../controllers/controllers.dart';
import '../../../models/destination_model.dart';
import '../../../providers/destination_provider.dart';

class DestinationDetailScreen extends StatelessWidget {
  const DestinationDetailScreen(
      {Key? key, required this.index, this.destinationData})
      : super(key: key);

  final int index;
  final DestinationData? destinationData;

  @override
  Widget build(BuildContext context) {
    final Controllers c = Get.put<Controllers>(Controllers());
    final TransactionController transactionController =
        Get.put<TransactionController>(TransactionController());
    transactionController.productName.value = destinationData!.name!;
    transactionController.openTime.value = destinationData!.timeOpen!;
    transactionController.price.value = destinationData!.price!;
    transactionController.category.value = destinationData!.category!;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Stack(
            children: [
              Image.network(
                destinationData!.image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 400,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 40, 0, 0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    )),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: double.infinity,
                height: 650,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 25),
                            height: 8.0,
                            width: 60.0,
                            color: const Color(0xffEAEAEA),
                          ),
                        ),
                        Text(
                          transactionController.productName.value,
                          style: const TextStyle(
                              fontSize: Constant.fontExtraBig,
                              fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${Constant.oCcy.format(transactionController.price.value).toString()}/orang',
                                style: const TextStyle(
                                    fontSize: Constant.fontSemiBig,
                                    color: Color(0xff8FD0F7),
                                    fontWeight: FontWeight.w700)),
                            ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Color(0xff8FD0F7))),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const OrderDialogBox());
                                },
                                child: const Text(
                                  'Pesan',
                                  style:
                                      TextStyle(fontSize: Constant.fontSemiBig),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MapsScreen()));
                              },
                              child: Image.asset(
                                'assets/images/map.png',
                                fit: BoxFit.cover,
                              ),
                            )),
                        const SizedBox(
                          height: 7.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              child: Text(destinationData!.address!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      fontSize: Constant.fontRegular)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.timer),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Jam Buka (Waktu Setempat)',
                                  style:
                                      TextStyle(fontSize: Constant.fontRegular),
                                ),
                                Text(
                                    '${destinationData!.dayOpen!}, ${destinationData!.timeOpen}',
                                    style: const TextStyle(
                                        fontSize: Constant.fontRegular)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                          'Tentang',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () => c.show(),
                            child: Text(
                              destinationData!.description!,
                              maxLines: (c.isMax.value == true)
                                  ? 5
                                  : DefaultTextStyle.of(context).hashCode,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                          'Gambar',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 150.0,
                          // color: Colors.blue,
                          child: Consumer<DestinationProvider>(
                              builder: (context, provider, _) {
                            var listData = Constant.splitString(
                                destinationData!.images!.replaceAll('[', ''));

                            return ListView.builder(
                                // itemCount: provider.destinationModel?.data?.length,
                                itemCount: listData.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index2) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () => showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: Image.network(
                                            listData[index2],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      child: Image.network(
                                        listData[index2],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                });
                          }),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Ulasan',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w900),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '(3 penilaian)',
                                  style: TextStyle(fontSize: 18.0),
                                )
                              ],
                            ),
                            const Text('Lihat Semua')
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            // border: Border.all(color: Colors.blue, width: 2.0),
                            color: Color(0xffF4EBEC),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 3.0,
                                offset: Offset(0.0, 3.0),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.all(5.0),
                          height: 150.0,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.star,
                                          size: 30.0,
                                          color: Color(0xffFFB722),
                                        ),
                                        Text(
                                          // '${destinations[index].rating}',
                                          '5.0',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xffD9DADD)),
                                        )
                                      ],
                                    ),
                                    const Text(
                                      '29 September 2022',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w100),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  'Rizky Billar',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  'Pemesanan tiket mudah dan cepat. Pantainya juga bersih dan bagus pol. Gak heran banyak turis dari negara sebelah yang berkunjung. ',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        )
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
