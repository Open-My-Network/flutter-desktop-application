import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            itemCount: 15,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/home/one.jpg"),
                    ),
                  ),
                  child: const Text("Hello"),
                ),
              );
            },
            options: CarouselOptions(
              height: 350,
              aspectRatio: 16 / 9,
              initialPage: 1,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 12.w,
          ),
          Text(
            "Chapter - 1",
            style: TextStyle(
              fontSize: 6.w,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 80.w,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.0.w,
                      vertical: 6.h,
                    ),
                    child: SizedBox(
                      width: 80.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.w),
                            child: Image.asset(
                              "assets/home/one.jpg",
                              width: 80.w,
                              height: 50.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Introduction to the chapter of LEEP",
                            style: TextStyle(
                              fontSize: 6.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
