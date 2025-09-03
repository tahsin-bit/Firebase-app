import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:food_donation_app/screens/account_type_selection_screen.dart';
import 'package:food_donation_app/screens/recipient/recipient_main_screen.dart';
import 'package:food_donation_app/widgets/curved_header.dart';
import 'package:food_donation_app/screens/forgot_password_screen.dart'; // Import the new screen
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurvedHeader(
              height: size.height * 0.4, // Responsive header height
              profileImage: _profileImage,
              onImageTap: _pickImage,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.05), // Space from top
                    Icon(
                      Icons.bloodtype,
                      color: Colors.white,
                      size: size.width * 0.2, // Responsive icon size
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      'Roktalap',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontSize: size.width * 0.08, // Responsive font size
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08, vertical: size.height * 0.03),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: size.width * 0.07, // Responsive font size
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email or Phone',
                      border: const UnderlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: size.height * 0.015,
                          horizontal: size.width * 0.02),
                    ),
                    style: TextStyle(fontSize: size.width * 0.045), // Responsive text size
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const UnderlineInputBorder(),
                      suffixIcon: Icon(Icons.visibility_off, size: size.width * 0.05), // Responsive icon size
                      contentPadding: EdgeInsets.symmetric(
                          vertical: size.height * 0.015,
                          horizontal: size.width * 0.02),
                    ),
                    style: TextStyle(fontSize: size.width * 0.045), // Responsive text size
                  ),
                  SizedBox(height: size.height * 0.02),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPasswordScreen()),
                        );
                      },
                      child: Text('Forgot Password?',
                          style: TextStyle(fontSize: size.width * 0.04)), // Responsive font size
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: Size(double.infinity, size.height * 0.06), // Responsive button height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.05)), // Responsive font size
                  ),
                  SizedBox(height: size.height * 0.02),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final GoogleSignIn googleSignIn = GoogleSignIn();
                      try {
                        final GoogleSignInAccount? googleUser =
                            await googleSignIn.signIn();
                        if (googleUser != null) {
                          // Successfully signed in with Google.
                          // Navigate to RecipientMainScreen as per requirement.
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RecipientMainScreen()),
                          );
                        }
                      } catch (error) {
                        print('Google Sign-In Error: $error');
                        // Show error to user
                      }
                    },
                    icon: Image.asset('assets/google_logo.png', height: size.width * 0.05, width: size.width * 0.05), // Google logo
                    label: Text('Sign In With Google',
                        style: TextStyle(fontSize: size.width * 0.045)), // Responsive font size
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, size.height * 0.06), // Responsive button height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?",
                          style: TextStyle(fontSize: size.width * 0.04)), // Responsive font size
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AccountTypeSelectionScreen(),
                            ),
                          );
                        },
                        child: Text('Register',
                            style: TextStyle(fontSize: size.width * 0.04)), // Responsive font size
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
