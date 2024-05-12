import 'package:flutter/material.dart';

class CompanySearchField extends StatelessWidget {
  final TextEditingController controller;
  const CompanySearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              enabledBorder: borderStyle(),
              focusedBorder: borderStyle(),
              hintText: 'Company',
              hintStyle: const TextStyle(color: Colors.white70),
              border: borderStyle(),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder borderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1),
      borderRadius: BorderRadius.circular(16),
    );
  }
}

class ProductSearchField extends StatelessWidget {
  final TextEditingController controller;

  const ProductSearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              enabledBorder: borderStyle(),
              focusedBorder: borderStyle(),
              hintText: 'Product',
              hintStyle: const TextStyle(color: Colors.white70),
              border: borderStyle(),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder borderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
