import 'package:flutter/material.dart';
import 'package:roktalap/screens/donor/donor_home_page.dart';
import 'package:roktalap/screens/donor/donor_map_page.dart';
import 'package:roktalap/screens/donor/donor_profile_page.dart';
import 'package:roktalap/screens/donor/donor_settings_page.dart';
import 'package:roktalap/widgets/curved_header.dart';
import 'package:roktalap/widgets/pill_shaped_nav_bar.dart';

class DonorMainScreen extends StatefulWidget {
  const DonorMainScreen({super.key});

  @override
  State<DonorMainScreen> createState() => _DonorMainScreenState();
}

class _DonorMainScreenState extends State<DonorMainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const DonorHomePage(),
    const DonorMapPage(),
    const DonorProfilePage(),
    const DonorSettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CurvedHeader(
        title: 'Roktalap',
        actions: [
          IconButton(
            icon: const Icon(Icons.message, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: PillShapedNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        isDonor: true, // Still true, but the nav bar itself will have fewer items
      ),
    );
  }
}
