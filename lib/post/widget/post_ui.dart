import 'package:flutter/material.dart';

import '../model/post_model.dart';
import 'post_category_widget.dart';
import 'post_list_widget.dart';
import 'post_search_widget.dart';
import 'post_tag_widget.dart';

class PostUi extends StatelessWidget {
  final List<PostModel> postModel;
  const PostUi({
    super.key,
    required this.postModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // left side of post screen
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          child: const Column(
            children: [
              PostSearchWidget(),
              PostCategoryWidget(),
              PostTagWidget(),
            ],
          ),
        ),

        // right side of main screen
        PostListWidget(postModel: postModel),
      ],
    );
  }
}
