import 'package:flutter/material.dart';
import 'package:foodzee/controller/const.dart';
import 'package:foodzee/controller/providers/phone_login_provider.dart';
import 'package:foodzee/view/auth/auth_view.dart';
import 'package:provider/provider.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                color: kgreen,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Column(
              children: [
                commonHeight,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon:
                            Icon(Icons.arrow_back_ios_rounded, color: kwhite)),
                  ),
                ),
                const CircleAvatar(radius: 50),
                commonHeight,
                Text(
                  'Muhammed',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600, color: kwhite),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Provider.of<PhoneLoginProvider>(context, listen: false)
                  .logout(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AuthView()),
                  (route) => false);
            },
            leading: Icon(Icons.logout, color: kgrey, size: 25),
            title: Text(
              'Log out',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600, color: kgrey),
            ),
          )
        ],
      ),
    );
  }
}
