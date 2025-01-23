import 'package:flutter/material.dart';

class aboutScreen extends StatelessWidget {
  const aboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0,
            ),
            Center(
              child: Image(
                image: AssetImage(
                    'assets/images/Firefly -travit- travel app logo 87171.png'),
                height: 300,
                width: 300,
              ),
            ),
            Text(
              'TraVIT',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(100, 0, 100, 20),
                child: Text(
                  'TraVIT is a travel app that helps you to find people form VIT Bhopal who are travelling to the same destination as you. You can join them and travel together and save cost.',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                )),
            Text(
              'App was made in haste for publishing before college reopens. So, the UI is not that good and the app can have some bugs. Please report them to the developer.',
              style: TextStyle(fontSize: 14),
            ),
            // Text(
            //   'Developed by M',
            //   style: TextStyle(fontSize: 14),
            // ),
          ],
        ),
      ),
    );
  }
}
