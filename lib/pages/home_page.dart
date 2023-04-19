import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void userSignOut() {
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: userSignOut, icon: const Icon(Icons.logout))
        ]),
      body: Center(child: Text("Signed In As\n${FirebaseAuth.instance.currentUser!.email}", textAlign: TextAlign.center,)),
    );
  }
}