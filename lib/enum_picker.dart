// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EnumPicker<T extends Enum> extends StatefulWidget {
  const EnumPicker({required this.values, super.key});

  final List<T> values;

  Future<T?> view(BuildContext context) async => await showModalBottomSheet<T>(
    context: context,
    builder: (context) => this,
    enableDrag: true,
  );

  @override
  State<EnumPicker<T>> createState() => _EnumPickerState<T>();
}

class _EnumPickerState<T extends Enum> extends State<EnumPicker<T>> {
  late T? value = widget.values.first;

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.white,

    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: CupertinoPicker.builder(
            childCount: widget.values.length,
            itemExtent: 40,
            onSelectedItemChanged: (index) {
              value = widget.values[index];
            },
            itemBuilder: (context, index) =>
                Center(child: Text(widget.values[index].toString())),
          ),
        ),
        SafeArea(
          top: false,

          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(value),
                child: const Text('Select'),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
