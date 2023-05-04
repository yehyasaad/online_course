import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/views/sign_in/sign_in_screen.dart';
import 'package:online_course/features/presentation/views/sign_up/sign_up_screen.dart';

class SingScreen extends StatelessWidget {
  const SingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  "assets/images/logoColo.png",
                  height: 60.h,
                  width: 100.w,
                ),
                Text(
                  "KR LEARNING",
                  style:GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headline6,
                    color: mixedColor,
                    fontSize: 28.spMin,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(flex: 2),
                Image.asset(
                  "assets/images/boardermain.png",
                  height: 265.h,
                  width: 235.w,
                ),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(1.sw, 50),
                      maximumSize: Size(1.sw, 50),
                      foregroundColor: kLightBgColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r),),
                    ),
                    onPressed: () {
                      Get.to(() => const SignInScreen());
                    },
                    child: const Text('Sign In ')),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(1.sw, 50),
                      maximumSize: Size(1.sw, 50),
                      backgroundColor: kPrimaryFadeTextColor.withOpacity(0.3),
                      foregroundColor: kDBackGColorLight,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r),),

                    ),
                    onPressed: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: const Text('Sign Up ')),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
