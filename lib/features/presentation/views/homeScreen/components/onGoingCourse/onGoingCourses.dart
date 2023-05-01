import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/data/models/DummyData.dart';

import 'components/onGoingCourseCard.dart';

class onGoingCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 3.h),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w),
          child: Row(
            children: [
              Text(
                "Ongoing Courses",
                style: TextStyle(
                    fontSize: 20.spMin,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(width: 124.w),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 17.spMin,
                    color: mixedColor,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 10.w),
          height: 138.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: coursesList.length,
            itemBuilder: (context, index) => onGoingCourseCard(
              course: coursesList[index],
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 10.w,
            ),
          ),
        ),
      ],
    );
  }
}