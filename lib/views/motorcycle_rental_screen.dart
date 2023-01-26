import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/text_input_decoration.dart';
import '../models/motorcycle_model.dart';
import '../utils/constant.dart';

class MotorcycleRentalScreen extends StatelessWidget {
  const MotorcycleRentalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sewa Mobil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: textInputDecoration.copyWith(
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search)),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            const Text(
              'Kategori',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff63C4FF),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    height: 40.0,
                    width: 120.0,
                    child: const Center(
                      child: Text(
                        'Matic',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 17.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0))),
                    height: 40.0,
                    width: 120.0,
                    child: const Center(
                      child: Text(
                        'Non Matic',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 17.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            const Text(
              'Pribadi',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: motorcycles.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      // onTap: () => Get.to(() => DetailScreen(index: index)),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),

                        // height: 55.0,
                        // width: 30.0,
                        decoration: const BoxDecoration(
                            color: Color(0xffC0E6FD),
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 75.0,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Image.asset(
                                    motorcycles[index].imageUrl),
                              ),
                              SizedBox(height: size.height * 0.007),
                              Text(
                                motorcycles[index].carName,
                                style: const TextStyle(fontSize: 20.0),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '${Constant.oCcy.format(motorcycles[index].price).toString()}/orang',
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700)),
                                  Container(
                                    height: 20.0,
                                    width: 20.0,
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3.0))),
                                    child: const Center(
                                        child: Icon(
                                      Icons.add,
                                      color: Color(0xffC0E6FD),
                                      size: 20,
                                    )),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
