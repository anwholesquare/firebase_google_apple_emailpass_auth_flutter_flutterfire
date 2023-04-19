// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_auth/pages/auth_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

Function()? toggleThemeFunction;
void toggleThemeGlobal ({Function()? toggleFunction}) {
  toggleThemeFunction = toggleFunction;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;

  void toggleTheme () {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  void initState() {
    toggleThemeGlobal(toggleFunction: toggleTheme);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData (
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.nunito().fontFamily,
        brightness: isDark? Brightness.dark : Brightness.light
      ),
      home: AuthPage(),
    );
  }
}
