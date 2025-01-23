import 'package:flutter/material.dart';
import 'Screens/login_screen.dart';
import 'Screens/join_trip.dart';
import 'Screens/new_trip.dart';
import 'Screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Screens/result_screen.dart';
import 'Screens/logindecider.dart';
import 'Screens/about_screen.dart';
import 'Screens/developer_screen.dart';
import 'Screens/myTrip.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  await Future.delayed(const Duration(milliseconds: 300));
  // FlutterNativeSplash.remove();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        initialRoute: '/login_page',
        routes: {
          '/': (context) => HomePage(),
          '/login_page': (context) => loginPage(),
          '/join_trip': (context) => JoinTrip(),
          '/new_trip': (context) => NewTripPage(),
          '/result_page': (context) => resultScreen(),
          '/logindecide': (context) => decidee(),
          '/about': (context) => aboutScreen(),
          '/dev': (context) => devScreen(),
          '/mytrip': (context) => myTripScreen(),
        });
  }
}
