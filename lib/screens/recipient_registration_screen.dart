import 'package:flutter/material.dart';
import 'package:food_donation_app/screens/recipient/recipient_main_screen.dart'; // Assuming this is the recipient home page
import 'package:food_donation_app/widgets/curved_header.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RecipientRegistrationScreen extends StatefulWidget {
  const RecipientRegistrationScreen({super.key});

  @override
  State<RecipientRegistrationScreen> createState() => _RecipientRegistrationScreenState();
}

class _RecipientRegistrationScreenState extends State<RecipientRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _profileImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
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
              height: size.height * 0.35, // Responsive header height
              title: 'Create Recipient Account',
              profileImage: _profileImage,
              onImageTap: _pickImage,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08, vertical: size.height * 0.03),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Name',
                          border: const UnderlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015,
                              horizontal: size.width * 0.02)),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your name' : null,
                      style: TextStyle(fontSize: size.width * 0.045),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Blood Group',
                          border: const UnderlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015,
                              horizontal: size.width * 0.02)),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your blood group' : null,
                      style: TextStyle(fontSize: size.width * 0.045),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: const UnderlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015,
                              horizontal: size.width * 0.02)),
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your phone number' : null,
                      style: TextStyle(fontSize: size.width * 0.045),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          border: const UnderlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015,
                              horizontal: size.width * 0.02)),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your email' : null,
                      style: TextStyle(fontSize: size.width * 0.045),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: const UnderlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015,
                              horizontal: size.width * 0.02)),
                      obscureText: true,
                      validator: (value) => value!.length < 6
                          ? 'Password must be at least 6 characters'
                          : null,
                      style: TextStyle(fontSize: size.width * 0.045),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: const UnderlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: size.height * 0.015,
                              horizontal: size.width * 0.02)),
                      obscureText: true,
                      validator: (value) {
                        // Add logic to match passwords
                        return null;
                      },
                      style: TextStyle(fontSize: size.width * 0.045),
                    ),
                    SizedBox(height: size.height * 0.04),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Process data and navigate to recipient home page
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RecipientMainScreen()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        minimumSize: Size(double.infinity, size.height * 0.06),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Create Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.05)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
