import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travit_web/Screens/home_screen.dart';
import 'package:travit_web/auth_service.dart';
import 'package:travit_web/main.dart';
import 'package:firebase_core/firebase_core.dart';

class NewTripPage extends StatefulWidget {
  NewTripPage({super.key});

  @override
  State<NewTripPage> createState() => _NewTripPageState();
}

final usermail = AuthService().getUserEmail();
final fromController = TextEditingController();
final destinationController = TextEditingController();
final no_peopleController = TextEditingController();
final tot_amtController = TextEditingController();
final ph_noController = TextEditingController();
final tye_vehController = TextEditingController();

var _fromval;
var _destinationval;
var _peopleval;
var _timeController = TextEditingController();

class _NewTripPageState extends State<NewTripPage> {
  TextEditingController _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new trip'),
        backgroundColor: Color.fromRGBO(36, 55, 90, 1),
        leading: BackButton(
            onPressed: () => Navigator.popAndPushNamed(context, '/')),
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(78, 136, 164, 1), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'FROM',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.my_location, color: Colors.blue),
                    ),

                    items: [
                      'Bhopal',
                      'Indore',
                      'Rani Kamlapati',
                      'S Hirdaramnagar Railway Station',
                      'Bhopal Junction',
                      'Bhopal Airport',
                      'Indore Airport',
                      'VIT Bhopal',
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text("$e"),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _fromval = val;
                      });
                    },
                    value: _fromval,
                    validator: (_formval) {
                      if (_formval == null) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    //_fromval important to store the value of the dropdown
                  ),
                  SizedBox(height: 30),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(78, 136, 164, 1), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'DESTINATION',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      fillColor: Colors.white,
                      prefixIcon:
                          Icon(Icons.pin_drop_outlined, color: Colors.red),
                    ),

                    items: [
                      'Bhopal',
                      'Indore',
                      'Rani Kamlapati',
                      'S Hirdaramnagar Railway Station',
                      'Bhopal Junction',
                      'Bhopal Airport',
                      'Indore Airport',
                      'VIT Bhopal',
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text("$e"),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _destinationval = val;
                      });
                    },
                    value: _destinationval,
                    validator: (_destinationval) {
                      if (_destinationval == null) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    //_fromval important to store the value of the dropdown
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: 'DATE',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      filled: false,
                      prefixIcon: Icon(Icons.calendar_today, color: Colors.red),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(78, 136, 164, 1), width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(78, 36, 164, 1), width: 1.5),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    readOnly: true,
                    onTap: () {
                      selectDate();
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _timeController,
                    decoration: InputDecoration(
                      labelText: 'TIME',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      filled: false,
                      prefixIcon:
                          Icon(Icons.timer_outlined, color: Colors.blue),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(78, 136, 164, 1), width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    readOnly: true,
                    onTap: () {
                      selectTime(context);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(height: 30),
                  // TextFormField(
                  //   controller: no_peopleController,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //           color: Color.fromRGBO(78, 136, 164, 1), width: 2),
                  //       borderRadius: BorderRadius.all(Radius.circular(20)),
                  //     ),
                  //     labelText: 'Number of people currently in the trip',
                  //     labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                  //     fillColor: Colors.white,
                  //     prefixIcon:
                  //         Icon(Icons.people_alt_outlined, color: Colors.blue),
                  //   ),
                  //   keyboardType: TextInputType.number,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter some number';
                  //     }
                  //     return null;
                  //   },
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  // ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(78, 136, 164, 1), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Number of people currently in the trip',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person, color: Colors.red),
                    ),

                    items: [
                      '1',
                      '2',
                      '3',
                      '4',
                      '5',
                      '6',
                      '7',
                      '8',
                      '9',
                      '10',
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text("$e"),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _peopleval = val;
                      });
                    },
                    value: _peopleval,
                    validator: (_peopleval) {
                      if (_peopleval == null) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    //_fromval important to store the value of the dropdown
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: tot_amtController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(78, 136, 164, 1), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Total amount for vehicle booking',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.currency_rupee,
                        color: Colors.green,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: ph_noController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(78, 136, 164, 1), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Contact number',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.phone, color: Colors.blue),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.length < 10 || value!.length > 10) {
                        return 'Please enter some valid mobile number';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: tye_vehController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(78, 136, 164, 1), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Type of vehicle',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.directions_car, color: Colors.red),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 40, 600, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        CollectionReference callRef =
                            FirebaseFirestore.instance.collection('user');
                        print(_dateController);
                        callRef.doc(usermail).set({
                          'username': AuthService().getUserName(),
                          'from': _fromval.toString(),
                          'destination': _destinationval.toString(),
                          'date': _dateController.text.toString(),
                          'time': _timeController.text.toString(),
                          // 'no_people': no_peopleController.text.toString(),
                          'tot_amt': tot_amtController.text.toString(),
                          'ph_no': ph_noController.text.toString(),
                          'veh_ty': tye_vehController.text.toString(),
                          'people': _peopleval.toString(),
                        });
                        Navigator.popAndPushNamed(context, '/');
                      }
                    },
                    child: Text('Create trip'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.toString().split(" ")[0];
      });
    } else {
      return null;
    }
  }

  Future<void> selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 10)),
    );
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
