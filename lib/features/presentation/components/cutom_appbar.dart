import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/Theme/styles/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? color;
  final bool isleading;
  final Widget? leading;

  final List<Widget>? action;

  @override
  final Size preferredSize;
  MyAppBar(
      {Key? key,
      this.title,
      this.action,
      this.color,
      this.isleading = false,
      this.leading})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: color ?? kDBackGColor),
      leading: isleading
          ? leading
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
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
                    size: 24,
                  ),
                ),
              ),
            ),
      backgroundColor: color ?? Colors.transparent,
      elevation: 0,
      title: title == null
          ? null
          : Text(
              title!,
              style: GoogleFonts.cairo(
                  fontSize: 20.sp, fontWeight: FontWeight.w400,color: Colors.black87),
            ),
      centerTitle: true,
      actions: action,
    );
  }
}
