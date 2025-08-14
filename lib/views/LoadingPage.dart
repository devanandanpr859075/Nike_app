import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13042E),
      body: Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
