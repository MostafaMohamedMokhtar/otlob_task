import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otlob_task/Screens/splash_screen.dart';
import 'package:otlob_task/provider/auth.dart';

import 'Screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: ( context,  watch, child) { 
           final data = watch(authProvider);
           print('rebuild');
           print(data.isAuth.toString());
          /*  if(data.isAuth == true ){
            Future.delayed(Duration.zero , 
            (){
              
            }
            );
           } */
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Color(0xffffc501)),
          home: // Home()
          SplashPage(),
        );
        }),
    );
  }
} // end MyApp

