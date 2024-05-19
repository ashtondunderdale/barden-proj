import 'package:flutter/material.dart';

class BardenDropdown extends StatefulWidget {
  const BardenDropdown({super.key, required this.items, required this.onItemSelected});

  final List<String> items;
  final Function(String) onItemSelected;

  @override
  State<BardenDropdown> createState() => _BardenDropdownState();
}

class _BardenDropdownState extends State<BardenDropdown> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.items.isNotEmpty ? widget.items[0] : null;
  }

  @override
  Widget build(BuildContext context) => DropdownButton<String>(
    value: _selectedItem,
    items: widget.items.map<DropdownMenuItem<String>>((String item) => DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      )).toList(),
    onChanged: (String? newValue) {
      setState(() {
        _selectedItem = newValue;
        widget.onItemSelected(_selectedItem!);
      });
    },
  );
}

