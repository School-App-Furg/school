import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelect extends StatefulWidget {
  final String buttonText;
  final String title;
  final List<MultiSelectItem<dynamic>> items;
  final Function(List<dynamic>) onConfirm;
  const MultiSelect(
      {Key? key,
      required this.buttonText,
      required this.title,
      required this.items,
      required this.onConfirm})
      : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MultiSelectDialogField(
        buttonText: Text(widget.buttonText),
        title: Text(widget.title),
        cancelText: Text("CANCELAR"),
        items: widget.items,
        listType: MultiSelectListType.CHIP,
        chipDisplay: MultiSelectChipDisplay(),
        onConfirm: widget.onConfirm,
      ),
    );
  }
}
