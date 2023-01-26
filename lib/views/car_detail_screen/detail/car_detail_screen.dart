import 'package:flashtrip/utils/constant.dart';
import 'package:flashtrip/views/car_rental_screen/views/car_rental_screen.dart';
import 'package:flashtrip/views/order_detail_screen/views/order_detail_screen.dart';
import 'package:flutter/material.dart';
import '../../../models/car_model.dart';
import '../views/specification_section.dart';

class CarDetailScreen extends StatelessWidget {
  final List<Car>? data;
  final int? index;

  const CarDetailScreen({Key? key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF73C7FB),
        title: const Text('Sewa Mobil'),
        leading: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CarRentalScreen()),
                  (route) => false);
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.25,
              width: size.width,
              color: const Color(Constant.mainColor),
              child: Image.asset(
                data![index!].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data![index!].carName,
                    style: const TextStyle(
                        fontSize: Constant.fontExtraBig,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Spesifikasi',
                    style: TextStyle(
                        fontSize: Constant.fontBig,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SpecificationSection(size: size, data: data, index: index),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    'Lokasi',
                    style: TextStyle(
                        fontSize: Constant.fontBig,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Text(
                          data![index!].address,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.08,
                    decoration: const BoxDecoration(
                      color: Color(Constant.mainColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Jam Sewa',
                            style: TextStyle(
                                fontSize: Constant.fontRegular,
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Container(
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Icon(Icons.add),
                                    VerticalDivider(
                                      thickness: 2,
                                    ),
                                    Text('28'),
                                    VerticalDivider(
                                      thickness: 2,
                                    ),
                                    Icon(Icons.remove),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              const Text('JAM',
                                  style: TextStyle(
                                      fontSize: Constant.fontRegular,
                                      fontWeight: FontWeight.w700))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Constant.oCcy.format(data![index!].price),
                        style: const TextStyle(
                            fontSize: Constant.fontBig,
                            fontWeight: FontWeight.w900),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OrderDetailScreen()));
                        },
                        child: Container(
                          // width: 40,
                          // height: size.height * 0.04,
                          decoration: const BoxDecoration(
                            color: Color(Constant.mainColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            child: Center(
                                child: Text(
                              'Sewa Mobil Ini',
                              style: TextStyle(
                                  fontSize: Constant.fontSemiBig,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
