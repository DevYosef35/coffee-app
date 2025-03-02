import 'package:flutter/material.dart';

class ChipWidget extends StatefulWidget {
  const ChipWidget(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onSelected});

  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  @override
  State<ChipWidget> createState() => _CustomChipState();
}

class _CustomChipState extends State<ChipWidget> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
        label: Text(widget.label),
        selected: widget.isSelected,
        onSelected: widget.onSelected);
  }
}
