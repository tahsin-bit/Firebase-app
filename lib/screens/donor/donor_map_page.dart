import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DonorMapPage extends StatefulWidget {
  const DonorMapPage({super.key});

  @override
  State<DonorMapPage> createState() => _DonorMapPageState();
}

class _DonorMapPageState extends State<DonorMapPage> {
  static const LatLng _initialPosition = LatLng(23.8103, 90.4125); // Dhaka

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 12,
            ),
          ),
          _buildFilterControls(),
        ],
      ),
    );
  }

  Widget _buildFilterControls() {
    return Positioned(
      top: 10,
      left: 10,
      right: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Filter by Division, Zila, Upazila',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                // Show filter options
              },
            ),
          ],
        ),
      ),
    );
  }
}
