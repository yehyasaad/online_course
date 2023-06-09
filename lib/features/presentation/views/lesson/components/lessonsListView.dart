import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/data/models/lesson_model.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';

import 'lessonCard.dart';

Widget lessonsListView(
    {required List<LessonModel> lessonModel,
    required String subCategory,
    required String mainCategory}) {
  return Directionality(
    textDirection:
        userEntity.language == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Text(
              userEntity.language == 'Arabic' ? "كل الدروس" : "All Lessons",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22.spMin,
                  color: Colors.black),
            ),
          ],
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 22.w, end: 22.w, top: 10.h),
          height: 365.h,
          width: 330.w,
          child: ListView.separated(
            padding: EdgeInsetsDirectional.zero,
            physics: BouncingScrollPhysics(),
            itemCount: lessonModel.length,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                LayoutCubit.get(context).changeIndexVideoLesson(index);
                LayoutCubit.get(context).setSeenLesson(
                    mainCategory: mainCategory,
                    courseId: lessonModel[index].courseId,
                    lessonId: lessonModel[index].lessonId,
                    subCategory: subCategory);
              },
              child: lessonCard(
                lesson: lessonModel[index],
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
          ),
        ),
      ],
    ),
  );
}
