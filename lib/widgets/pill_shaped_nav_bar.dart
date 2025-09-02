import 'package:flutter/material.dart';

class PillShapedNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final bool isDonor;

  const PillShapedNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.isDonor = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: isDonor
            ? [
                _buildNavItem(Icons.home, 'Home', 0),
                _buildNavItem(Icons.map, 'Map', 1),
                _buildNavItem(Icons.person, 'Profile', 2),
                _buildNavItem(Icons.settings, 'Settings', 3),
              ]
            : [
                _buildNavItem(Icons.home, 'Home', 0),
                _buildNavItem(Icons.map, 'Map', 1),
                _buildNavItem(Icons.search, 'Find Donors', 2),
                _buildNavItem(Icons.person, 'Profile', 3),
                _buildNavItem(Icons.settings, 'Settings', 4),
              ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.red : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.red : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
