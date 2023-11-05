import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger/pages/home_page.dart';
import 'package:messenger/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshop){
          // user is logged in
          if (snapshop.hasData) {
            return const HomePage();
          }

          // user is not logged in
          return const LoginOrRegister();
        },)
    );
  }
}