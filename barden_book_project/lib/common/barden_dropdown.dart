import 'package:flutter/material.dart';
import '../constants.dart';

class BardenDropdown extends StatefulWidget {
  const BardenDropdown({
    super.key,
    required this.items,
    required this.onItemSelected,
  });

  final List<String> items;
  final Function(String) onItemSelected;

  @override
  State<BardenDropdown> createState() => _BardenDropdownState();
}

class _BardenDropdownState extends State<BardenDropdown> {
  String? _selectedItem = "";

  @override
  void initState() {
    super.initState();
    _selectedItem = null;
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedItem,
          items: widget.items.map<DropdownMenuItem<String>>((String item) => DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: primaryFont.copyWith(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold)),
          )).toList(),
          onChanged: (String? newValue) {
            _selectedItem = newValue;
            widget.onItemSelected(newValue!);
          },
          dropdownColor: Colors.white,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
          style: primaryFont.copyWith(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}
