import 'package:flutter/material.dart';
import '../model/Password_UserModel.dart';

class Signup_Password_ViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final codeController = TextEditingController();
  final firstNameController = TextEditingController();
  final surnameController = TextEditingController();
  final passwordController = TextEditingController();
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  UserModel getUser(String email) {
    String dob = "${dayController.text}-${monthController.text}-${yearController.text}";
    return UserModel(
      firstName: firstNameController.text,
      surname: surnameController.text,
      email: email,
      password: passwordController.text,
      dob: dob,
    );
  }
}