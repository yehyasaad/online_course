import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/Theme/styles/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? color, backgroundColor, titleColor;
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
      this.leading,
      this.backgroundColor,
      this.titleColor})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: color ?? kDBackGColor),
      leading: isleading
          ? leading
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(3.r),
                  child: Icon(
                    Icons.arrow_back,
                    size: 30.spMax,
                  ),
                ),
              ),
            ),
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      title: title == null
          ? null
          : Text(
              title!,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
      centerTitle: true,
      actions: action,
    );
  }
}
