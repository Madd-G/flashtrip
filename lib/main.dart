import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flashtrip/providers/destination_hotel_provider.dart';
import 'package:flashtrip/providers/destination_provider.dart';
import 'package:flashtrip/views/car_detail_screen/detail/car_detail_screen.dart';
import 'package:flashtrip/views/car_rental_screen/views/car_rental_screen.dart';
import 'package:flashtrip/views/destination_detail_screen/views/destination_detail_screen.dart';
import 'package:flashtrip/views/forgot_password_screen/views/forgot_password_screen.dart';
import 'package:flashtrip/views/maps_screen/views/maps_screen.dart';
import 'package:flashtrip/views/motorcycle_rental_screen.dart';
import 'package:flashtrip/views/onboarding/views/onBoarding_1.dart';
import 'package:flashtrip/views/onboarding/views/onBoarding_2.dart';
import 'package:flashtrip/views/onboarding/views/onboarding_3.dart';
import 'package:flashtrip/views/order_history_screen/views/order_history_screen.dart';
import 'package:flashtrip/views/payment_methods_screen/views/payment_methods_screen.dart';
import 'package:flashtrip/views/payment_screen/views/payment_screen.dart';
import 'package:flashtrip/views/splash_screen/views/splash_screen.dart';
import 'package:flashtrip/views/tour_list_screen/views/tour_list_screen.dart';
import 'package:flashtrip/views/verify_email_screen/views/verify_email_screen.dart';
import 'package:flashtrip/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flashtrip/views/home_screen/views/home_screen.dart';
import 'package:flashtrip/views/login_screen/views/login_screen.dart';
import 'package:flashtrip/views/profile_screen/views/profile_screen.dart';
import 'package:flashtrip/views/register_screen/views/register_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DestinationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DestinationHotelProvider(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          primaryColor: Colors.grey[800],
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // initialRoute: '/login_screen',
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return const SplashScreen();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else {
              return const LoginScreen();
            }
          },
        ),
        getPages: [
          GetPage(
            name: '/bottom_nav_bar',
            page: () => BottomNavBar(),
          ),
          GetPage(
            name: '/',
            page: () => const HomeScreen(),
          ),
          GetPage(
            name: '/onBoarding-1',
            page: () => const OnBoarding1(),
          ),
          GetPage(
            name: '/onBoarding-2',
            page: () => const OnBoarding2(),
          ),
          GetPage(
            name: '/onBoarding-3',
            page: () => const OnBoarding3(),
          ),
          GetPage(
            name: '/register_screen',
            page: () => const RegisterScreen(),
          ),
          GetPage(
            name: '/login_screen',
            page: () => const LoginScreen(),
          ),
          GetPage(
            name: '/forgot_password_screen',
            page: () => const ForgotPasswordScreen(),
          ),
          GetPage(
            name: '/verify_email_screen',
            page: () => const VerifyEmailScreen(),
          ),
          GetPage(
            name: '/splash_screen',
            page: () => const SplashScreen(),
          ),
          GetPage(
            name: '/profile_screen',
            page: () => const ProfileScreen(),
          ),
          GetPage(
            name: '/detail_screen',
            page: () => const DestinationDetailScreen(
              index: 0,
            ),
          ),
          GetPage(
            name: '/maps_screen',
            page: () => const MapsScreen(),
          ),
          GetPage(
            name: '/order_screen',
            page: () => const OrderHistoryScreen(),
          ),
          GetPage(
            name: '/payment_method_screen',
            page: () => const PaymentMethodsScreen(),
          ),
          GetPage(
            name: '/payment_screen',
            page: () => const PaymentScreen(),
          ),
          GetPage(
            name: '/tour_list_screen',
            page: () => const TourListScreen(),
          ),
          GetPage(
            name: '/car_rental_screen',
            page: () => const CarRentalScreen(),
          ),
          GetPage(
            name: '/car_detail_screen',
            page: () => const CarDetailScreen(),
          ),
          GetPage(
            name: '/motorcycle_rental_screen',
            page: () => const MotorcycleRentalScreen(),
          ),
        ],
      ),
    );
  }
}
