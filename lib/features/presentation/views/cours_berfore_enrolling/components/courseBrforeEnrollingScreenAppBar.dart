import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/views/main_home_screen/main_home_screen.dart';

Widget courseBrforeEnrollingScreenAppBar() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              SizedBox(width: 10.w,),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                    color: kLightColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                width: 65.w,
              ),
              Text(
                "Course Name",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.spMin,
                    color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}