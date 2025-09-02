import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class DonorHomePage extends StatelessWidget {
  const DonorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          _buildWelcomeSection(),
          _buildImageSlider(),
          _buildLocationUpdateCard(),
          _buildDonationHistory(),
          _buildUploadCertificate(),
          _buildEmergencyRequests(),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Welcome, Donor!',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildImageSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  'Image $i',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildLocationUpdateCard() {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.red),
            const SizedBox(width: 16),
            const Expanded(
              child: Text('Current Location: Dhaka, Bangladesh'),
            ),
            ElevatedButton(
              onPressed: () {
                // Open location update popup
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationHistory() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Donation History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Total Donations: 5'),
          Text('Last Donation: 2023-10-26'),
        ],
      ),
    );
  }

  Widget _buildUploadCertificate() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Upload Certificate', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () {
              // Handle certificate upload
            },
            icon: const Icon(Icons.upload),
            label: const Text('Upload Donation Certificate'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyRequests() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Emergency Blood Requests', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildRequestCard(),
          _buildRequestCard(),
        ],
      ),
    );
  }

  Widget _buildRequestCard() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              // backgroundImage: NetworkImage('...'),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recipient Name', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Donation History: 2 times'),
                  Text('Location: Mirpur, Dhaka'),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.call),
              onPressed: () async {
                final Uri launchUri = Uri(
                  scheme: 'tel',
                  path: '1234567890', // Placeholder phone number
                );
                await launchUrl(launchUri);
              },
            ),
            IconButton(
              icon: const Icon(Icons.chat),
              onPressed: () {
                // Open chat
              },
            ),
          ],
        ),
      ),
    );
  }
}
