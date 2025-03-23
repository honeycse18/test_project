import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(icon: Icons.home, label: 'HOME', isSelected: true),
          NavBarItem(icon: Icons.group, label: 'CIRCLES'),
          NavBarItem(icon: Icons.notifications, label: 'NOTIFICATION'),
          NavBarItem(icon: Icons.settings, label: 'SETTINGS'),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  NavBarItem({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSelected ? Color(0xFF00C4B4) : Colors.grey,
          size: 24,
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Color(0xFF00C4B4) : Colors.grey,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
