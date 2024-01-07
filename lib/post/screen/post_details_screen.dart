import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import '../../app/widgets/text_widget.dart';
import '../../main/widget/main_app_bar_widget.dart';
import '../model/post_model.dart';

class PostDetailScreen extends StatelessWidget {
  final PostModel postModel;
  const PostDetailScreen({
    super.key,
    required this.postModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBarWidget(context, 'Open My Network'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24.0),
                    bottomRight: Radius.circular(24.0),
                  ),
                  child: Image.network(
                    "${postModel.image}",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * 0.35,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.0),
                        bottomRight: Radius.circular(24.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          Colors.black38,
                          Colors.black54,
                        ],
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 24,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: AppText(
                      isSelectableText: false,
                      strText: '${postModel.title}',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppText(
                isSelectableText: true,
                strText: parse("${postModel.content}").body!.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
