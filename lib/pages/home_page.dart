import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  void signOut() {
   // sign out
   final authService = Provider.of<AuthService>(context, listen: false);
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messenger'),
      actions: [
        // sign out button
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.logout),
        ),
      ],),
    );
  }
}