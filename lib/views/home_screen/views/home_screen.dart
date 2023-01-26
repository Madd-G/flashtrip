import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashtrip/models/province.dart';
import 'package:flashtrip/providers/destination_provider.dart';
import 'package:flashtrip/utils/state/finite_state.dart';
import 'package:flashtrip/views/car_rental_screen/views/car_rental_screen.dart';
import 'package:flashtrip/views/motorcycle_rental_screen.dart';
import 'package:flashtrip/views/tour_list_screen/views/tour_list_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../constants/text_input_decoration.dart';
import '../../../utils/constant.dart';
import '../../destination_detail_screen/views/destination_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/onboarding-2.png'),
                        fit: BoxFit.cover)),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                    child: Text(
                      'Hello ${user?.displayName},\nWelcome to FlashTrip',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              Container(
                height: 170,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffC7D5E5),
                      Color(0xff66C4FE),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Consumer<DestinationProvider>(
                                builder: (context, provider, _) {
                              return GestureDetector(
                                onTap: () => Get.to(() => TourListScreen(
                                    dest: provider.destinationModel!.data)),
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 3.0,
                                        offset: Offset(0.0, 3.0),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                      child: Image.asset(
                                          'assets/images/place-marker.png')),
                                ),
                              );
                            }),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text('Wisata'),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: const BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 3.0,
                                    offset: Offset(0.0, 3.0),
                                  ),
                                ],
                              ),
                              child: Center(
                                  child: Image.asset(
                                      'assets/images/tourist-hotel.png')),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text('Hotel + Wisata'),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CarRentalScreen()),
                                (route) => false);
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: const BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 3.0,
                                      offset: Offset(0.0, 3.0),
                                    ),
                                  ],
                                ),
                                child: Center(
                                    child:
                                        Image.asset('assets/images/car.png')),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text('Sewa Mobil'),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MotorcycleRentalScreen()),
                                (route) => false);
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: const BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 3.0,
                                      offset: Offset(0.0, 3.0),
                                    ),
                                  ],
                                ),
                                child: Center(
                                    child: Image.asset(
                                        'assets/images/scooter.png')),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text('Sewa Motor'),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                child: SizedBox(
                  height: 170.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: provinces.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 4.5, 0),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 300.0,
                                child: Image.asset(
                                  provinces[index].image,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
                                child: Text(
                                  provinces[index].name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                child: Consumer<DestinationProvider>(
                    builder: (context, provider, _) {
                  switch (provider.myState) {
                    case MyState.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case MyState.loaded:
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: provider.destinationModel!.data!.length,
                          itemBuilder: (context, index) {
                            var destination = provider.destinationModel!.data
                                ?.toList()[index];
                            return GestureDetector(
                              onTap: () => Get.to(() => DestinationDetailScreen(
                                  index: index, destinationData: destination)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 25,
                                  width: 30,
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        destination!.image!,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          color: Colors.blue.withOpacity(0.3),
                                          height: 50.0,
                                          width: 200.0,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // destinations[index].name!,
                                                destination.name!,
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                  Constant.oCcy
                                                      .format(destination.price)
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              const SizedBox(
                                                height: 5.0,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    case MyState.failed:
                      return const Text('Oops, something went wrong!');
                    default:
                      return const SizedBox();
                  }
                }),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 175.0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
                child: TextField(
                    keyboardType: TextInputType.number,
                    decoration:
                        textInputDecoration.copyWith(fillColor: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
