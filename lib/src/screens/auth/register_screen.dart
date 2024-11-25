import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedGender;
  DateTime? _birthDate;

  void _register() {
    print(
        'Registering with First Name: ${_firstNameController.text}, Last Name: ${_lastNameController.text}, Gender: $_selectedGender, Birthdate: $_birthDate, Email: ${_emailController.text}, Password: ${_passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4DE165), // Custom background color
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50), // Space from the top
            Image.asset(
              'assets/images/logo.png', // Logo path
              height: 150,
              width: 150,
            ),
            SizedBox(height: 30),
            Text(
              'Register',
              style: GoogleFonts.irishGrover(
                fontSize: 48, // Adjusted size for better layout
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _firstNameController,
                    hintText: 'First Name',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    controller: _lastNameController,
                    hintText: 'Last Name',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: CustomDropdownButton(
                    hintText: 'Gender',
                    items: ['Male', 'Female', 'Other'], // Gender options
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16), // Space between Gender and Birthdate
                Expanded(
                  child: CustomDateButton(
                    hintText: 'Select Birthdate',
                    onDateSelected: (selectedDate) {
                      setState(() {
                        _birthDate = selectedDate;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: _emailController,
              hintText: 'Email',
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Confirm-Password',
              obscureText: true,
            ),
            SizedBox(height: 30),
            CustomButton(
              text: 'Register',
              onPressed: _register,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login'); // Navigate to Login
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
