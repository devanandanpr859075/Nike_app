import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13042E),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 80),
                const SizedBox(height: 24),
                const Text(
                  "OOPS!",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Something went wrong.\nPlease try again or go back to home.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Try Again Button
                    OutlinedButton(
                      onPressed: () {
                        // Implement retry logic here
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 14),
                      ),
                      child: const Text(
                        "Try Again",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  child: Text("Back to Home ",style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                      decoration: TextDecoration.underline
                  ),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
