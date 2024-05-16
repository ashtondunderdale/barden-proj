import 'package:barden_book_project/constants.dart';
import 'package:flutter/material.dart';

class BardenActionBar extends StatelessWidget {
  BardenActionBar({super.key, 
  required this.onDashboardTap, 
  required this.onManageTap, 
  required this.onBooksTap, 
  required this.onSettingsTap,
  required this.activeAction});

  final VoidCallback onDashboardTap;
  final VoidCallback onManageTap;
  final VoidCallback onBooksTap;
  final VoidCallback onSettingsTap;

  String activeAction;

  @override
  Widget build(BuildContext context) => Container(
    width: 70,
    height: MediaQuery.sizeOf(context).height,
    decoration: BoxDecoration(
      color: bardenPurple,
    ),
    child: Column(
      children: [
        _ActionItem(
          text: "Dashboard",
          icon: Icons.dashboard,
          onTap: onDashboardTap,
          isActive: activeAction == "Dashboard",
        ),
        _ActionItem(
          text: "Manage",
          icon: Icons.manage_history,
          onTap: onManageTap,
          isActive: activeAction == "Manage"
        ),
        _ActionItem(
          text: "Books",
          icon: Icons.book,
          onTap: onBooksTap,
          isActive: activeAction == "Books"
        ),
        _ActionItem(
          text: "Settings",
          icon: Icons.settings,
          onTap: onSettingsTap,
          isActive: activeAction == "Settings"
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
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Tooltip(
            message: widget.text,
            child: Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                border: widget.isActive ? const Border(right: BorderSide(color: Colors.white, width: 4)) : null
              ),
              child: Icon(
                widget.icon,
                color: _isHovered ? Colors.white70 : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}