import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_my_network_app/post/bloc_category/category_bloc.dart';
import 'package:open_my_network_app/post/model/category_model.dart';

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
            child: BlocConsumer<CategoryBloc, CategoryState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is CategoryInitial) {
                  BlocProvider.of<CategoryBloc>(context).add(ListCategoryItems());
                  return SizedBox.shrink();
                }
                // if ( state is CategoryLoading && state.isLoading == true ){
                //   return CircularProgressIndicator();
                // } 
                if (state is CategoryError) {
                  return Text(state.strError);
                }
                if (state is CategorySuccess){
                  final List<CategoryModel> data = state.categoryModel;
                  return   ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                debugPrint(data[index].name.toString());
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SelectableText(
                    // data[index]["name"].toString(),
                    data[index].name.toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                );
              },
              itemCount: data.length,
            );
                }
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
