import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/domain/entities/courses.dart';
import 'package:online_course/features/presentation/components/custom_image.dart';
import 'package:online_course/features/presentation/views/homeScreen/components/starsRating.dart';

class AllCoursesRecomenedCoursesScreenCourseCard extends StatelessWidget {
  final Course courseModel;
  const AllCoursesRecomenedCoursesScreenCourseCard({
    Key? key,
    required this.courseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 4.0.r,
            spreadRadius: .05.r,
          ),
        ],
      ),
      child: Column(
        children: [
          CustomImage(
            courseModel.image,
            isNetwork: true,
            width: 200.w,
            height: 105.h,
            radius: 15,
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 7.w,
              ),
              SizedBox(
                width: 150.w,
                child: Text(
                  courseModel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14.5.spMin,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 22.w,
              ),
              Text(
                "${courseModel.numberOfLessons} Lessons",
                style: TextStyle(
                    fontSize: 12.spMin,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 153, 151, 151)),
              ),
              SizedBox(
                width: 10.h,
              ),
              starsRating(rating: 3),
            ],
          ),
        ],
      ),
    );
  }
}
