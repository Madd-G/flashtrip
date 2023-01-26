import 'package:flashtrip/views/car_detail_screen/detail/car_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/car_model.dart';
import '../../../utils/constant.dart';

class PrivateCarContent extends StatelessWidget {
  const PrivateCarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GridView.builder(
        // shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailScreen(data: cars, index: index,)));
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffC0E6FD),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Image.asset(cars[index].imageUrl),
                        ),
                        SizedBox(height: size.height * 0.007),
                        Text(
                          cars[index].carName,
                          style: const TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${Constant.oCcy.format(cars[index].price).toString()}/orang',
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700)),
                            Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3.0))),
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
              ),
            ),
          );
        });
  }
}
