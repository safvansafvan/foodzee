import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodzee/controller/const.dart';
import 'package:foodzee/controller/providers/phone_login_provider.dart';
import 'package:foodzee/view/auth/widgets/auth_heading.dart';
import 'package:foodzee/view/auth/widgets/textfield.dart';
import 'package:foodzee/view/home/home.dart';
import 'package:foodzee/view/widget/lottie_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_button/sign_in_button.dart';

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
            SignInButton(
              elevation: 15,
              Buttons.googleDark,
              onPressed: () async {
                SharedPreferences storage =
                    await SharedPreferences.getInstance();
                // ignore: use_build_context_synchronously
                User? user = await lp.signInWithGoogle(context: context);
                if (user != null) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ));
                  log(user.displayName ?? '');
                  log(user.photoURL ?? '');
                  storage.setString('name', user.displayName ?? '');
                  storage.setString('url', user.photoURL ?? '');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
