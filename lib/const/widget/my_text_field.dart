import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 46,
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Search by Ingredients name',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black87, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black87, width: 1),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}