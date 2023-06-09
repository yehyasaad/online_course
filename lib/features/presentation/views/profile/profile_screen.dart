import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutState.dart';
import 'package:online_course/features/presentation/views/translate.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ItemsProfileCourse {
  final String title;
  final double numOfTitle;
  final IconData iconData;

  ItemsProfileCourse(
      {required this.title, required this.iconData, required this.numOfTitle});
  static List<ItemsProfileCourse> listItems = [
    ItemsProfileCourse(
        title: userEntity.language != 'Arabic' ? Translation.Course1 :Translation.Course2,
        numOfTitle: 15,
        iconData: CupertinoIcons.chart_bar_square_fill),
    ItemsProfileCourse(
        title: userEntity.language != 'Arabic' ? Translation.Reviews1 :Translation.Reviews2, numOfTitle: 4.9, iconData: CupertinoIcons.star_fill),
    // ItemsProfileCourse(title: 'Videos',numOfTitle: 32, iconData: CupertinoIcons.videocam_fill),
  ];
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool dark = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutState>(builder: (context, state) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: Scaffold(
// appBar: MyAppBar(title: 'My Profile',),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: [
              HearderProfile(
                bioOrEnail:
                    userEntity.bio!=''?userEntity.bio:"During a typical development cycle, you test an app using flutter run ",
              ),
              SizedBox(height: 25.h,),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  children: [
                    const SizedBox(height: 20),
                    ...List.generate(
                        ProfileMenuModel.listData.length,
                        (index) => ProfileMenu(
                              data: ProfileMenuModel.listData[index],
                          isNotDark: true,
                            )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    }, listener: (context, state) {

    },);
  }

  Container buildContainer(BuildContext context,
      {required ItemsProfileCourse data}) {
    return Container(
      padding: EdgeInsets.all(4.r),
      height: 45.h,
      width: 130.w,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Icon(
            data.iconData,
            color: kWhiteColor,
            size: 16.r,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.numOfTitle.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: kWhiteColor),
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                data.title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: kWhiteColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class HearderProfile extends StatelessWidget {
  final String? bioOrEnail;
  bool? isSettingProfile=false;
  HearderProfile({Key? key, this.bioOrEnail, this.isSettingProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180.h,
          width: 1.sw,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 25.h),
                height: 150.h,
                width: 1.sw,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.r),
                        bottomRight: Radius.circular(15.r))),
                child: SizedBox(
                  width: 1.sw,
                  height: 35.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if(isSettingProfile!=null&&!userEntity.isTeacher)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              padding: EdgeInsets.all(5.r),
                              decoration: const BoxDecoration(
                                color: kWhiteColor,
                                shape: BoxShape.circle,
                              ),

                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.arrow_left,
                                  size: 24,
                                  color: kDBackGColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if(isSettingProfile==null&&userEntity.isTeacher)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          width: 40.w,
                          height: 40.w,
                          padding: EdgeInsets.all(5.r),
                          // decoration: const BoxDecoration(
                          //   color: kWhiteColor,
                          //   shape: BoxShape.circle,
                          // ),

                          // child: const Center(
                          //   child: Icon(
                          //     CupertinoIcons.arrow_left,
                          //     size: 24,
                          //     color: kDBackGColor,
                          //   ),
                          // ),
                        ),
                      ),
                      if(!userEntity.isTeacher)
                      Center(
                        child: Text(
                          isSettingProfile!=null?userEntity.language != 'Arabic' ? Translation.Settings1 :Translation.Settings2:userEntity.language != 'Arabic' ? Translation.Profile1 :Translation.Profile2,
                          textAlign: TextAlign.center,
                            style: GoogleFonts.cairo(color: Colors.white,fontSize: 18.spMin)
                        ),
                      ),
                      SizedBox(
                        width: 60.w,
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(bottom: 0, child: ProfilePic()),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(userEntity.name,style: GoogleFonts.cairo(color: Colors.black87,fontSize: 18.spMin,fontWeight: FontWeight.w500)),
              SizedBox(
                  width: 1.sw / 1.3,
                  child: Text(
                    bioOrEnail ?? '',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(color: Colors.grey[400],fontSize: 16.spMin),
                    maxLines: 2,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
