import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashtrip/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _firestore = FirebaseFirestore.instance;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('user');
    User? user = FirebaseAuth.instance.currentUser!;
    var documentId = '3DYT7wppWXahEo9HHcAe';
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          // border: Border.all(color: Colors.black38, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black38, //Color of the shadow
              spreadRadius: 3,
              blurRadius: 8,
              offset: Offset(0, 3), //Offset of the shadow
            ),
          ],
          gradient: LinearGradient(
              colors: [
                Color(0xff91CFF7),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
            child: SafeArea(
              child: FutureBuilder<DocumentSnapshot>(
                  future: users.doc(documentId).get(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.blueAccent,
                        ),
                      );
                    }
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    print('*************************************');
                    print(data);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Profile',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30.0,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              maxRadius: 38.0,
                              child: Image.asset('assets/images/jennie.png'),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // '${user.displayName}',
                                  '${data['username']}',
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '${data['origin']}',
                                  style: const TextStyle(fontSize: 17.0),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0))),
                                height: 40.0,
                                width: 120.0,
                                child: const Center(
                                  child: Text(
                                    'Aktifitas',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17.0),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                height: 40.0,
                                width: 120.0,
                                child: const Center(
                                  child: Text(
                                    'Akun',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'Akun',
                          style: TextStyle(
                              fontSize: 27.0, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 20, 8, 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Nama Lengkap',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      '${data['username']}',
                                      style: const TextStyle(fontSize: 20.0),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 3.5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 20, 8, 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Email',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      '${data['email']}',
                                      style: const TextStyle(fontSize: 20.0),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 3.5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 20, 8, 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'No. HP',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      '${data['phone-number']}',
                                      style: const TextStyle(fontSize: 20.0),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 3.5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 20, 8, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 30.0,
                                      width: 70.0,
                                      child: Image.asset(
                                        'assets/images/indonesia-flag.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      '${data['language']}',
                                      style: const TextStyle(fontSize: 20.0),
                                    )
                                  ],
                                ),
                              ),
                              // const Divider(
                              //   thickness: 4.5,
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: GestureDetector(
                            // onTap: () => Get.toNamed('login_screen'),
                            onTap: () => FirebaseAuth.instance.signOut().then(
                                  (value) => Get.toNamed('/login_screen'),
                                ),
                            child: Container(
                              width: 120.0,
                              height: 45.0,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: const Center(
                                child: Text(
                                  'Log Out',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        )
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
