import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashtrip/utils/constant.dart';
import 'package:flashtrip/views/splash_screen/views/splash_screen.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        duration: const Duration(seconds: 7),
      ));
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const SplashScreen()
      : Scaffold(
          appBar: AppBar(
            title: const Text('Verify Email'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'A verification email has been sent to your email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: Constant.fontRegular),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton.icon(
                      onPressed: canResendEmail ? sendVerificationEmail : null,
                      icon: const Icon(
                        Icons.email,
                        size: 32,
                      ),
                      label: const Text(
                        'Resend Email',
                        style: TextStyle(fontSize: Constant.fontRegular),
                      )),
                  const SizedBox(height: 20.0),
                  TextButton(
                      onPressed: () => FirebaseAuth.instance.signOut(),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: Constant.fontRegular),
                      ))
                ],
              ),
            ),
          ),
        );
}
