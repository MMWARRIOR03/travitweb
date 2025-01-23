import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class decidee extends StatefulWidget {
  const decidee({super.key});

  @override
  State<decidee> createState() => _decideeState();
}

class _decideeState extends State<decidee> {
  final usermail = FirebaseAuth.instance.currentUser!.email;

  @override
  decide() {
    if (usermail!.contains('vitbhopal.ac.in')) {
      Navigator.popAndPushNamed(context, '/');
      print('User is logged in');
    } else {
      Navigator.popAndPushNamed(context, '/login_page');
      print('User is not logged in');
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
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text("Please login with your VIT email ID",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),
        )),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          if (usermail!.contains('@vitbhopal.ac.in')) {
            Navigator.popAndPushNamed(context, '/join_trip');
            print('User is logged in');
          } else {
            Navigator.popAndPushNamed(context, '/login_page');
            print('User is not logged in');
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
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text("Please login with your VIT email ID",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            );
          }
        },
        child: Text('Continue'),
      ),
    ));
  }
}
