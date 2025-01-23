import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travit_web/Screens/join_trip.dart';
import 'package:travit_web/Screens/home_screen.dart' as home;
import 'dart:html' as html;

class myTripScreen extends StatefulWidget {
  const myTripScreen({super.key});

  @override
  State<myTripScreen> createState() => _myTripScreenState();
}

class _myTripScreenState extends State<myTripScreen> {
  late Future<DocumentSnapshot> _userDocument;
  final usermail = home.usermail;
  final username = home.username;
  @override
  void initState() {
    super.initState();
    _userDocument = _getUserDocument();
  }

  Future<DocumentSnapshot> _getUserDocument() async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(usermail)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Trips'),
        backgroundColor: Color.fromRGBO(28, 27, 32, 1),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          // height: 300,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                FutureBuilder<DocumentSnapshot>(
                  future: _userDocument,
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return Center(child: Text('No trips planned yet!!'));
                    }

                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.person, size: 100),
                          SizedBox(
                            height: 5,
                          ),
                          Text(username),
                          SizedBox(
                            height: 5,
                          ),
                          Text(usermail),
                          SizedBox(
                            height: 20.0,
                            width: 600.0,
                            child: Divider(
                              color: Colors.white38,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('NAME- $username'),
                                      SizedBox(height: 10),
                                      Text('FROM- ${data['from']}'),
                                      SizedBox(height: 10),
                                      Text('TO- ${data['destination']}'),
                                      SizedBox(height: 10),
                                      Text('DATE- ${data['date']}'),
                                      SizedBox(height: 10),
                                      Text("TIME- ${data['time']} hrs"
                                          .replaceAll('minified:bo(', '')
                                          .replaceAll('TimeOfDay(', '')
                                          .replaceAll(')', '')),
                                      SizedBox(height: 10),
                                      Text('AMOUNT- ${data['tot_amt']}'),
                                      SizedBox(height: 10),
                                      Text(
                                          'NUMBER OF PEOPLE- ${data['people']}'),
                                      SizedBox(height: 10),
                                      Text('VEHICLE- ${data['veh_ty']}'),
                                      SizedBox(height: 10),
                                      Text('PHONE NO- ${data['ph_no']}'),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(flex: 2, child: SizedBox(width: 10)),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: 40,
                                  child: IconButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('user')
                                          .doc(usermail)
                                          .delete();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor:
                                              Color.fromRGBO(20, 18, 24, 1),
                                          content: Container(
                                            padding: EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Trip deleted successfully!!",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.delete_outline_outlined,
                                        color: Colors.red, size: 30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
