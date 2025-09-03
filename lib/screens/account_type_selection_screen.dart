import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AccountTypeSelectionScreen extends StatefulWidget {
  const AccountTypeSelectionScreen({super.key});

  @override
  State<AccountTypeSelectionScreen> createState() => _AccountTypeSelectionScreenState();
}

class _AccountTypeSelectionScreenState extends State<AccountTypeSelectionScreen> {
  String _selectedAccountType = "Donor";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurvedHeader(
              height: size.height * 0.25, // Responsive header height
              title: 'Choose Account Type',
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.04), // Responsive padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: size.height * 0.02), // Responsive spacing
                  Text(
                    'Do you want to donate blood or need blood?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: size.width * 0.045, color: Colors.grey[700]),
                  ),
                  SizedBox(height: size.height * 0.04),
                  _buildAccountTypeCard(
                    title: "Blood Donor",
                    subtitle: "Help save lives by donating blood to those in need. Join our community of heroes.",
                    icon: Icons.bloodtype,
                    isSelected: _selectedAccountType == "Donor",
                    onTap: () => setState(() => _selectedAccountType = "Donor"),
                    context: context,
                  ),
                  SizedBox(height: size.height * 0.02), // Responsive spacing
                  _buildAccountTypeCard(
                    title: "Need Blood",
                    subtitle: "Find blood donors quickly in emergency situations. Get help when you need it most.",
                    icon: Icons.healing,
                    isSelected: _selectedAccountType == "Recipient",
                    onTap: () => setState(() => _selectedAccountType = "Recipient"),
                    context: context,
                  ),
                  SizedBox(height: size.height * 0.04), // Responsive spacing
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedAccountType == 'Donor') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DonorRegistrationScreen(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RecipientRegistrationScreen(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: Size(double.infinity, size.height * 0.06), // Responsive button height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: size.width * 0.05)), // Responsive font size
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTypeCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: isSelected ? 8 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.06), // Responsive padding
          child: Column(
            children: [
              Icon(icon, size: size.width * 0.12, color: Theme.of(context).primaryColor), // Responsive icon size
              SizedBox(height: size.height * 0.02), // Responsive spacing
              Text(
                title,
                style: TextStyle(fontSize: size.width * 0.055, fontWeight: FontWeight.bold), // Responsive font size
              ),
              SizedBox(height: size.height * 0.01), // Responsive spacing
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: size.width * 0.04), // Responsive font size
              ),
              if (isSelected) SizedBox(height: size.height * 0.02), // Responsive spacing
              if (isSelected)
                Chip(
                  label: Text('Selected', style: TextStyle(fontSize: size.width * 0.04)), // Responsive font size
                  backgroundColor: Colors.red,
                  labelStyle: const TextStyle(color: Colors.white),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
