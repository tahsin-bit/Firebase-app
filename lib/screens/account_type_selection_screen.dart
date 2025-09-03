import 'package:flutter/material.dart';
import 'package:roktalap/screens/donor_registration_screen.dart';
import 'package:roktalap/screens/recipient_registration_screen.dart';

class AccountTypeSelectionScreen extends StatefulWidget {
  const AccountTypeSelectionScreen({super.key});

  @override
  State<AccountTypeSelectionScreen> createState() => _AccountTypeSelectionScreenState();
}

class _AccountTypeSelectionScreenState extends State<AccountTypeSelectionScreen> {
  String _selectedAccountType = "Donor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Welcome to Roktalap',
          style: TextStyle(color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.favorite, color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose Your Account Type',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Do you want to donate blood or need blood?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            _buildAccountTypeCard(
              context,
              title: "Blood Donor",
              subtitle: "Help save lives by donating blood to those in need. Join our community of heroes.",
              icon: Icons.bloodtype,
              isSelected: _selectedAccountType == "Donor",
              onTap: () => setState(() => _selectedAccountType = "Donor"),
            ),
            const SizedBox(height: 16.0),
            _buildAccountTypeCard(
              context,
              title: "Need Blood",
              subtitle: "Find blood donors quickly in emergency situations. Get help when you need it most.",
              icon: Icons.healing,
              isSelected: _selectedAccountType == "Recipient",
              onTap: () => setState(() => _selectedAccountType = "Recipient"),
            ),
            const Spacer(),
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
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Continue', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTypeCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Icon(icon, size: 48, color: Theme.of(context).primaryColor),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
              if (isSelected) const SizedBox(height: 16),
              if (isSelected)
                const Chip(
                  label: Text('Selected'),
                  backgroundColor: Colors.red,
                  labelStyle: TextStyle(color: Colors.white),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
