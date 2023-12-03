import 'package:flutter/material.dart';
import 'package:foodzee/controller/const.dart';
import 'package:foodzee/controller/providers/phone_login_provider.dart';
import 'package:foodzee/view/auth/widgets/auth_heading.dart';
import 'package:foodzee/view/auth/widgets/continue_google.dart';
import 'package:foodzee/view/auth/widgets/textfield.dart';
import 'package:foodzee/view/widget/lottie_view.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AuthView extends StatelessWidget {
  AuthView({super.key});

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final lp = Provider.of<PhoneLoginProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LottieView(path: 'assets/animation/lock.json'),
            const AuthHeadingWidget(),
            Form(
              key: globalKey,
              child: Column(
                children: [
                  TextFieldWidget(controller: lp.phoneNumberCtrl),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kgreen,
                    ),
                    onPressed: () async {
                      if (globalKey.currentState!.validate()) {
                        await lp.handleSendCodeButtonClick(context);
                      }
                    },
                    child: Text(
                      'Send Code',
                      style: TextStyle(color: kwhite),
                    ),
                  ),
                ],
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
