import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText!.isNotEmpty)
            Text(
              labelText!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          TextField(
            controller: controller,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(borderSide: BorderSide()),
            ),
          ),
        ],
      ),
    );
  }
}
