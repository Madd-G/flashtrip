import 'package:flutter/material.dart';

import '../../../models/car_model.dart';
import '../../../utils/constant.dart';

class SpecificationSection extends StatelessWidget {
  const SpecificationSection({
    Key? key,
    required this.size,
    required this.data,
    required this.index,
  }) : super(key: key);

  final Size size;
  final List<Car>? data;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: size.height * 0.18,
          width: size.width * 0.28,
          decoration: const BoxDecoration(
            color: Color(Constant.mainColor),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/capacity.png',
                  scale: 1.5,
                ),
                Column(
                  children: [
                    const Text(
                      'Kapasitas',
                      style: TextStyle(
                          fontSize: Constant.fontSemiBig,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      data![index!].capacity.toString(),
                      style: const TextStyle(
                          fontSize: Constant.fontSemiBig,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      'Penumpang',
                      style: TextStyle(
                          fontSize: Constant.fontSemiBig,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: size.height * 0.18,
          width: size.width * 0.28,
          decoration: const BoxDecoration(
            color: Color(Constant.mainColor),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/speed.png',
                  scale: 1.5,
                ),
                Text(
                  '${data![index!].distancePerLiter} km/liter',
                  style: const TextStyle(
                      fontSize: Constant.fontSemiBig,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ),
        Container(
          height: size.height * 0.18,
          width: size.width * 0.28,
          decoration: const BoxDecoration(
            color: Color(Constant.mainColor),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/tag.png',
                  scale: 1.5,
                ),
                Column(
                  children: [
                    const Text(
                      'Harga/Jam',
                      style: TextStyle(
                          fontSize: Constant.fontSemiBig,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      Constant.oCcy.format(data![index!].price),
                      style: const TextStyle(
                          fontSize: Constant.fontSemiBig,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}