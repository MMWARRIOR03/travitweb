import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class devScreen extends StatefulWidget {
  const devScreen({super.key});

  @override
  State<devScreen> createState() => _devScreenState();
}

class _devScreenState extends State<devScreen> {
  final Uri github = Uri.parse('https://github.com/MMWARRIOR03');

  final Uri linkedin =
      Uri.parse('https://www.linkedin.com/in/mrinal-mohit-647778289/');
  final Uri instagram = Uri.parse(
      'https://www.instagram.com/mrinalmohit7?igsh=MW80bHZycGFwM2Q2ag==');
  Future<void>? _launched;
  Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 160,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.png'),
                      radius: 50,
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 7),
                          Text(
                            'Mrinal Mohit',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '19 | Dhanbad, Jharkhand',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () => setState(() {
                                        _launched =
                                            _launchInBrowserView(github);
                                      }),
                                  icon: Image.asset(
                                    'assets/images/github.png',
                                    width: 30,
                                    height: 30,
                                  )),
                              SizedBox(width: 40),
                              IconButton(
                                  onPressed: () => setState(() {
                                        _launched =
                                            _launchInBrowserView(linkedin);
                                      }),
                                  icon: Image.asset(
                                    'assets/images/linkedin.png',
                                    width: 30,
                                    height: 30,
                                  )),
                              SizedBox(width: 40),
                              IconButton(
                                  onPressed: () => setState(() {
                                        _launched =
                                            _launchInBrowserView(instagram);
                                      }),
                                  icon: Image.asset(
                                    'assets/images/instagram.png',
                                    width: 30,
                                    height: 30,
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ])
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
