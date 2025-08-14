import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_ecom/views/WelcomeScreen.dart';

class SignedInSuccessScreen extends StatelessWidget {
  const SignedInSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // As shown in the screenshot
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 30,),
              Row(
                children: [
                  Image.asset(
                    'lib/images/nike_Logo.png',
                    height: 34,
                    color: const Color(0xFF1C0F38), // deep purple-black logo
                  ),
                  const SizedBox(width: 12),
                  Image.asset(
                    'lib/images/Nike_jump_icon.png',
                    height: 44,
                    color: const Color(0xFF1C0F38),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Success text
              Text(
                "You have been signed in\nsuccessfully.",
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1C0F38), // same deep purple-black
                  height: 1.4,
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){return WelcomeScreen();}));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C0F38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 27, vertical: 10),
                    ),
                    child: Text(
                      "Continue",
                      style: GoogleFonts.montserrat(
                        letterSpacing: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
