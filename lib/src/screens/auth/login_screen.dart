import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Add your login logic here
    print('Logging in...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4DE165), // Custom background color
      body: Padding(
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
            SizedBox(height: 40),
            Text(
              'LOGIN',
              style: GoogleFonts.irishGrover(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
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
            CustomButton(
              text: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, '/user_dashboard');
              },
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, // White text color
                  ),
                  child: Text('Create new account?', style: TextStyle(fontStyle: FontStyle.italic),),
                ),
                SizedBox(width: 130), // Space between the buttons
                TextButton(
                  onPressed: () {
                    print('Forgot Password pressed'); // Placeholder for action
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, // White text color
                  ),
                  child: Text('Forgot Password?', style: TextStyle(fontStyle: FontStyle.italic)),
                ),
              ],
            ),
            SizedBox(height: 30),
            CustomButton2(
              text: 'Google',
              onPressed: _login,
            ),
            SizedBox(height: 10),
            CustomButton2(
              text: 'Facebook',
              onPressed: _login,
            ),
            SizedBox(height: 10),
            CustomButton2(
              text: 'Guest',
              onPressed: _login,
            ),
          ],
        ),
      ),
    );
  }
}