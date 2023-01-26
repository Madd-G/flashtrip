import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/text_input_decoration.dart';
import '../../../controllers/controllers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String email;
    late String password;
    final Controllers c = Get.put<Controllers>(
      Controllers(),
    );
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/register_image.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 400,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 650,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffD9D9D9)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: textInputDecoration,
                      validator: (String? value) {
                        const String expression = "[a-zA-Z0-9+._%-+]{1,256}"
                            "\\@"
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
                            "("
                            "\\."
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
                            ")+";
                        final RegExp regExp = RegExp(expression);
                        return !regExp.hasMatch(value!)
                            ? "Silakan, masukkan email yang valid!"
                            : null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffD9D9D9)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Obx(
                      () => TextFormField(
                          onChanged: (value) {
                            password = value;
                          },
                          keyboardType: TextInputType.text,
                          obscureText: c.isHidden.value ? true : false,
                          decoration: textInputDecoration.copyWith(
                            suffixIconColor: const Color(0xffD9D9D9),
                            suffixIcon: GestureDetector(
                              onTap: () => c.toggleVisibility(),
                              child: Icon(c.isHidden.value == true
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Silakan isi kolom kata sandi!';
                            } else {
                              return null;
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Belum punya akun? ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffD9D9D9)),
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed('/register_screen'),
                              child: const Text(
                                'Daftar',
                                style: TextStyle(color: Color(0xff8FD0F7)),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed('/forgot_password_screen'),
                          child: const Text(
                            'Lupa kata sandi?',
                            style: TextStyle(color: Color(0xff8FD0F7)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: SizedBox(
                        width: 120,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Color(0xff8FD0F7))),
                            onPressed: () async {
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: email, password: password);
                                await Get.toNamed('/splash_screen');
                              } on FirebaseAuthException catch (e) {
                                if (kDebugMode) {
                                  print('e: $e.code');
                                }
                                if (e.code == 'user-not-found') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        'No user found for that email.'.tr),
                                    duration:
                                        const Duration(milliseconds: 1000),
                                  ));
                                } else if (e.code == 'wrong-password') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        'Wrong password provided for that user.'
                                            .tr),
                                    duration:
                                        const Duration(milliseconds: 1000),
                                  ));
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Fill out the entire form'.tr),
                                  duration: const Duration(milliseconds: 1000),
                                ));
                              }
                            },
                            child: const Text('Masuk')),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.black12,
                        ),
                        const Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black38,
                          ),
                        ),
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.black12,
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                      ],
                    ),
                    Container(
                      width: 500,
                      height: 60,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xffD9D9D9), width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/google-logo.png',
                            height: 25,
                            width: 25,
                          ),
                          const Center(
                              child: Text(
                            'Lanjutkan dengan Google',
                            style: TextStyle(fontSize: 20.0),
                          )),
                          const SizedBox(
                            width: 25,
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
