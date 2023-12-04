import 'package:flutter/material.dart';
import 'package:foodzee/controller/const.dart';
import 'package:foodzee/controller/providers/phone_login_provider.dart';
import 'package:foodzee/view/auth/auth_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  String? name;
  String? url;
  @override
  void initState() {
    super.initState();
    userDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      child: Column(
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
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: CircleAvatar(
                      radius: 50, backgroundImage: NetworkImage(url!)),
                ),
                commonHeight,
                Text(
                  name ?? 'Unknown',
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

  Future<void> userDatas() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    name = storage.getString('name');
    url = storage.getString('url');
  }
}
