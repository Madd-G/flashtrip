import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/onboarding_dot.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/onboarding-1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  SizedBox(
                    height: 130,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                    child: Text(
                      'Melangkah\nLebih Jauh\nDan Rasakan\nPengalaman\nyang lebih Seru',
                      style: TextStyle(
                          fontSize: 37.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),

              // const SizedBox(
              //   height: 350,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        OnBoardingDot(
                          color: Color(0xff76C7FA),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        OnBoardingDot(color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        OnBoardingDot(color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  OnboardingButton(
                    onTap: () => Get.toNamed(
                      '/onBoarding-2',
                    ),
                    text: 'Lanjutkan',
                  ),
                  const SizedBox(
                    height: 150.0,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

}
