import 'package:flutter/material.dart';
import 'package:foodzee/controller/const.dart';

class AuthHeadingWidget extends StatelessWidget {
  const AuthHeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Phone Verification',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        commonHeight,
        const Text(
          'We need register your phone before getting started !',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
