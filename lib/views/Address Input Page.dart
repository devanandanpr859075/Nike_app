import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _houseNoController = TextEditingController();
  final TextEditingController _roadNameController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();

  String _selectedAddressType = 'Home';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            CustomInputField(
              label: 'Full Name (Required)',
              controller: _fullNameController,
              validator: (val) => val!.isEmpty ? 'Please enter full name' : null,
            ),
            const SizedBox(height: 16),

            CustomInputField(
              label: 'Mobile Number (Required)',
              controller: _mobileController,
              keyboardType: TextInputType.phone,
              validator: (val) => val!.isEmpty ? 'Please enter mobile number' : null,
            ),
            const SizedBox(height: 16),

            const Text(
              '+ Add Alternate phone Number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            CustomInputField(
              label: 'House No., Building Name (Required)',
              controller: _houseNoController,
              validator: (val) => val!.isEmpty ? 'Please enter house/building details' : null,
            ),
            const SizedBox(height: 16),

            CustomInputField(
              label: 'Road Name, Area, Colony (Required)',
              controller: _roadNameController,
              validator: (val) => val!.isEmpty ? 'Please enter area/road details' : null,
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    label: 'Pincode (Required)',
                    controller: _pincodeController,
                    keyboardType: TextInputType.number,
                    validator: (val) => val!.isEmpty ? 'Enter pincode' : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomInputField(
                    label: 'State (Required)',
                    controller: _stateController,
                    validator: (val) => val!.isEmpty ? 'Enter state' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    label: 'City (Required)',
                    controller: _cityController,
                    validator: (val) => val!.isEmpty ? 'Enter city' : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomInputField(
                    label: 'Landmark',
                    controller: _landmarkController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              'Type of Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            Row(
              children: ['Home', 'Work'].map((type) {
                final isSelected = _selectedAddressType == type;
                final icon = type == 'Home'
                    ? Icons.home_outlined
                    : Icons.work_outline;

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectedAddressType = type;
                      });
                    },
                    icon: Icon(
                      icon,
                      color: isSelected ? Colors.white : Colors.black,
                      size: 20,
                    ),
                    label: Text(
                      type,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: isSelected
                          ? const Color(0xFF1E0D4D)
                          : Colors.white,
                      side: const BorderSide(color: Colors.black),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E0D4D),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Save Address"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      ),
    );
  }
}
