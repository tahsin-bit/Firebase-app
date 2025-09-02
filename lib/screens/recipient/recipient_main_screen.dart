import 'package:flutter/material.dart';
import 'package:roktalap/screens/recipient/find_donors_page.dart';
import 'package:roktalap/screens/recipient/recipient_home_page.dart';
import 'package:roktalap/screens/recipient/recipient_map_page.dart';
import 'package:roktalap/screens/recipient/recipient_profile_page.dart';
import 'package:roktalap/screens/recipient/recipient_settings_page.dart';
import 'package:roktalap/widgets/curved_header.dart';
import 'package:roktalap/widgets/pill_shaped_nav_bar.dart';

class RecipientMainScreen extends StatefulWidget {
  const RecipientMainScreen({super.key});

  @override
  State<RecipientMainScreen> createState() => _RecipientMainScreenState();
}

class _RecipientMainScreenState extends State<RecipientMainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    RecipientHomePage(),
    RecipientMapPage(),
    FindDonorsPage(),
    RecipientProfilePage(),
    RecipientSettingsPage(),
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
        isDonor: false,
      ),
    );
  }
}
