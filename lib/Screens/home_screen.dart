import 'package:flutter/material.dart';
import 'package:travit_web/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final username = AuthService().getUserName();
final usermail = AuthService().getUserEmail();
final userimage = AuthService().getProfileImage();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to TraVIT :)',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(0, 40, 600, 1),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(0, 40, 600, 1),
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 40, 600, 1),
            ),
            accountName: Text(username),
            accountEmail: Text(usermail),
            currentAccountPicture: CircleAvatar(
              foregroundImage: userimage,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.white),
            title: Text(
              'My Trip',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, '/mytrip');
              print(userimage);
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.blue),
            title: Text(
              'About',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, '/about');
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.android_outlined, color: Colors.green),
          //   title: Text(
          //     'Developer',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () {
          //     Navigator.popAndPushNamed(context, '/dev');
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.share, color: Colors.blue),
          //   title: Text(
          //     'Share',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () {},
          // ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.green),
            title: Text(
              'Contact us',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              _sendEmail();
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              GoogleSignIn().signOut();
              Navigator.popAndPushNamed(context, '/login_page');
            },
          ),
        ]),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/homescreen.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0, 40, 600, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Create new trip'),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/new_trip');
                },
              ),
              SizedBox(height: 100),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0, 40, 600, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('    Join a trip    '),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/join_trip');
                },
              ),
            ],
          ),
        )),
      ),
    );
  }

  void _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'travit491@gmail.com',
      queryParameters: {
        'subject': '<WRITE ISSUE IN BRIEF (UI/BUG ETC.)>',
        'body': '<WRITE ISSUE IN DETAIL>'
      },
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}
