import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otlob_task/provider/auth.dart';

import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _obsecure = true;

   void toggle() {
    setState(() {
      _obsecure = !_obsecure;
    });
  } // end toggle()

  void signIn() {
    String phoneNumber = _phoneController.text.trim() ;
    String password = _passwordController.text ;
    context.read(authProvider).login(phoneNumber , password).then((loginMessage) {
      print('value = $loginMessage');
      if(loginMessage == 'Invalid Account' ){
        Fluttertoast.showToast(msg: 'Check your account and try again' , toastLength: Toast.LENGTH_LONG);
      }
      if(loginMessage == 'Invalid Credintials' ){
        Fluttertoast.showToast(msg: 'Wrong password' , toastLength: Toast.LENGTH_LONG);
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>Home())
      );
    }).catchError(
      (e)=> Fluttertoast.showToast(msg: 'an error occurred ' , toastLength: Toast.LENGTH_LONG)
      );
  } // end signIn()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // container for image 
            Container(
              width: MediaQuery.of(context).size.width *0.3,
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .08
                ),
              child: Image(
                image: AssetImage('assets/splash_forground.png'),
              ),
            ),
            // container for TextFields (phone & password)
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Container(
                  margin: EdgeInsets.only(top: 20 , right: 15 , left: 15),
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 25 , 
                      fontFamily: 'Tajawal' ,
                      fontWeight: FontWeight.bold ,
                      color: Color(0xff46200B)
                      ),
                      textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(
                    right: 15 , left: 15 , top:40 , bottom: 20
                    ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]),
                   borderRadius: BorderRadius.circular(15),
                   color: Colors.grey[200]
                  ),

                  child: TextField(    
                    style: TextStyle(
                      fontSize: 20 , 
                      fontFamily: 'Tajawal' ,
                      color: Color(0xff46200B)
                    ),
                    autofocus: true,
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(                    
                        hintText: 'رقم الهاتف ',
                        border: InputBorder.none
                       // labelText: 'Phone',
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15
                    ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]),
                   borderRadius: BorderRadius.circular(15),
                   color: Colors.grey[200]
                  ),
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    
                    style: TextStyle(
                      fontSize: 20 , 
                      fontFamily: 'Tajawal' ,
                      color: Color(0xff46200B)
                    ),
                    controller: _passwordController,
                    obscureText: _obsecure,
                    decoration: InputDecoration(
                        hintText: 'كلمة المرور',
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(_obsecure
                              ? Icons.visibility_off
                              : Icons.visibility , color: Colors.brown[400]),
                          onPressed: () {
                            toggle();
                          },
                        )),
                  ),
                ),
                  ],
                ),
              ),
            ),
            // container for Login Button 
            GestureDetector(
              onTap: (){
               /*  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context)=> Home())
                  ); */
                  signIn() ;
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .3,
                height: MediaQuery.of(context).size.height * .06,
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height * .04),
                padding: EdgeInsets.all(MediaQuery.of(context).size.height * .015),
                decoration: BoxDecoration(
                  color: Color(0xffAEC632) ,
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Text('دخول' ,
                 style: TextStyle(
                   color: Colors.white ,
                   fontFamily: 'Tajawal' ,
                   fontSize: 22 ,
                ),
                textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}