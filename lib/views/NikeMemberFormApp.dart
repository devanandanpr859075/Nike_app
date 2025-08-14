
import 'package:flutter/material.dart';
import 'package:nike_ecom/view_models/details_viewmodel.dart';
import 'package:nike_ecom/views/SuccessScreen.dart';
import 'package:provider/provider.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../view_models/signup_viewmodel.dart';

class NikeMemberFormScreen extends StatelessWidget {
  final String email;
  const NikeMemberFormScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<Signup_Password_ViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Form(
            key: vm.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('lib/images/nike_Logo.png', height: 34, color: Colors.black),
                    const SizedBox(width: 8),
                    Image.asset('lib/images/Nike_jump_icon.png', height: 34),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  "Now let’s make you a Nike\nMember.",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, height: 1.4),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "We’ve sent a code to \n$email",
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      "Edit",
                      style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: vm.codeController,
                  validator: RequiredValidator(errorText: 'Code is required'),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.autorenew),
                    labelText: "Code*",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  ),
                ),
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                  Text("Resend code in 8s", style: TextStyle(color: Colors.black54)),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(
                    child: TextFormField(
                      controller: vm.firstNameController,
                      validator: RequiredValidator(errorText: 'First name required'),
                      decoration: InputDecoration(
                        labelText: "First Name*",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: vm.surnameController,
                      validator: RequiredValidator(errorText: 'Surname required'),
                      decoration: InputDecoration(
                        labelText: "Surname*",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 16),
                TextFormField(
                  controller: vm.passwordController,
                  obscureText: vm.obscurePassword,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Password required'),
                    MinLengthValidator(8, errorText: 'Minimum 8 characters'),
                    PatternValidator(r'(?=.*?[A-Z])', errorText: 'Must contain uppercase'),
                    PatternValidator(r'(?=.*?[a-z])', errorText: 'Must contain lowercase'),
                    PatternValidator(r'(?=.*?[0-9])', errorText: 'Must contain number'),
                  ]),
                  decoration: InputDecoration(
                    labelText: "Password*",
                    suffixIcon: IconButton(
                      icon: Icon(vm.obscurePassword ? Icons.visibility_off : Icons.visibility),
                      onPressed: vm.togglePasswordVisibility,
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "• Minimum of 8 characters\n• Uppercase, lowercase letters and one number",
                  style: TextStyle(fontSize: 14, color: Colors.grey, letterSpacing: .5),
                ),
                const SizedBox(height: 20),
                const Text("Date of Birth", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Row(children: [
                  Expanded(
                    child: TextFormField(
                      controller: vm.dayController,
                      validator: RequiredValidator(errorText: 'Day required'),
                      decoration: InputDecoration(
                        hintText: "Day*",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: vm.monthController,
                      validator: RequiredValidator(errorText: 'Month required'),
                      decoration: InputDecoration(
                        hintText: "Month*",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: vm.yearController,
                      validator: RequiredValidator(errorText: 'Year required'),
                      decoration: InputDecoration(
                        hintText: "Year*",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 8),
                const Text("Get a Nike Member Reward on your birthday.", style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 28),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.7,
                    child: ElevatedButton(
                      onPressed: () {
                        if (vm.validateForm()) {
                          final user = vm.getUser(email);
                          Navigator.push(context, MaterialPageRoute(
                            builder: (_) => const SignedInSuccessScreen(),
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("Continue", style: TextStyle(color: Colors.white70)),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
