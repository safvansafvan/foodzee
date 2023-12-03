import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodzee/controller/providers/phone_login_provider.dart';
import 'package:foodzee/view/auth/auth_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PhoneLoginProvider())
      ],
      child: MaterialApp(
        title: 'foodzee',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AuthView(),
      ),
    );
  }
}
