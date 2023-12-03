import 'package:flutter/material.dart';
import 'package:foodzee/controller/const.dart';
import 'package:foodzee/controller/providers/phone_login_provider.dart';
import 'package:foodzee/view/auth/widgets/auth_heading.dart';
import 'package:foodzee/view/widget/lottie_view.dart';
import 'package:foodzee/view/widget/toast_msg.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpView extends StatelessWidget {
  OtpView({super.key});
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: kgrey),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    final lp = Provider.of<PhoneLoginProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonHeight,
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
            commonHeight,
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              controller: lp.otpController,
              focusNode: focusNode,
              showCursor: true,
              separatorBuilder: (index) => commonWidth,
              length: 6,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: kgreen),
                  onPressed: () async {
                    focusNode.unfocus();
                    if (lp.otpController.length < 6) {
                      showMsgToast(msg: 'Enter valid otp');
                    } else {
                      await lp.handleOtpVerification(context);
                    }
                  },
                  child: Text(
                    'Verify Number',
                    style: TextStyle(color: kwhite),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
