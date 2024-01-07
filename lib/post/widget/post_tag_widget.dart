import 'package:flutter/material.dart';

class PostTagWidget extends StatelessWidget {
  const PostTagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Social Media",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          Row(
            children: [
              Image.asset(
                "assets/social_site/linkedin.png",
                width: 50,
              ),
              Image.asset(
                "assets/social_site/instagram.png",
                width: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
