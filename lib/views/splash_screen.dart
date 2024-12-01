import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shreemad_bhagvat_geeta_app/views/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Timer(const Duration(seconds: 3), () {
      // Navigator.of(context).pushNamed('/');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
    return Scaffold(
      body: Container(
        height: h * 1,
        width: w * 1,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage('assets/images/logo.jpg'),
                fit: BoxFit.values.first),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(top: 600),
          child: const Text(
            'श्रीमद्भगवद्गीता',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}