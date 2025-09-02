import 'package:flutter/material.dart';

class DonorProfilePage extends StatelessWidget {
  const DonorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red[900],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              const SizedBox(height: 60), // Space for profile picture
              const Text(
                'Donor Name',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const Text(
                'Blood Group: A+',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 16),
              _buildContactInfo(),
              const Divider(color: Colors.white54),
              _buildReviewSection(context),
              const Divider(color: Colors.white54),
              _buildLocationInfo(),
              const Divider(color: Colors.white54),
              _buildAboutSection(),
            ],
          ),
          Positioned(
            top: -50,
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  // backgroundImage: NetworkImage('...'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, size: 20, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {},
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.swap_horiz, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return const Column(
      children: [
        Text('Contact Info', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 8),
        Text('Phone: +8801234567890', style: TextStyle(color: Colors.white70)),
        Text('Email: donor@example.com', style: TextStyle(color: Colors.white70)),
      ],
    );
  }

  Widget _buildReviewSection(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.star, color: Colors.yellow),
      title: const Text('Reviews', style: TextStyle(color: Colors.white)),
      subtitle: const Text('4.5 stars (10 reviews)', style: TextStyle(color: Colors.white70)),
      onTap: () {},
    );
  }

  Widget _buildLocationInfo() {
    return const Column(
      children: [
        Text('Location', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 8),
        Text('Zila: Dhaka', style: TextStyle(color: Colors.white70)),
        Text('Upazila: Gulshan', style: TextStyle(color: Colors.white70)),
        Text('Division: Dhaka', style: TextStyle(color: Colors.white70)),
        Text('Country: Bangladesh', style: TextStyle(color: Colors.white70)),
      ],
    );
  }

  Widget _buildAboutSection() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('About Me', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 8),
          Text(
            'A passionate blood donor, always ready to help people in need. I believe in the power of giving.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
