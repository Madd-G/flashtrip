import 'package:flashtrip/views/car_rental_screen/widgets/private_car_content.dart';
import 'package:flutter/material.dart';
import '../../../constants/text_input_decoration.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../widgets/family_car_content.dart';

class CarRentalScreen extends StatefulWidget {
  const CarRentalScreen({Key? key}) : super(key: key);

  @override
  State<CarRentalScreen> createState() => _CarRentalScreenState();
}

class _CarRentalScreenState extends State<CarRentalScreen> {
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
                  MaterialPageRoute(builder: (context) => BottomNavBar()),
                  (route) => false);
            },
            child: const Icon(Icons.arrow_back_ios)),
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
              height: size.height * 0.03,
            ),
            DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: SizedBox(
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const TabBar(
                      indicatorColor: Color(0xff396EB0),
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: 'Pribadi',
                        ),
                        Tab(text: 'Keluarga'),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.65,
                      child: const TabBarView(
                        children: [
                          PrivateCarContent(),
                          // Center(child: Text('Second')),
                          FamilyCarContent(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
