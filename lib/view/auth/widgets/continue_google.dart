import 'package:flutter/material.dart';
import 'package:foodzee/controller/const.dart';
import 'package:foodzee/view/widget/lottie_view.dart';

class ContinueWithGoogleWidget extends StatelessWidget {
  const ContinueWithGoogleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.grey.withAlpha(100),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          commonWidth,
          const LottieView(
              path: 'assets/animation/google.json', height: 80, width: 80),
          commonWidth,
          const Text(
            'Google',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          )
        ],
      ),
    );
  }
}
