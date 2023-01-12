import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(actions: [
        IconButton(
          icon:  const Icon(Icons.logout),
          onPressed: () {
             Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => OnBoardingScreen(),)
            );

          },
        )
      ]),
      body: Center(
        child: Text('Home Page')),
    );
  }
}
