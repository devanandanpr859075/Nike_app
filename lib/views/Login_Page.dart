import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logos
              Row(
                children: [
                  Image.asset("lib/images/nike_Logo.png", height: 24, color: Colors.black),
                  const SizedBox(width: 14),
                  Image.asset("lib/images/Nike_jump_icon.png", height: 35),
                ],
              ),
              const SizedBox(height: 40),

              const Text(
                "Sign in with email",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E1A2E),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Maecenas a quam a elit porta hendrerit\nid elementum massa.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  height: 1.5,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 30),

              // Email field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.email_outlined, color: Colors.black87),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: viewModel.emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: viewModel.validateEmail,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                      ),
                    ),
                    if (viewModel.isValidEmail)
                      const Icon(Icons.check_circle, color: Colors.green),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Show password field only when email is valid
              if (viewModel.isValidEmail)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter your password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.lock_outline, color: Colors.black87),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: viewModel.passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 34),

              // Continue button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: viewModel.isValidEmail && !viewModel.isLoading
                      ? () => viewModel.loginWithEmail(context)
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E1A2E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                  ),
                  child: viewModel.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Divider
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: const Text(
                      "or continue with",
                      style: TextStyle(color: Colors.black45, fontSize: 14),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 34),

              // Social buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialIcon("lib/images/Google_Logo.png"),
                  _buildSocialIcon("lib/images/Face_book.png"),
                  _buildSocialIcon("lib/images/Apple.png"),
                ],
              ),

              const SizedBox(height: 40),

              // Footer text
              const Center(
                child: Text(
                  "Nam id elementum risus. Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Integer luctus enim non\nsapien ullamcorper congue.",
                  style: TextStyle(color: Colors.black45, fontSize: 13, height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return Container(
      height: 50,
      width: 60,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Image.asset(assetPath, fit: BoxFit.contain),
    );
  }
}
