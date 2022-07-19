import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonColors {
  CommonColors._();

  static bool _isDark = false;

  static refreshIsDark(bool isDark) {
    _isDark = isDark;
  }

  static MaterialColor get primary => _isDark
      ? const MaterialColor(
          0xFF2E8867,
          <int, Color>{
            50: Color(0xFFE6F1ED),
            100: Color(0xFFC0DBD1),
            200: Color(0xFF97C4B3),
            300: Color(0xFF6DAC95),
            400: Color(0xFF4D9A7E),
            500: Color(0xFF2e8867),
            600: Color(0xFF29805F),
            700: Color(0xFF237554),
            800: Color(0xFF1D6B4A),
            900: Color(0xFF125839),
          },
        )
      : const MaterialColor(
          0xFF43c494,
          <int, Color>{
            50: Color(0xFFe8f8f2),
            100: Color(0xFFc7eddf),
            200: Color(0xFFa1e2ca),
            300: Color(0xFF7bd6b4),
            400: Color(0xFF5fcda4),
            500: Color(0xFF43c494),
            600: Color(0xFF3dbe8c),
            700: Color(0xFF34b681),
            800: Color(0xFF2caf77),
            900: Color(0xFF1ea265),
          },
        );

  static MaterialColor get secondary => _isDark
      ? const MaterialColor(
          0xFFB27F35,
          <int, Color>{
            50: Color(0xFFF6F0E7),
            100: Color(0xFFE8D9C2),
            200: Color(0xFFD9BF9A),
            300: Color(0xFFC9A572),
            400: Color(0xFFBE9253),
            500: Color(0xFFB27F35),
            600: Color(0xFFAB7730),
            700: Color(0xFFA26C28),
            800: Color(0xFF996222),
            900: Color(0xFF8A4F16),
          },
        )
      : const MaterialColor(
          0xFFffb74d,
          <int, Color>{
            50: Color(0xFFfff6ea),
            100: Color(0xFFffe9ca),
            200: Color(0xFFffdba6),
            300: Color(0xFFffcd82),
            400: Color(0xFFffc268),
            500: Color(0xFFffb74d),
            600: Color(0xFFffb046),
            700: Color(0xFFffa73d),
            800: Color(0xFFff9f34),
            900: Color(0xFFff9025),
          },
        );

  static Color get randomColor => Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

  static Color get backgroundColor =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFF4F7FA);

  static Color get foregroundColor =>
      _isDark ? const Color(0xFF1D2124) : const Color(0xFFFFFFFF);

  static Color get disableColor =>
      _isDark ? const Color(0xFF969EA4) : const Color(0xFFD8E3EB);

  static Color get divider =>
      _isDark ? const Color(0xFF333333) : const Color(0xFFF4F4F4);
  static const Color appbarIconColor = Color(0xFF9BA6AE);

  ///text
  static const Color hintErrorTextColor = Color(0xFFF17D7D);

  static Color get onPrimaryTextColor =>
      _isDark ? const Color(0xFFdddddd) : const Color(0xFFFFFFFF);

  static Color get onSurfaceTextColor =>
      _isDark ? const Color(0xFFdddddd) : const Color(0xFF333333);

  static Color get textColor666 =>
      _isDark ? const Color(0xFF999999) : const Color(0xFF666666);

  static Color get textColor999 =>
      _isDark ? const Color(0xFF666666) : const Color(0xFF999999);

  static Color get textColorDDD =>
      _isDark ? const Color(0xFF333333) : const Color(0xFFDDDDDD);

  ///write
  static const Color writeTextFieldBgColor = Color(0xFFF7F8FA);
  static const Color writeAlphaGreenBgColor = Color(0xFFF5FFF5);
  static const Color writeButtonGreenBgColor = Color(0xFF5ED9AB);
  static const Color writeButtonBorderLineColor = Color(0xFFCCCCCC);

  ///keyboard
  static Color get keyboardBarBg =>
      _isDark ? const Color(0xFF1D2124) : const Color(0xFFF1F1F1);
  static const Color keyboardPressBgColor = Color(0x66c8c8c8);

  ///dialog
  static const Color dialogConfirmBtnTextColor = Color(0xFFFDBB46);
  static const Color dialogCancelBtnTextColor = Color(0xFF9BA6AE);

  /// 考研写作
  static Color get writingCataloguePreview =>
      _isDark ? const Color(0xFF66615B) : const Color(0xFFEAF0F7);

  static Color get writingCatalogueBgColor =>
      _isDark ? const Color(0xFF3B4866) : const Color(0xFF95B6FF);

  static Color get writingOnPrimaryTextColor =>
      _isDark ? const Color(0xFF999999) : const Color(0xFFFFFFFF);

  static Color get writingOnSurfaceTextColor =>
      _isDark ? const Color(0xFF999999) : const Color(0xFF333333);
  static const Color writing_catalogue_icon_color1 = Color(0xFFFFC634);
  static const Color writing_catalogue_icon_color2 = Color(0xFF5C9CFF);
  static const Color writing_catalogue_icon_color2_2 = Color(0xFF9C77FF);
  static const Color writing_catalogue_icon_color3 = Color(0xFFFFA376);
  static const Color writing_catalogue_icon_color4 = Color(0xFF9D8CFC);
  static const Color writing_catalogue_icon_grey = Color(0xFFFBFBFBF);
  static const Color writing_catalogue_discuss_bg = Color(0xFF3A83F5);
  static const Color writing_catalogue_guide_bg = Color(0xFF333333);

  ///progress
  static Color get progressBackgroundColor =>
      _isDark ? const Color(0xFF1D2124) : const Color(0xFFDADADA);

  static Color get progressBufferColor =>
      _isDark ? const Color(0xFF1D2124) : const Color(0xFFE4EAF0);
  static const Color progressRedColor = Color(0xFFFF6F6F);
  static const Color progressYellowColor = Color(0xFFFFC94A);

  ///button
  static Color get whiteBtnBorderColor =>
      _isDark ? const Color(0xFF333333) : const Color(0xFFCCCCCC);

  static Color get redBtnBgColor =>
      _isDark ? const Color(0xFF641C20) : const Color(0xFFFA4751);

  ///video
  static const Color videoPlayedColor = Color(0xFF69A4FF);
  static const Color videoHandleColor = Color(0xFFFFFFFF);
  static const Color videoBufferedColor = Color(0xFFd8e3eb);
  static const Color videoBackgroundColor = Color(0xFFD8D8D8);
  static const Color videoFullScreenTitleText = Color(0xFFDDDDDD);
  static const Color videoFullScreenBtnText = Colors.white;
  static const Color videoActionBtnText = Color(0xFF666666);
  static const Color videoActionTitleText = Color(0xFF999999);

  ///course introduce
  static const Color introduceFinalPriceColor = Color(0xFFFA4751);
  static const Color introduceTimeColor = Color(0xFFFFB74D);

  ///exhibition
  static const Color exhibitionClassHourBgColor = Color(0xFFDCFFF3);
  static const Color exhibitionTagBgColor = Color(0x66000000);
  static const Color exhibitionPromotionColor = Color(0xFFFFB74D);
  static const Color exhibitionDescTxtColor = Color(0xFFB5B5B5);

  ///course order
  static const Color courseOrderRefundGreenColor = Color(0xFF05BF8D);

  ///evaluation
  static const Color unLightStar = Color(0xFFDDDDDD);
  static const Color lightStar = Color(0xFFFFB74D);

  static const Color payGradientStartColor = Color(0xFFffad4d);
  static const Color payGradientEndColor = Color(0xFFff942a);

  ///star
  static const Color star = Color(0xFFB5B5B5);

  ///writing high button color
  static const Color writingHighButtonColor = Color(0xFFF4F4F4);

  static Color get writingHighProgressGreenBg =>
      _isDark ? const Color(0xFF2E8867) : const Color(0xFFDCFFF3);
  static const Color writingHighProgressGreenText = Color(0xFF05BF8D);
  static const Color writingHighProgressGreyBg = Color(0xFFF4F4F4);
  static const Color writingHighProgressGreyText = Color(0xFF9BA6AE);

  static Color get writingHighStudyAreaBasicStart =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFE8FCFF);

  static Color get writingHighStudyAreaBasicEnd =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFEBF0FF);

  static Color get writingHighStudyAreaAdvanceStart =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFFFF8E9);

  static Color get writingHighStudyAreaAdvanceEnd =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFFFF1E5);

  static Color get roundRectangleIconBgColor =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFEBF2F8);

  ///listening
  static const Color listeningPrimaryColor = const Color(0xFF6758FF);

  static Color get listeningStatusBarColor =>
      _isDark ? const Color(0xFF3C2F76) : const Color(0xFF7C65FF);

  static Color get listeningBgColor1 =>
      _isDark ? const Color(0xFF3C2F76) : const Color(0xFF6D67FF);

  static Color get listeningBgColor2 =>
      _isDark ? const Color(0xFF3C2F76) : const Color(0xFF9262FF);

  static Color get listeningStatisticsLineColor =>
      _isDark ? const Color(0xFF333333) : const Color(0xFFD8E3EB);

  static Color get listeningPlayerBg1 =>
      _isDark ? const Color(0xFF2D343E) : Colors.white;

  static Color get listeningPlayerBg2 =>
      _isDark ? const Color(0xFF22282C) : const Color(0xFFF5F7F9);

  static Color get choiceBgNoDo =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFF7F8FA);

  static Color get choiceBgSelect =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFFFFFFF);

  static Color get choiceBgRight =>
      _isDark ? const Color(0xFF2E8867) : const Color(0xFFE2FCF0);

  static Color get choiceBgWrong =>
      _isDark ? const Color(0xFF641C20) : const Color(0x1AFA4751);

  static Color get choiceTextRight =>
      _isDark ? onPrimaryTextColor : const Color(0xFF33CF85);

  static Color get choiceTextWrong =>
      _isDark ? onPrimaryTextColor : Color(0xFFFA4751);
  static const Color listeningHomeTaskColor = Color(0xFFFA4751);
  static const Color listeningCircleAlphaFullColor = Color(0xFFF9CCFF);
  static const Color listeningExamItemIconBg1 = Color(0xFFEFF0FF);
  static const Color listeningExamItemIconBg2 = Color(0xFFFFDECD);
  static const Color listeningExamItemIconBg3 = Color(0xFFD4EEFF);

  static Color get listeningBtnColor1 =>
      _isDark ? secondary : const Color(0xFFFFDA77);

  static Color get listeningBtnColor2 =>
      _isDark ? secondary : const Color(0xFFFF856B);
  static const Color listeningResultWrong = Color(0xFFFF6069);

  static Color get listeningSectionBg =>
      _isDark ? const Color(0xFF1D2124) : const Color(0xFFF9FAFC);

  static Color get listeningFullArticleSectionBg =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFF9FAFC);

  ///gradient
  static Color get barViewDarkYellowColor =>
      _isDark ? secondary : Color(0xFFFFA984);

  static Color get barViewLightYellowColor =>
      _isDark ? secondary : Color(0xFFFFEEC2);
  static const Color circleViewDarkPurpelColor = Color(0xFF8477FF);
  static const Color circleViewLightPurpelColor = Color(0xFFC179FF);

  static Color get primaryGradientColor1 =>
      _isDark ? primary : const Color(0xFF45DC94);

  static Color get primaryGradientColor2 =>
      _isDark ? primary : const Color(0xFF3CD39B);

  static Color get secondaryGradientColor1 =>
      _isDark ? secondary : const Color(0xFFFFDC84);

  static Color get secondaryGradientColor2 =>
      _isDark ? secondary : const Color(0xFFFFB74D);

  static Color get todayDataTopBg1 =>
      _isDark ? const Color(0xFF2D343E) : const Color(0xFF45DC94);

  static Color get todayDataTopBg2 =>
      _isDark ? const Color(0xFF22282C) : const Color(0xFF3CD39B);

  ///switch
  static const Color switchOnColor = Color(0xFF2E8867);

  ///detailed
  static const Color detailedCurSecondColor = Color(0xFF69CBFF);
  static const Color detailedCurThridColor = Color(0xFF8E59F8);
  static const Color detailedCurFourColor = Color(0xFFFD6B4B);

  static Color get calendarAfterTodayColor =>
      _isDark ? const Color(0xFF666666) : const Color(0xFFDDDDDD);

  ///bar
  static Color get shallowGreenColor =>
      _isDark ? const Color(0xFF213933) : const Color(0xFFD9F3EA);

  static Color get lightGreenColor =>
      _isDark ? const Color(0xFF265B49) : const Color(0xFF94EAC3);

  static Color get homeStatisticsLineColor =>
      _isDark ? const Color(0xFF666666) : const Color(0xFFD8E3EB);

  static Color get homeStatisticsStrokeLineColor =>
      _isDark ? const Color(0xFF2E8867) : const Color(0xFF43C494);

  ///punch_calendar
  static Color get punchCalendarGradientColor1 =>
      _isDark ? const Color(0xFF2D343E) : const Color(0xFF48EFB0);

  static Color get punchCalendarGradientColor2 =>
      _isDark ? const Color(0xFF22282C) : const Color(0xFF45D1B1);

  static Color get homeStatisticsPieUnknowColor => _isDark
      ? const Color(0xFFD8E3EB).withOpacity(0.7)
      : const Color(0xFFD8E3EB);

  static Color get homeStatisticsPieFm1Color => _isDark
      ? const Color(0xFF43C494).withOpacity(0.7)
      : const Color(0xFF43C494);

  static Color get homeStatisticsPieFm2Color => _isDark
      ? const Color(0xFF69CBFF).withOpacity(0.7)
      : const Color(0xFF69CBFF);

  static Color get homeStatisticsPieFm3Color => _isDark
      ? const Color(0xFF8E59F8).withOpacity(0.7)
      : const Color(0xFF8E59F8);

  static Color get homeStatisticsPieFm4Color => _isDark
      ? const Color(0xFFFD6B4B).withOpacity(0.7)
      : const Color(0xFFFD6B4B);

  static Color get homeStatisticsPieFm5Color => _isDark
      ? const Color(0xFFFFB74D).withOpacity(0.7)
      : const Color(0xFFFFB74D);

  ///grammar
  static Color get grammarStudyItemSelectedColor =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFF3F6FD);

  static Color get grammarStudyItemBorderColor => _isDark
      ? const Color(0xFF000000).withOpacity(0.38)
      : const Color(0xFFD8E3EB).withOpacity(0.85);

  static Color get scheduleVlineColor =>
      _isDark ? const Color(0xFF333333) : const Color(0xFFF4F7FA);

  static Color get schedulePointColor =>
      _isDark ? const Color(0xFF4D6CB3) : const Color(0xFF6E9AFF);

  static Color get grammarPracticeDottedColor =>
      _isDark ? const Color(0xFF999999) : const Color(0xFFDDDDDD);

  static Color get grammarProgressBackgroundColor =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFF3F4F6);

  static Color get grammarScheduleProgressBackgroundColor =>
      _isDark ? const Color(0xFF1D2124) : const Color(0xFFDAE2F3);

  static Color get grammarProgressWrongColor =>
      _isDark ? const Color(0xFFB36049) : const Color(0xFFFFFF8968);

  static Color get grammarMyActiveIconColor =>
      _isDark ? const Color(0xFFB36049) : const Color(0xFFFE5064);

  static Color get grammarTextColor =>
      _isDark ? const Color(0xFF4D6CB3) : const Color(0xFF516091);

  static MaterialColor get grammarPrimaryColor => _isDark
      ? MaterialColor(0xFF4D6CB3, <int, Color>{
          50: Color(0xFFEAEDF6),
          100: Color(0xFFCAD3E8),
          200: Color(0xFFA6B6D9),
          300: Color(0xFF8298CA),
          400: Color(0xFF6882BE),
          500: Color(0xFF4D6CB3),
          600: Color(0xFF4664AC),
          700: Color(0xFF3D59A3),
          800: Color(0xFF344F9A),
          900: Color(0xFF253D8B)
        })
      : MaterialColor(0xFF6E9AFF, <int, Color>{
          50: Color(0xFFEEF3FF),
          100: Color(0xFFD4E1FF),
          200: Color(0xFFB7CDFF),
          300: Color(0xFF9AB8FF),
          400: Color(0xFF84A9FF),
          500: Color(0xFF6E9AFF),
          600: Color(0xFF6692FF),
          700: Color(0xFF5B88FF),
          800: Color(0xFF517EFF),
          900: Color(0xFF3F6CFF)
        });

  static Color get grammarPrimaryVariantColor =>
      _isDark ? const Color(0xFF4D6CB3) : const Color(0xFF4A85FF);

  static Color get grammarWrongColor =>
      _isDark ? const Color(0xFFB36049) : const Color(0xFFFF8968);

  static Color get grammarTagBgColor =>
      _isDark ? const Color(0xFFB0ADA4) : const Color(0xFFFBF8EA);

  static Color get grammarTagTextColor =>
      _isDark ? const Color(0xFFB27F35) : const Color(0xFFC3A747);

  static Color get knowledgePointThreeColor =>
      _isDark ? const Color(0xFFB27F35) : const Color(0xFFFFD442);

  static Color get knowledgeTextColorDDD =>
      _isDark ? const Color(0xFFDDDDDD) : const Color(0xFF333333);

  static Color get knowledgeTextColorFFF =>
      _isDark ? const Color(0xFFDDDDDD) : const Color(0xFFFFFFFF);

  static Color get shadow =>
      _isDark ? const Color(0x47000000) : const Color(0x1F000000);

  ///阅读单词频谱
  static Color get essayPieJunior => _isDark
      ? const Color(0xFFFFB74D).withOpacity(0.7)
      : const Color(0xFFFFB74D);

  static Color get essayPieSenior => _isDark
      ? const Color(0xFFFD6B4B).withOpacity(0.7)
      : const Color(0xFFFD6B4B);

  static Color get essayPieCET4 => _isDark
      ? const Color(0xFFAF71E7).withOpacity(0.7)
      : const Color(0xFFAF71E7);

  static Color get essayPieCET6 => _isDark
      ? const Color(0xFF69CBFF).withOpacity(0.7)
      : const Color(0xFF69CBFF);

  static Color get essayPieKaoyan => _isDark
      ? const Color(0xFF43C494).withOpacity(0.7)
      : const Color(0xFF43C494);

  static Color get essayPieIelts => _isDark
      ? const Color(0xFFBBD4E5).withOpacity(0.7)
      : const Color(0xFFBBD4E5);

  static Color get essayPieToefl => _isDark
      ? const Color(0xFF6A8EFF).withOpacity(0.7)
      : const Color(0xFF6A8EFF);

  static Color get essayFrequency => _isDark
      ? const Color(0xFFAFE7A4).withOpacity(0.7)
      : const Color(0xFFAFE7A4);

  static Color get essayTrainIndicatorSelectBgColor =>
      _isDark ? const Color(0xFFB27E35) : const Color(0xFFFFF3E2);

  static Color get essayTrainIndicatorSelectTextColor =>
      _isDark ? const Color(0xFFDDDDDD) : const Color(0xFFD69437);

  static Color get essayTrainIndicatorRightbgColor =>
      _isDark ? const Color(0xFF82918C) : const Color(0xFFD9F3EA);

  static Color get essayTrainIndicatorWrongbgColor =>
      _isDark ? const Color(0xFF655252) : const Color(0xFFFECECE);

  static Color get essayTrainIndicatorWrongTextColor =>
      _isDark ? const Color(0xFFA1383F) : const Color(0xFFFA4751);

  static Color get essayTimeIndicatorBgColor =>
      _isDark ? const Color(0xFF52432C) : const Color(0xFFFFF3E2);

  static Color get essayVipBgColor =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFFFF9E6);

  static Color get popupDialogShadowColor =>
      _isDark ? Colors.black : CommonColors.textColor666.withAlpha(102);

  static Color get essayTranslateIconColor =>
      _isDark ? const Color(0xFF666666) : const Color(0xFFd8d8d8);

  static Color get essayQuestionTextDetailColor =>
      _isDark ? const Color(0xFFBFBFBF) : const Color(0xFF666666);

  static Color get essayQuestionReplyBackgroundColor =>
      _isDark ? const Color(0xFF323943) : const Color(0xFFF4F7FA);

  static Color get kaoyanBgColor => _isDark
      ? const Color(0xFF323943).withOpacity(0.1)
      : const Color(0xFFEDEFF2).withOpacity(0.1);

  static Color get iconOnSurface =>
      _isDark ? const Color(0xFF666666) : const Color(0xFFBFBFBF);

  static Color get kaoyanPayOneColor => _isDark
      ? const Color(0xFF03CB65).withOpacity(0.6)
      : const Color(0xFF03CB65);

  static Color get kaoyanPayTwoColor => _isDark
      ? const Color(0xFF1578FF).withOpacity(0.6)
      : const Color(0xFF1578FF);

  static Color get kaoyanPayTextColor =>
      _isDark ? const Color(0xFFA1383F) : const Color(0xFFFD6B4B);

  //水印
  static Color get blurTextColor =>
      _isDark ? const Color(0xFF323943).withOpacity(0.3) : Color(0xFFF7F7F7);
}
