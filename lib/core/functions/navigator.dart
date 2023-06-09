import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_course/features/data/models/courses_model.dart';
import 'package:online_course/features/domain/entities/user.dart';

import '../../features/domain/entities/courses.dart';

void navigatePop(
  BuildContext context,
) {
  Navigator.of(context).pop();
}

void navigateAndRemove(
  BuildContext context,
  String routeName, {
  dynamic? arguments,
}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    routeName,
    arguments: arguments,
    (route) => false,
  );
}
void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) => false,
    );

Future<Object?> navigateTo(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) {
  return Navigator.of(context).pushNamed(
    routeName,
    arguments: arguments,
  );
}

void navigateAndReplace(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) {
  Navigator.of(context).pushReplacementNamed(
    routeName,
    arguments: arguments,
  );
}
void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ChooseToastColor(state),
        textColor: Colors.black87,
        fontSize: 16.0);

enum ToastStates {SUCCESS,ERROR,WARNING}
Color ChooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
Codec<String, String> stringToBase64Url = utf8.fuse(base64);
String? uid;
String? profilePicMe;

String updateNam = '';
String updateSta = '';
bool ismessageController = false;
int intmessageController = 0;

final List<Transition> transition = [
  Transition.zoom,
  Transition.fade,
  Transition.size,
  Transition.circularReveal,
  Transition.cupertino,
  Transition.fadeIn,
  Transition.leftToRight,
  Transition.downToUp,
  Transition.topLevel,
];

List<String> newSeenMessage = [];

List<String> seenMessageNumber = [];
UserEntity userEntity = UserEntity(
  name: 'UserName',
  uId: '',
  bio: '',
  profilePic: '',
  language: 'English',
  theme: 'Light',
  wallpaper: '',
  token: '',
  email: '',
  password: '',
  courseEnroll: [],isTeacher: false
);
List<int> sub = [0, 0];
List<CoursesModel> teacherCourseslist=[];

String id='';
Course? coursesModelC;
bool isLike=false;

