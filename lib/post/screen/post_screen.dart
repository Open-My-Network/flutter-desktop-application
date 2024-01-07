import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../bloc/post_bloc.dart';
import '../model/post_model.dart';
import '../widget/post_ui.dart';

Logger logger = Logger(
  printer: PrettyPrinter(),
);

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PostInitial) {
          logger.i("--- Post Service Initial State");
          BlocProvider.of<PostBloc>(context).add(ListPostItems());
        }
        if (state is PostLoading) {
          logger.d("--- Post Service Loading State ---");
          return (state).isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink();
        }
        if (state is PostSuccess) {
          logger.t("--- Post Service Success State ---");
          final List<PostModel> postModel = (state).postModel;
          return PostUi(
            postModel: postModel,
          );
        }
        if (state is PostError) {
          logger.e("--- Post Service Error State");

          final String error = (state).strError;
          logger.f(error);
          return Text(error);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
