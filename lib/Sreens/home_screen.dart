import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {
          Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => OnBoarding(),));
        }, icon: Icon(Icons.logout_rounded))
      ]),
      body: Center(
        child: Text('HomePage'),
      ),
    );
  }
}
