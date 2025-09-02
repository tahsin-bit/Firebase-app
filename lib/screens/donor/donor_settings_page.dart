import 'package:flutter/material.dart';

class DonorSettingsPage extends StatelessWidget {
  const DonorSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildSettingsItem(
            context,
            icon: Icons.color_lens,
            title: 'Theme',
            subtitle: 'System, Light, Dark',
            onTap: () {
              // Show theme options
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.language,
            title: 'Language',
            subtitle: 'Bangla, English, Chakma',
            onTap: () {
              // Show language options
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.lock_reset,
            title: 'Password Reset',
            onTap: () {
              // Navigate to password reset page
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.privacy_tip,
            title: 'Privacy & Policy',
            onTap: () {
              // Navigate to privacy policy page
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.description,
            title: 'Terms & Services',
            onTap: () {
              // Navigate to terms of service page
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout
            },
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'App Version: 2.0.0',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
