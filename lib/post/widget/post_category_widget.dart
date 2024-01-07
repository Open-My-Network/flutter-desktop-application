import 'package:flutter/material.dart';

import '../utils/list_of_category.dart';

class PostCategoryWidget extends StatelessWidget {
  const PostCategoryWidget({super.key});

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
            child: SelectableText(
              "Category",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SelectableText(
                    categoryList[index],
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                );
              },
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
