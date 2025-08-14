import 'package:flutter/material.dart';
import 'package:nike_ecom/controller/auth_controller.dart';
import 'package:nike_ecom/Widgets/Nav_bar.dart';
import 'package:provider/provider.dart';
import '../view_models/signup_viewmodel.dart';

class EmailEntryScreen extends StatelessWidget {
  const EmailEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignupViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/images/nike_Logo.png',
                      height: 34,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'lib/images/Nike_jump_icon.png',
                      height: 34,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
            
                const Text(
                  "Enter your email to join us\nor sign in.",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
            
                Row(
                  children: const [
                    Text(
                      "India",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 6),
                    Text(
                      "Change",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.grey,
                        letterSpacing: 1,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
            
                TextField(
                  controller: viewModel.emailController,
                  onChanged: viewModel.validateEmail,
                  decoration: InputDecoration(
                    labelText: "Email*",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  ),
                ),
                const SizedBox(height: 12),
            
                const Text.rich(
                  TextSpan(
                    style: TextStyle(letterSpacing: 1, fontSize: 15),
                    text: "By continuing, I agree to Nike’s ",
                    children: [
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                        text: "Terms of Use.",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: ElevatedButton(
                        onPressed: viewModel.isValidEmail
                            ? () => viewModel.submitEmail(context)
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
            
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text("or"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 40),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSocialCard(
                      'lib/images/Google_Logo.png',
                      onTap: () async {
                        final authController = AuthService();
                        final user = await authController.signInWithGoogle();
                        if (user != null && context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => BottomNavWrapper()),
                          );
                        }
                      },
                    ),
                    _buildSocialCard('lib/images/Face_book.png'),
                    _buildSocialCard('lib/images/Apple.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildSocialCard(String assetPath, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Image.asset(assetPath, height: 28),
        ),
      ),
    );
  }
}
