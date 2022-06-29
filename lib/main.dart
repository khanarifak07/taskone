import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taskone/firebase_options.dart';
import 'package:taskone/home_page.dart';

import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Root(),
    );
  }
}

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _firebaseAuth.authStateChanges(),
      builder: (builder, snap) {
        if (!snap.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var user = snap.data;
        if (user != null) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
