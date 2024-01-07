import 'package:flutter/material.dart';

class PostSearchWidget extends StatelessWidget {
  const PostSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
