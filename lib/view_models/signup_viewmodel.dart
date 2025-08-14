import 'package:flutter/material.dart';
import 'package:nike_ecom/controller/auth_controller.dart';
import 'package:nike_ecom/model/user_model.dart';


class SignupViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  bool isValidEmail = false;
  bool isLoading = false;

  final AuthService _authService = AuthService();

  void validateEmail(String value) {
    isValidEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value);
    notifyListeners();
  }

  Future<Email_UserModel?> submitEmail(BuildContext context) async {
    if (!isValidEmail) return null;

    // Navigate to next screen for password entry
    Navigator.pushNamed(context, '/password', arguments: emailController.text.trim());
    return null;
  }
}
