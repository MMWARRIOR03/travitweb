import 'package:flutter/material.dart';
import 'result_screen.dart';

class JoinTrip extends StatefulWidget {
  const JoinTrip({super.key});

  @override
  State<JoinTrip> createState() => _JoinTripState();
}

var _fromval;
var _destinationval;
TextEditingController _dateController = TextEditingController();

class _JoinTripState extends State<JoinTrip> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(60, 137, 178, 1),
        title: Text('Join trip with others'),
        leading: BackButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/'),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/jointrip.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
            child: Column(
              children: [
                SizedBox(height: 30),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurpleAccent, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: 'FROM',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                    fillColor: Colors.black,
                    prefixIcon: Icon(Icons.my_location, color: Colors.white),
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
                const SizedBox(height: 30),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                            width: 2,
                            style: BorderStyle.solid)),
                    labelText: 'DESTINATION',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
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
                  decoration: const InputDecoration(
                    labelText: 'DATE',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                    filled: false,
                    prefixIcon:
                        Icon(Icons.calendar_today, color: Colors.deepPurple),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(78, 136, 164, 1), width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(color: Colors.deepPurpleAccent, width: 2),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return resultScreen();
                      }));
                    }
                  },
                  child: Text('Search trip'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 10)));
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}

from() {
  return _fromval;
}

destination() {
  return _destinationval;
}

date() {
  return _dateController.text;
}
