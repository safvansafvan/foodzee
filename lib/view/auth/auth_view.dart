import 'package:flutter/material.dart';
import 'package:foodzee/controller/const.dart';
import 'package:foodzee/view/auth/otp_view.dart';
import 'package:foodzee/view/auth/widgets/auth_heading.dart';
import 'package:foodzee/view/auth/widgets/continue_google.dart';
import 'package:foodzee/view/auth/widgets/textfield.dart';
import 'package:foodzee/view/widget/lottie_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LottieView(path: 'assets/animation/lock.json'),
            const AuthHeadingWidget(),
            const TextFieldWidget(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kgreen,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpView(),
                      ));
                },
                child: Text(
                  'Send Code',
                  style: TextStyle(color: kwhite),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(color: kgrey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Or Continue With',
                      style: TextStyle(color: kgrey),
                    ),
                  ),
                  Expanded(child: Divider(color: kgrey))
                ],
              ),
            ),
            const ContinueWithGoogleWidget()
          ],
        ),
      ),
    );
  }
}
