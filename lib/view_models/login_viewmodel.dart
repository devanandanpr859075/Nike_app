import 'package:flutter/material.dart';
import '../controller/auth_controller.dart';
import '../model/user_model.dart';
import '../Widgets/Nav_bar.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  bool isValidEmail = false;
  bool isLoading = false;

  void validateEmail(String value) {
    isValidEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value);
    notifyListeners();
  }

  Future<void> loginWithEmail(BuildContext context) async {
    if (!isValidEmail || isLoading) return;

    try {
      isLoading = true;
      notifyListeners();

      // TODO: Replace with real password input later
      const String tempPassword = "12345678";

      Email_UserModel? user = await _authService.loginWithEmail(
        emailController.text.trim(),
        tempPassword,
      );

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => BottomNavWrapper()),
        );
      } else {
        _showSnackbar(context, 'Login failed');
      }
    } catch (e) {
      _showSnackbar(context, e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void _showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
