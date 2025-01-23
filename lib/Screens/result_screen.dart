import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travit_web/Screens/join_trip.dart';
import 'package:travit_web/Screens/home_screen.dart' as home;

class resultScreen extends StatefulWidget {
  resultScreen({super.key});

  @override
  State<resultScreen> createState() => _resultScreenState();
}

final username = home.username;

class _resultScreenState extends State<resultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
        backgroundColor: Color.fromRGBO(36, 55, 90, 1),
        centerTitle: true,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/newtrip.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user')
                .where('destination', isEqualTo: destination())
                .where('from', isEqualTo: from())
                .where('date', isEqualTo: date())
                .orderBy('time')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        title: Text(
                            "Time -> ${snapshot.data!.docs[index].get('time')} hrs"
                                .replaceAll('minified:bo(', '')
                                .replaceAll('TimeOfDay(', '')
                                .replaceAll(')', ''),
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text(
                          "Cost -> Rs. ${snapshot.data!.docs[index].get('tot_amt')}",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Name of organiser -> ${snapshot.data!.docs[index].get('username')}",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "FROM -> ${snapshot.data!.docs[index].get('from')}",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "DESTINATION -> ${snapshot.data!.docs[index].get('destination')}",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "DATE ->  ${snapshot.data!.docs[index].get('date')}",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "No of people in the trip -> ${snapshot.data!.docs[index].get('people')}",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Phone no. of organiser -> ${snapshot.data!.docs[index].get('ph_no')}",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Vehicle type -> ${snapshot.data!.docs[index].get('veh_ty')}",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      );
                    },
                    itemCount: snapshot.data?.docs.length,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.hasError.toString()}"),
                  );
                } else {
                  return Center(
                    child: Text("Data not found!!"),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
