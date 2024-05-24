import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_flutter_app/common/Custom_outline_btn.dart';
import 'package:user_flutter_app/screens/list.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => UserListScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/images/3.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              'assets/images/3.png',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Center(
            child: CustomOutlineBtn(
              onTap: _navigateToHome,
              text: "Get Started",
              hieght: 60,
              width: 300,
              color: Color.fromARGB(255, 12, 3, 63),
              color2: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
