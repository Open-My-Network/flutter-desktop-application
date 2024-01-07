import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_my_network_app/post/screen/post_details_screen.dart';

import '../model/post_model.dart';

class PostListWidget extends StatefulWidget {
  final List<PostModel> postModel;
  const PostListWidget({
    super.key,
    required this.postModel,
  });

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Adjust the duration as needed
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _animation.value,
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.0.w,
                  vertical: 12.0.h,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemCount: widget.postModel.length,
                itemBuilder: (ctx, index) {
                  final data = widget.postModel[index];
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(
                          postModel: data,
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(4.0.w),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4.w),
                              topLeft: Radius.circular(4.w),
                            ),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                "${data.image}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SelectableText(
                              "${data.title}",
                              style: TextStyle(
                                fontSize: 6.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
