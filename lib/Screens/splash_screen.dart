import 'package:flutter/material.dart';
import 'package:otlob_task/Screens/home.dart';
import 'package:otlob_task/Screens/login_screen.dart';
import 'package:otlob_task/provider/auth.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      //useLoader: false,  
      loaderColor: Colors.brown,
      seconds: 5,
      navigateAfterSeconds: context.read(authProvider).isAuth
      ? Home()
      : LoginScreen(),
      imageBackground: AssetImage('assets/Splash_background.png'),
      image: Image(
        image: AssetImage('assets/splash_forground.png'),
      ),
      photoSize: 150,
    );
  }
}