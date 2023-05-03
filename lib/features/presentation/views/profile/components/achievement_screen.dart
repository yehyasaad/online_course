import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/utils/data.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/views/depart_screen/components/course_screen.dart';
import 'package:online_course/features/presentation/views/depart_screen/depart_screen.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({Key? key}) : super(key: key);

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  String langValue = 'Front End';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(title: "Language"),
      appBar: MyAppBar(title: "Achievement",backgroundColor:kPrimaryColor ,color: Colors.white,titleColor: Colors.white,),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 20.h),
        child: buildColumn(),
      ),
    );
  }
  Widget buildColumn() {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, left: 15.w, right: 15.w),
      child: ListView(
        children: [
          ...List.generate(
              Department1.departments.length,
                  (index) => FeatureItem(
                data: Department1.departments[index],
                width: 1.sw,
                height: 170,
                onTap: () {
                  Get.to(() => CoursesScreen(
                      department: Department1.departments[index]));
                },
              )),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
