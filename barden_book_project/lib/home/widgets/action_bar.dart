import 'package:barden_book_project/constants.dart';
import 'package:flutter/material.dart';

class BardenActionBar extends StatelessWidget {
  const BardenActionBar({super.key, required this.onDashboardTap, required this.onManageTap, required this.onBookTap, required this.onSettingsTap});

  final VoidCallback onDashboardTap;
  final VoidCallback onManageTap;
  final VoidCallback onBookTap;
  final VoidCallback onSettingsTap;

  @override
  Widget build(BuildContext context) => Container(
    width: 80,
    height: 240,
    decoration: BoxDecoration(
      color: bardenPurple,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Column(
      children: [
        _ActionItem(
          text: "Dashboard",
          icon: Icons.dashboard,
          onTap: onDashboardTap,
          isActive: false,
        ),
        _ActionItem(
          text: "Manage",
          icon: Icons.manage_history,
          onTap: () {/* Handle onTap for Manage */},
          isActive: false,
        ),
        _ActionItem(
          text: "Books",
          icon: Icons.book,
          onTap: () {/* Handle onTap for Books */},
          isActive: false,
        ),
        _ActionItem(
          text: "Settings",
          icon: Icons.settings,
          onTap: () {/* Handle onTap for Settings */},
          isActive: false,
        ),
      ],
    ),
  );
}

class _ActionItem extends StatefulWidget {
  const _ActionItem({
    required this.text,
    required this.icon,
    required this.onTap,
    required this.isActive,
  });

  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;

  @override
  __ActionItemState createState() => __ActionItemState();
}

class __ActionItemState extends State<_ActionItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true ),
      onExit: (_) => setState(() => _isHovered = false ),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              border: widget.isActive ? const Border(right: BorderSide(color: Colors.white)) : null
            ),
            child: Icon(
              widget.icon,
              color: _isHovered ? Colors.white70 : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
