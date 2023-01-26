import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../providers/destination_hotel_provider.dart';
import '../../../providers/destination_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    openSplashScreen();
    Future.delayed(
      Duration.zero,
      () {
        final destinationProvider =
            Provider.of<DestinationProvider>(context, listen: false);
        final destinationHotelProvider =
            Provider.of<DestinationHotelProvider>(context, listen: false);
        destinationHotelProvider.getDestinationHotel();
        destinationProvider.getAllDestination();
      },
    );
    super.initState();
  }

  openSplashScreen() async {
    var durasiSplashScreen = const Duration(seconds: 1);
    return Timer(
      durasiSplashScreen,
      () {
        Get.toNamed('/bottom_nav_bar');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
            )
          ],
        ),
      ),
    );
  }
}
