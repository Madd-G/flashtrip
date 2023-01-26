import 'package:flashtrip/models/province.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/controllers.dart';
import '../../../models/destination_model.dart';
import '../../../utils/constant.dart';
import '../../destination_detail_screen/views/destination_detail_screen.dart';
import '../widgets/alert_dialog.dart';

class TourListScreen extends StatelessWidget {
  const TourListScreen({Key? key, this.dest}) : super(key: key);

  final List<DestinationData?>? dest;

  @override
  Widget build(BuildContext context) {
    final Controllers c = Get.put<Controllers>(
      Controllers(),
    );
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Kategori',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17.0),
                ),
                GestureDetector(
                  onTap: () => c.showFullCategory(),
                  child: const Text(
                    'Lihat semua',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 17.0),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Obx(
              () => GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 2),
                  itemCount:
                      (c.isExpandCategory.value == true) ? provinces.length : 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return FeatureAlertDialog(
                                size: size,
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: size.width * 0.3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  provinces[index].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Center(
                              child: Stack(
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    provinces[index].name,
                                    style: TextStyle(
                                      fontSize: 12,
                                      letterSpacing: 5,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 5
                                        ..color = Colors.black,
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    provinces[index].name,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      letterSpacing: 5,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              'Rekomendasi',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700),
            ),
            Expanded(
                // height: 455,
                child: ListView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    // reverse: true,
                    itemCount: dest!.length,
                    itemBuilder: (context, index) {
                      var destination = dest!.toList()[index];
                      if (kDebugMode) {
                        print('dest: ${dest!.length}');
                        print('destination name: ${destination!.name}');
                      }
                      return GestureDetector(
                        onTap: () => Get.to(() => DestinationDetailScreen(
                            index: index, destinationData: destination)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 3.0),
                          child: SizedBox(
                            height: size.height * 0.22,
                            child: Card(
                              elevation: 3.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 150,
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        // recommendations[index].imageUrl,
                                        destination!.image!,
                                        fit: BoxFit.fill,
                                        width: 4000,
                                        height: double.infinity,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          color: Colors.blue.withOpacity(0.5),
                                          height: 55.0,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8.0, 2.0, 8.0, 2.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      // recommendations[index].name,
                                                      destination.name!,
                                                      style: const TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on,
                                                          color: Colors.red,
                                                        ),
                                                        // Text(recommendations[index].location)
                                                        Text(destination
                                                            .location!),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5.0,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.price_change_sharp,
                                                      color: Colors.yellow,
                                                    ),
                                                    const SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    Text(
                                                        // oCcy.format(recommendations[index].price).toString(),
                                                        Constant.oCcy
                                                            .format(destination
                                                                .price!)
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 13.0,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.red)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
