import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashtrip/utils/constant.dart';
import 'package:flutter/material.dart';
import '../../../constants/text_input_decoration.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String email;
    Future resetPassword() async {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password Reset Email Sent'),
          duration: Duration(seconds: 2),
        ));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${e.message}'),
          duration: const Duration(seconds: 3),
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Receive an email to\nreset your password.',
                maxLines: 2,
                style: TextStyle(fontSize: Constant.fontBig),
              ),
              const SizedBox(
                height: 20.0,
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
                height: 20.0,
              ),
              GestureDetector(
                onTap: resetPassword,
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(Constant.mainColor),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.email,
                        size: 25.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Reset Password',
                        style: TextStyle(
                            fontSize: Constant.fontSemiBig,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
