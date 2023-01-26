import 'package:flutter/material.dart';
import '../../../utils/constant.dart';

class FeatureAlertDialog extends StatelessWidget {
  const FeatureAlertDialog({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 290.0,
        child: AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: size.height * 0.08,
                  child: const Icon(Icons.notifications, size: 70.0,color: Color(Constant.mainColor),)),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Text(
                'Fitur ini akan segera hadir!!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Constant.fontSemiBig),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                width: size.width,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: const ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(Constant.mainColor))),
                  child: const Text(
                    'TUTUP',
                    style: TextStyle(fontSize: Constant.fontSemiBig),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
