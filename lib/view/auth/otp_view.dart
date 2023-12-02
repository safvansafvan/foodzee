import 'package:flutter/material.dart';
import 'package:foodzee/controller/const.dart';
import 'package:foodzee/view/auth/widgets/auth_heading.dart';
import 'package:foodzee/view/auth/widgets/otp_enter_widget.dart';
import 'package:foodzee/view/widget/lottie_view.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 30,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_rounded)),
                ),
              ),
            ),
            const LottieView(path: 'assets/animation/otp.json'),
            const AuthHeadingWidget(),
            const OtpEnterWidget(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: kgreen),
                  onPressed: () {},
                  child: Text(
                    'Verify Number',
                    style: TextStyle(color: kwhite),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
