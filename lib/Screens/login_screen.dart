import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travit_web/auth_service.dart';
import 'package:travit_web/Screens/logindecider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class loginPage extends StatefulWidget {
  loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome to TraVIT :)'),
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.grey,
      // ),
      backgroundColor: Color.fromRGBO(223, 223, 223, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(
                  'assets/images/Firefly -travit- travel app logo 87171.png'),
              width: 300,
              height: 300,
            ),
            SizedBox(height: 10),
            Text(
              'TraVIT',
              style:
                  TextStyle(color: Color.fromRGBO(98, 98, 98, 1), fontSize: 40),
            ),
            SizedBox(height: 20),
            Text(
              'You can sign in using your VIT Bhopal email only.',
              style:
                  TextStyle(color: Color.fromRGBO(97, 97, 97, 1), fontSize: 13),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // fixedSize: Size(300, 50),
                  backgroundColor: Color.fromRGBO(0, 40, 600, 1),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() async {
                    await AuthService().signInWithGoogle().then(
                      (value) async {
                        if (await AuthService()
                                .getUserEmail()
                                .contains('vitbhopal.ac.in') ==
                            true) {
                          Navigator.popAndPushNamed(context, '/');
                        } else {
                          GoogleSignIn().signOut();
                          Navigator.popAndPushNamed(context, '/login_page');
                          // print('User is not logged in');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Container(
                                padding: EdgeInsets.all(16),
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Oh Snap!!!",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Text("Please login with your VIT email ID",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  });
                },
                //.then((value) => Navigator.of(context).popAndPushNamed('/')),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.g_mobiledata_outlined),
                      SizedBox(width: 10),
                      Text('Sign in with Google')
                    ]),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'If you are still unable to login then try turning off your Brave browser "Shields" or any other adblocker that is active.',
              style:
                  TextStyle(color: Color.fromRGBO(97, 97, 97, 1), fontSize: 13),
            ),
            SizedBox(height: 60),
            // SafeArea(
            //   minimum: EdgeInsets.all(40),
            //   child: Text(
            //       'By clicking "Sign in with Google", you agree to our Terms of Service and Privacy Policy',
            //       style: TextStyle(
            //           color: Color.fromRGBO(97, 97, 97, 1), fontSize: 12)),
            // ),
          ],
        ),
      ),
    );
  }

  authController() async {
    var usermail = await AuthService().getUserEmail();
    var abcd = usermail!.contains('vitbhopal.ac.in');
    return abcd;
  }
}
