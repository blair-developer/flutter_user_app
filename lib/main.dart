import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_flutter_app/provider/user_provider.dart';
import 'package:user_flutter_app/screens/list.dart';
import 'package:user_flutter_app/screens/onBoardingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'User Management App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: OnboardingScreen(),
      ),
    );
  }
}
