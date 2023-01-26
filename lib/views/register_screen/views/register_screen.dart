import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashtrip/controllers/language_controller.dart';
import 'package:flashtrip/controllers/user_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/text_input_decoration.dart';
import '../../../controllers/controllers.dart';

final _firestore = FirebaseFirestore.instance;
User? user = FirebaseAuth.instance.currentUser;

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    // late String username;
    // late String email;
    late String password;
    final Controllers c = Get.put<Controllers>(
      Controllers(),
    );
    final UserController userController = Get.put<UserController>(
      UserController(),
    );
    final LanguageController languageController = Get.put<LanguageController>(
      LanguageController(),
    );
    final languages = ['English', 'Indonesia'];
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
                        'Nama Pengguna',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffD9D9D9)),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: textInputDecoration,
                          onChanged: (value) {
                            // username = value;
                            userController.username.value = value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Silakan isi kolom nama pengguna!';
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        'Asal',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffD9D9D9)),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: textInputDecoration,
                          onChanged: (value) {
                            // username = value;
                            userController.origin.value = value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Silakan isi kolom asal!';
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        'KTP',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffD9D9D9)),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: textInputDecoration,
                          onChanged: (value) {
                            // username = value;
                            userController.ktp.value = value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Silakan isi kolom KTP!';
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        'Nomor Handphone',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffD9D9D9)),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: textInputDecoration,
                          onChanged: (value) {
                            // username = value;
                            userController.phoneNumber.value = value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Silakan isi kolom nomor handphone!';
                            } else {
                              return null;
                            }
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      DropdownSearch<String>(
                        mode: Mode.MENU,
                        showSelectedItem: true,
                        items: languages,
                        label: "Language",
                        searchBoxStyle: const TextStyle(
                            fontSize: 40, color: Colors.red, height: 40.0),
                        searchBoxDecoration: const InputDecoration(
                          labelStyle: TextStyle(fontSize: 8),
                          isDense: true,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.all(20),
                        ),
                        hint: "select language",
                        selectedItem: "${userController.language}",
                        // selectedItem: "English",
                        onChanged: (value) {
                          if (value == 'English') {
                            languageController.changeLanguage('en_US', 'id');
                            userController.language.value = 'English';
                          } else if (value == "Indonesia") {
                            languageController.changeLanguage('id', 'en_US');
                            userController.language.value = 'Indonesia';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: textInputDecoration,
                        onChanged: (value) {
                          // email = value;
                          userController.email.value = value;
                        },
                        validator: (value) {
                          const String expression = "[a-zA-Z0-9+._%-+]{1,256}"
                              "\\@"
                              "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
                              "("
                              "\\."
                              "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
                              ")+";
                          final RegExp regExp = RegExp(expression);
                          if (!regExp.hasMatch(value!)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please enter valid email'.tr),
                              duration: const Duration(milliseconds: 1000),
                            ));
                            return 'please enter valid email';
                          }
                          return null;
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
                          keyboardType: TextInputType.text,
                          obscureText: c.isHidden.value ? true : false,
                          onChanged: (value) {
                            password = value;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: textInputDecoration.copyWith(
                            suffixIconColor: const Color(0xffD9D9D9),
                            suffixIcon: GestureDetector(
                              onTap: () => c.toggleVisibility(),
                              child: Icon(c.isHidden.value == true
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                          validator: (value) =>
                              value!.isEmpty && value.length < 6
                                  ? 'Enter min 6 characters'
                                  : null,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Sudah memiliki akun? ',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xffD9D9D9)),
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed('/login_screen'),
                            child: const Text(
                              'Login',
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
                              // onPressed: () {
                              //   Navigator.pushAndRemoveUntil(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => BottomNavBar()),
                              //       (route) => false);
                              //   // Get.toNamed('/login_screen');
                              // },
                              onPressed: () async {
                                try {
                                  final newUser =
                                      await auth.createUserWithEmailAndPassword(
                                          // email: email, password: password);
                                          email: userController.email.value,
                                          password: password);
                                  await newUser.user
                                      // ?.updateDisplayName(username);
                                      ?.updateDisplayName(
                                          userController.username.value);

                                  _firestore.collection('user').add({
                                    'uid': user!.uid,
                                    'username': user!.displayName,
                                    'email': user!.email,
                                    'origin': userController.origin.value,
                                    'phone-number':
                                        userController.phoneNumber.value,
                                    'ktp': userController.ktp.value,
                                    'language': userController.language.value,
                                  });
                                  Get.toNamed('/verify_email_screen');
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'email-already-in-use') {
                                    if (kDebugMode) {
                                      print('========= already use =========');
                                    }
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          'The email address is already in use by another account.'),
                                      duration: Duration(milliseconds: 1000),
                                    ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content:
                                          Text('Fill out the entire form'.tr),
                                      duration:
                                          const Duration(milliseconds: 1000),
                                    ));
                                    if (kDebugMode) {
                                      print(e);
                                    }
                                  }
                                }
                              },
                              child: const Text('Daftar')),
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
                )),
          )
        ],
      ),
    );
  }
}
