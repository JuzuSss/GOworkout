// ignore_for_file: use_full_hex_values_for_flutter_colors, constant_identifier_names

import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff141416);
Color kPrimary8 = Color(0xffF6F6F6).withOpacity(0.8);
Color kPrimary24 = Color(0xffFEFEFE).withOpacity(0.24);
Color kPrimary50 = Color(0xffFEFEFE).withOpacity(0.50);
Color kPrimary100 = Color(0xff2B2B2B);
const kSecondaryColor = Color(0xffFA4B03);

const kSecondaryBlue = Color(0xff3163AD);
const kBorderColor = Color(0xfff6f6f6);
Color kBlue50 = Color(0xff3E6AAB).withOpacity(0.50);
Color kBlue25 = Color(0xffE5EBF4);
Color kBlue80 = Color(0xff9FB4D5);
const kLightSecondaryColor = Color(0xffC3F0A8);
const kTertiaryColor = Color(0xff181818);
Color ksubtextColor = kTertiaryColor.withOpacity(0.6);
const kQuaternaryColor = Color(0xffFFFFFF);
const kGreyColor = Color(0xff848E99);
const kGreyColorLight = Color(0xffF6F6F6);
const kGreyColor3 = Color(0xffF5F6F4);
const kGreyColor4 = Color(0xff393939);
const kBlackColor2 = Color(0xff222222);
const kDarkGreyColor = Color(0xff535353);
const kDarkGreyColor2 = Color(0xff3A3A3C);
const kDarkGreyColor3 = Color(0xff2C2C2E);
const kDarkGreyColor4 = Color(0xff272727);
const kDarkGreyColor5 = Color(0xff2F2F2F);
const kInputBorderColor = Color(0xff5C5A5B);
const kBottomNavColor = Color(0xff0A0A0A);
const kBottomNavBorderColor = Color(0xff1C1C1C);
const kUnSelectedColor = Color(0xff505050);
const kErrorColor = Color(0xffFF0000);
const kPurpleColor = Color(0xff5E5498);
const kBlueColor = Color(0xff006FFF);
const kLightPurpleColor = Color(0xffF4F2FF);

const kBlackColor = Color(0xff121C30);
const kBlackColor1 = Color(0xff909090);
const KPurpleColor = Color(0xff9662F1);

const kTextColor2 = Color(0xff1B2030);
const kTextColor3 = Color(0xff090B2F);
const kTextColor4 = Color(0xff31383C);
const kTextColor5 = Color(0xff62686B);
const kGrey1Color = Color(0xffF2F3F4);
const kGrey2Color = Color(0xffF7F7F6);
const kGrey3Color = Color(0xffEFEFF4);
const kGrey4Color = Color(0xffC8C7CC);
const kGrey5Color = Color(0xff8A8A8F);
const kGrey8Color = Color(0xff4E515E);
const kGrey10Color = Color(0xff1B2030);
const kInputBgColor = Color(0xffFAFAFA);
const kHintColor = Color(0xffB3B5BA);
const kInputTextColor = Color(0xff020719);
const kToggleButtonShadow = Color(0xffEFF3F8);

const kBorder2Color = Color(0xff675A55);
const kSeoulColor = Color(0xffF9F9F9);
const kGreenColor = Color(0xff21CA6F);
const kRedColor = Color(0xffDC1010);
const kYellowColor = Color(0xffFFC121);
const kRatedColor = Color(0xffFFC000);
const kPlaceHolderColor = Color(0xff939393);
const kCustomButtonColor = Color(0xffD0FD3E);
const kCardBg = Color(0xff242424);
const kcircleavatar = Color(0xff2C2C2E);
const kcustomcontiner = Color(0xff242424);
const kcustomcheckbox = Color(0xff535353);
const kcustombackbutton = Color(0xff3A3A3C);
const kBottomNavSelected = Color(0xffD0FD3E);
const kBottomNavUnselected = Color(0xff505050);
const grey1Color = Color(0xff7F7F7F);
const kBlack2Color = Color(0xff272727);
const kBlack3Color = Color(0xff0D0D0D);
const kBlackTxtField = Color(0xff181818);
const kGreyBorderColor = Color(0xff2C2C2C);
const kGreyBorderColor1 = Color(0xff333333);
const kGreyBorderColor2 = Color(0xff383838);
const kGreyTxtColor = Color(0xff747487);
const ktransparent = Colors.transparent;

const kchooseblue = Color(0xff52678F);
const kchoosebrown = Color(0xff9C8456);
const LinearGradient brownwhite = LinearGradient(
  colors: [
    Color(0xffF6EED0),
    kPrimaryColor, // Start color
    Color(0xffF6EED0),
    // End color
  ],
  stops: [0.2, 0.8, 1], // Adjust stops to control color portions
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

LinearGradient blacktrans(double? value) => LinearGradient(
  colors: [
    ktransparent,
    ktransparent,
    Color.fromARGB(137, 255, 255, 255),
    Color.fromARGB(255, 242, 242, 242).withOpacity(0.0),
    //  kSecondaryColor.withOpacity(value ?? 0.01),ktransparent,
    ktransparent,
    // End color
  ],
  stops: [0.0, 0.25, 0.74, 0.9, 1],
  // Adjust stops to control color portions
  begin: Alignment.topCenter,
  end: Alignment.bottomLeft,
);

LinearGradient bggrad() => LinearGradient(
  colors: [
    const Color.fromARGB(50, 250, 73, 3),
    ktransparent,

    // End color
  ],

  // Adjust stops to control color portions
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
LinearGradient LIGHTBLUE() => LinearGradient(
  colors: [
    Color(0xffCBF6FF),
    Color(0xff95D4FF),

    // End color
  ],

  // Adjust stops to control color portions
  begin: Alignment.centerRight,
  end: Alignment.centerLeft,
);
LinearGradient bggradOpacity() => LinearGradient(
  colors: [
    Color(0xffFCA216),
    Color(0xffF37021),

    // End color
  ],

  // Adjust stops to control color portions
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
LinearGradient transparenbluegrad() => LinearGradient(
  colors: [
    kSecondaryBlue,
    const Color.fromARGB(0, 49, 99, 173),
    // ktransparent,
    // End color
  ],

  // Adjust stops to control color portions
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
