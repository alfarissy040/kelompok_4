import 'package:flutter/material.dart';

const List<Widget> toggleItems = <Widget>[
  Text('Kode'),
  Text('Nama'),
  Text('Harga')
];

class ToggleButton extends StatefulWidget {
  final Function handleSelectItem;
  ToggleButton({required this.handleSelectItem});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  final List<bool> selectedItems = <bool>[true, false, false];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        isSelected: selectedItems,
        children: toggleItems,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedColor: Colors.white,
        fillColor: Colors.teal,
        constraints: const BoxConstraints(
          minHeight: 40.0,
          minWidth: 80.0,
        ),
        onPressed: (index) {
          for (int i = 0; i < selectedItems.length; i++) {
            selectedItems[i] = i == index;
          }
          widget.handleSelectItem(index);
        },
      ),
    );
  }
}
