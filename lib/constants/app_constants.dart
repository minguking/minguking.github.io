import 'package:flutter/material.dart';

class KKFont {
  static const String pretendardBlack = 'PretendardBlack';
  static const String pretendardBold = 'PretendardBold';
  static const String pretendardExtraBold = 'PretendardExtraBold';
  static const String pretendardMedium = 'PretendardMedium';
  static const String pretendardRegular = 'PretendardRegular';
  static const String pretendardSemiBold = 'PretendardSemiBold';
  static const String appleSDGothicNeoMedium = 'AppleSDGothicNeoMedium';
}

class KKColor {
  static const Color grey = Color(0xff555555);
  static const Color lightGrey = Color(0xffDEDEDE);
  static const Color secondaryGrey = Color(0xff848484);
  static const Color purple = Color(0xff004A9F);
  static const Color lightPurple = Color(0xffF0F8FF);
  static const Color defaultDividerColor = Color(0xffF7F7F7);
  static const Color darkGrey = Color(0xff333333);
  static const Color surfaceDim = Color(0xffFCFDFF);

  static const Color predictionSelectedBodyColor = Color(0xffEFF8FF);

  static const Color predictionCorrectGreenBodyColor = Color(0xffDFFAEA);
  static const Color predictionCorrectGreenBorderColor = Color(0xff109560);
  static const Color predictioninCorrectGreyBodyColor = Color(0xffE8E8E8);
  static const Color predictioninCorrectRedBorderColor = Color(0xffC81319);
  static const Color predictionActualWinnerBodyColor = Color(0xffDFFAEA);
  static const Color predictionWinnerColor = Color(0xff109560);
  static const Color correctGreenIconColor = Color(0xff02BA4C);
}

enum ToastType {
  complete, edit, cancel, error
}