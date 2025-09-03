import 'package:flutter/material.dart';
import 'package:roktalap/widgets/curved_header.dart'; // Ensure this path is correct

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String? _otpSentMessage;

  void _sendOtp() {
    // In a real application, you would send an OTP to the entered email
    // and handle the response. For this example, we'll just simulate it.
    setState(() {
      _otpSentMessage = 'An OTP has been sent to ${_emailController.text}';
    });
    // You might navigate to an OTP verification screen here or show a dialog.
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CurvedHeader(
              title: 'Forgot Password',
              height: screenHeight * 0.25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Enter your email to receive an OTP for password reset.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  ElevatedButton(
                    onPressed: _sendOtp,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                    ),
                    child: Text(
                      'Send OTP',
                      style: TextStyle(fontSize: screenWidth * 0.045),
                    ),
                  ),
                  if (_otpSentMessage != null) ...[
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      _otpSentMessage!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.green, fontSize: screenWidth * 0.035),
                    ),
                  ],
                  SizedBox(height: screenHeight * 0.03),
                  // In a real app, you would add fields for OTP and new password here
                  // along with a "Reset Password" button.
                  Text(
                    'OTP and New Password fields would go here in a full implementation.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: screenWidth * 0.035,
                        color: Colors.grey),
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
