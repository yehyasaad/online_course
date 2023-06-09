import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:online_course/features/data/models/courseEnroll_model.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/allCoursesRecomenedCourses/allCoursesRecomenedCoursesScreen.dart';
import 'package:online_course/features/presentation/views/lesson/lessonScreen.dart';

import 'components/onGoingCourseCard.dart';

class onGoingCourses extends StatelessWidget {
  final List<CourseEnrollModel> courseEnrollModel;

  const onGoingCourses({super.key, required this.courseEnrollModel});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3.h),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: 16.w, bottom: 10.h, top: 10.h),
            child: Text(
              userEntity.language == 'Arabic'
                  ? "الكورسات الجارية"
                  : "Ongoing Courses",
              style: TextStyle(
                  fontSize: 20.spMin,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 10.w),
            height: 138.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: courseEnrollModel.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  LayoutCubit.get(context).changeIndexVideoLesson(-1);
                  Get.to(LessonScreen(
                    courseId: courseEnrollModel[index].courseId,
                    mainCategory: courseEnrollModel[index].mainCategory,
                    name: courseEnrollModel[index].name,
                    previewVideo: courseEnrollModel[index].previewVideo,
                    subCategory: courseEnrollModel[index].subCategory,
                  ));
                },
                child: onGoingCourseCard(
                  course: courseEnrollModel[index],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: 10.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
