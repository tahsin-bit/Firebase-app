import 'package:flutter/material.dart';
import 'package:roktalap/screens/donor/donor_main_screen.dart'; // Assuming this is the donor home page
import 'package:roktalap/widgets/curved_header.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DonorRegistrationScreen extends StatefulWidget {
  const DonorRegistrationScreen({super.key});

  @override
  State<DonorRegistrationScreen> createState() => _DonorRegistrationScreenState();
}

class _DonorRegistrationScreenState extends State<DonorRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Theme.of(context).primaryColor,
            colorScheme: ColorScheme.light(primary: Theme.of(context).primaryColor),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
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
              title: 'Create Donor Account',
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
                    Text('Additional Information',
                        style: TextStyle(
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: size.height * 0.01),
                    ElevatedButton.icon(
                      onPressed: () {
                        /* Handle Birth ID upload */
                      },
                      icon: Icon(Icons.upload_file, size: size.width * 0.05),
                      label: Text('Upload Birth ID',
                          style: TextStyle(fontSize: size.width * 0.045)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
                      ),
                    ),
                    ListTile(
                      title: Text(
                          _selectedDate == null
                              ? 'Select Birthday'
                              : 'Birthday: ${_selectedDate!.toLocal()}'
                                  .split(' ')[0],
                          style: TextStyle(fontSize: size.width * 0.045)),
                      trailing: Icon(Icons.calendar_today, size: size.width * 0.05),
                      onTap: () => _selectDate(context),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.02, vertical: 0),
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
                          // Process data and navigate to donor home page
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DonorMainScreen()),
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