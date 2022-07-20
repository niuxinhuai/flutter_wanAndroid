import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class LunarCalendar {
  //农历年
  int year = 0;

  int month = 0;

  int day = 0;

  bool leap = false;

  ///中文月名称
  static List<String> chineseNumber = [
    "一",
    "二",
    "三",
    "四",
    "五",
    "六",
    "七",
    "八",
    "九",
    "十",
    "十一",
    "十二"
  ];

  ///中文日期格式
  static DateFormat chineseDateFormat = new DateFormat("yyyy年MM月dd日");

  ///农历数据， 1901 ~ 2100 年之间正确
  static List<int> lunarInfo = [
    0x04bd8,
    0x04ae0,
    0x0a570,
    0x054d5,
    0x0d260,
    0x0d950,
    0x16554,
    0x056a0,
    0x09ad0,
    0x055d2,
    0x04ae0,
    0x0a5b6,
    0x0a4d0,
    0x0d250,
    0x1d255,
    0x0b540,
    0x0d6a0,
    0x0ada2,
    0x095b0,
    0x14977,
    0x04970,
    0x0a4b0,
    0x0b4b5,
    0x06a50,
    0x06d40,
    0x1ab54,
    0x02b60,
    0x09570,
    0x052f2,
    0x04970,
    0x06566,
    0x0d4a0,
    0x0ea50,
    0x06e95,
    0x05ad0,
    0x02b60,
    0x186e3,
    0x092e0,
    0x1c8d7,
    0x0c950,
    0x0d4a0,
    0x1d8a6,
    0x0b550,
    0x056a0,
    0x1a5b4,
    0x025d0,
    0x092d0,
    0x0d2b2,
    0x0a950,
    0x0b557,
    0x06ca0,
    0x0b550,
    0x15355,
    0x04da0,
    0x0a5d0,
    0x14573,
    0x052d0,
    0x0a9a8,
    0x0e950,
    0x06aa0,
    0x0aea6,
    0x0ab50,
    0x04b60,
    0x0aae4,
    0x0a570,
    0x05260,
    0x0f263,
    0x0d950,
    0x05b57,
    0x056a0,
    0x096d0,
    0x04dd5,
    0x04ad0,
    0x0a4d0,
    0x0d4d4,
    0x0d250,
    0x0d558,
    0x0b540,
    0x0b5a0,
    0x195a6,
    0x095b0,
    0x049b0,
    0x0a974,
    0x0a4b0,
    0x0b27a,
    0x06a50,
    0x06d40,
    0x0af46,
    0x0ab60,
    0x09570,
    0x04af5,
    0x04970,
    0x064b0,
    0x074a3,
    0x0ea50,
    0x06b58,
    0x055c0,
    0x0ab60,
    0x096d5,
    0x092e0,
    0x0c960,
    0x0d954,
    0x0d4a0,
    0x0da50,
    0x07552,
    0x056a0,
    0x0abb7,
    0x025d0,
    0x092d0,
    0x0cab5,
    0x0a950,
    0x0b4a0,
    0x0baa4,
    0x0ad50,
    0x055d9,
    0x04ba0,
    0x0a5b0,
    0x15176,
    0x052b0,
    0x0a930,
    0x07954,
    0x06aa0,
    0x0ad50,
    0x05b52,
    0x04b60,
    0x0a6e6,
    0x0a4e0,
    0x0d260,
    0x0ea65,
    0x0d530,
    0x05aa0,
    0x076a3,
    0x096d0,
    0x04bd7,
    0x04ad0,
    0x0a4d0,
    0x1d0b6,
    0x0d250,
    0x0d520,
    0x0dd45,
    0x0b5a0,
    0x056d0,
    0x055b2,
    0x049b0,
    0x0a577,
    0x0a4b0,
    0x0aa50,
    0x1b255,
    0x06d20,
    0x0ada0
  ];

  // 传回农历 y年的总天数
  static int yearDays(int y) {
    int i, sum = 348;
    for (i = 0x8000; i > 0x8; i >>= 1) {
      if ((lunarInfo[y - 1900] & i) != 0) sum += 1;
    }
    return (sum + leapDays(y));
  }

  // 传回农历 y年闰月的天数
  static int leapDays(int y) {
    if (leapMonthM(y) != 0) {
      if ((lunarInfo[y - 1900] & 0x10000) != 0)
        return 30;
      else
        return 29;
    } else
      return 0;
  }

  // 传回农历 y年闰哪个月 1-12 , 没闰传回 0
  static int leapMonthM(int y) {
//    print('$y');
    return (lunarInfo[y - 1900] & 0xf);
  }

  // 传回农历 y年m月的总天数
  static int monthDays(int y, int m) {
    if ((lunarInfo[y - 1900] & (0x10000 >> m)) == 0)
      return 29;
    else
      return 30;
  }

  // 传回农历 y年的生肖
  String animalsYear() {
    final List<String> Animals = [
      "鼠",
      "牛",
      "虎",
      "兔",
      "龙",
      "蛇",
      "马",
      "羊",
      "猴",
      "鸡",
      "狗",
      "猪"
    ];
    return Animals[(year - 4) % 12];
  }

  // 传入 月日的offset 传回干支, 0=甲子
  static String cyclicalm(int num) {
    final List<String> Gan = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"];
    final List<String> Zhi = [
      "子",
      "丑",
      "寅",
      "卯",
      "辰",
      "巳",
      "午",
      "未",
      "申",
      "酉",
      "戌",
      "亥"
    ];
    return (Gan[num % 10] + Zhi[num % 12]);
  }

  // 传入 offset 传回干支, 0=甲子
  String cyclical() {
    int num = year - 1900 + 36;
    return (cyclicalm(num));
  }

  static String getChinaDayString(int day) {
    List<String> chineseTen = ["初", "十", "廿", "三"];
    int n = day % 10 == 0 ? 9 : day % 10 - 1;
    if (day > 30) return "";
    if (day == 10)
      return "初十";
    else
      return chineseTen[day ~/ 10] + chineseNumber[n];
  }

  String getChinaMonthString() {
    return chineseNumber[month - 1];
  }

  String toString() {
    return "$year" +
        "年" +
        (leap ? "闰" : "") +
        chineseNumber[month - 1] +
        "月" +
        getChinaDayString(day);
  }

  ///使用指定日历日期构造一个农历日历
  LunarCalendar(DateTime cal) {
    int yearCyl, monCyl, dayCyl;
    int leapMonth = 0;
    DateTime? baseDate;
    try {
      baseDate = chineseDateFormat.parse("1900年1月31日");
    } catch (e) {}

    // 求出和1900年1月31日相差的天数, 注意此处毫秒，除以86400000000
    int offset =
        ((cal.microsecondsSinceEpoch - baseDate!.microsecondsSinceEpoch) ~/
            86400000000);
    dayCyl = offset + 40;
    monCyl = 14;

    // 用offset减去每农历年的天数
    // 计算当天是农历第几天
    // i最终结果是农历的年份
    // offset是当年的第几天
    int iYear, daysOfYear = 0;
    for (iYear = 1900; iYear < 2050 && offset > 0; iYear++) {
      daysOfYear = yearDays(iYear);
      offset -= daysOfYear;
      monCyl += 12;
    }
    if (offset < 0) {
      offset += daysOfYear;
      iYear--;
      monCyl -= 12;
    }
    // 农历年份
    year = iYear;

    yearCyl = iYear - 1864;
    leapMonth = leapMonthM(iYear); // 闰哪个月,1-12
    leap = false;

    // 用当年的天数offset,逐个减去每月（农历）的天数，求出当天是本月的第几天
    int iMonth, daysOfMonth = 0;
    for (iMonth = 1; iMonth < 13 && offset > 0; iMonth++) {
      // 闰月
      if (leapMonth > 0 && iMonth == (leapMonth + 1) && !leap) {
        --iMonth;
        leap = true;
        daysOfMonth = leapDays(year);
      } else
        daysOfMonth = monthDays(year, iMonth);

      offset -= daysOfMonth;
      // 解除闰月
      if (leap && iMonth == (leapMonth + 1)) leap = false;
      if (!leap) monCyl++;
    }
    // offset为0时，并且刚才计算的月份是闰月，要校正
    if (offset == 0 && leapMonth > 0 && iMonth == leapMonth + 1) {
      if (leap) {
        leap = false;
      } else {
        leap = true;
        --iMonth;
        --monCyl;
      }
    }
    // offset小于0时，也要校正
    if (offset < 0) {
      offset += daysOfMonth;
      --iMonth;
      --monCyl;
    }
    month = iMonth;
    day = offset + 1;
  }
}

/**
 * 农历的工具类
 */
class LunarCalendarUtil {
  /**
   * 支持转换的最小农历年份
   */
  static final int MIN_YEAR = 1900;

  /**
   * 支持转换的最大农历年份
   */
  static final int MAX_YEAR = 2099;
  /**
   * 公历每月前的天数
   */
  static final List<int> DAYS_BEFORE_MONTH = [
    0,
    31,
    59,
    90,
    120,
    151,
    181,
    212,
    243,
    273,
    304,
    334,
    365
  ];

  /**
   * 用来表示1900年到2099年间农历年份的相关信息，共24位bit的16进制表示，其中：
   * 1. 前4位表示该年闰哪个月；
   * 2. 5-17位表示农历年份13个月的大小月分布，0表示小，1表示大；
   * 3. 最后7位表示农历年首（正月初一）对应的公历日期。
   * 以2014年的数据0x955ABF为例说明：
   * 1001 0101 0101 1010 1011 1111
   *  闰九月   农历正月初一对应公历1月31号
   */
  static final List<int> LUNAR_INFO = [
    /*1900*/
    0x84B6BF,
    /*1901-1910*/
    0x04AE53,
    0x0A5748,
    0x5526BD,
    0x0D2650,
    0x0D9544,
    0x46AAB9,
    0x056A4D,
    0x09AD42,
    0x24AEB6,
    0x04AE4A,
    /*1911-1920*/
    0x6A4DBE,
    0x0A4D52,
    0x0D2546,
    0x5D52BA,
    0x0B544E,
    0x0D6A43,
    0x296D37,
    0x095B4B,
    0x749BC1,
    0x049754,
    /*1921-1930*/
    0x0A4B48,
    0x5B25BC,
    0x06A550,
    0x06D445,
    0x4ADAB8,
    0x02B64D,
    0x095742,
    0x2497B7,
    0x04974A,
    0x664B3E,
    /*1931-1940*/
    0x0D4A51,
    0x0EA546,
    0x56D4BA,
    0x05AD4E,
    0x02B644,
    0x393738,
    0x092E4B,
    0x7C96BF,
    0x0C9553,
    0x0D4A48,
    /*1941-1950*/
    0x6DA53B,
    0x0B554F,
    0x056A45,
    0x4AADB9,
    0x025D4D,
    0x092D42,
    0x2C95B6,
    0x0A954A,
    0x7B4ABD,
    0x06CA51,
    /*1951-1960*/
    0x0B5546,
    0x555ABB,
    0x04DA4E,
    0x0A5B43,
    0x352BB8,
    0x052B4C,
    0x8A953F,
    0x0E9552,
    0x06AA48,
    0x6AD53C,
    /*1961-1970*/
    0x0AB54F,
    0x04B645,
    0x4A5739,
    0x0A574D,
    0x052642,
    0x3E9335,
    0x0D9549,
    0x75AABE,
    0x056A51,
    0x096D46,
    /*1971-1980*/
    0x54AEBB,
    0x04AD4F,
    0x0A4D43,
    0x4D26B7,
    0x0D254B,
    0x8D52BF,
    0x0B5452,
    0x0B6A47,
    0x696D3C,
    0x095B50,
    /*1981-1990*/
    0x049B45,
    0x4A4BB9,
    0x0A4B4D,
    0xAB25C2,
    0x06A554,
    0x06D449,
    0x6ADA3D,
    0x0AB651,
    0x095746,
    0x5497BB,
    /*1991-2000*/
    0x04974F,
    0x064B44,
    0x36A537,
    0x0EA54A,
    0x86B2BF,
    0x05AC53,
    0x0AB647,
    0x5936BC,
    0x092E50,
    0x0C9645,
    /*2001-2010*/
    0x4D4AB8,
    0x0D4A4C,
    0x0DA541,
    0x25AAB6,
    0x056A49,
    0x7AADBD,
    0x025D52,
    0x092D47,
    0x5C95BA,
    0x0A954E,
    /*2011-2020*/
    0x0B4A43,
    0x4B5537,
    0x0AD54A,
    0x955ABF,
    0x04BA53,
    0x0A5B48,
    0x652BBC,
    0x052B50,
    0x0A9345,
    0x474AB9,
    /*2021-2030*/
    0x06AA4C,
    0x0AD541,
    0x24DAB6,
    0x04B64A,
    0x6a573D,
    0x0A4E51,
    0x0D2646,
    0x5E933A,
    0x0D534D,
    0x05AA43,
    /*2031-2040*/
    0x36B537,
    0x096D4B,
    0xB4AEBF,
    0x04AD53,
    0x0A4D48,
    0x6D25BC,
    0x0D254F,
    0x0D5244,
    0x5DAA38,
    0x0B5A4C,
    /*2041-2050*/
    0x056D41,
    0x24ADB6,
    0x049B4A,
    0x7A4BBE,
    0x0A4B51,
    0x0AA546,
    0x5B52BA,
    0x06D24E,
    0x0ADA42,
    0x355B37,
    /*2051-2060*/
    0x09374B,
    0x8497C1,
    0x049753,
    0x064B48,
    0x66A53C,
    0x0EA54F,
    0x06AA44,
    0x4AB638,
    0x0AAE4C,
    0x092E42,
    /*2061-2070*/
    0x3C9735,
    0x0C9649,
    0x7D4ABD,
    0x0D4A51,
    0x0DA545,
    0x55AABA,
    0x056A4E,
    0x0A6D43,
    0x452EB7,
    0x052D4B,
    /*2071-2080*/
    0x8A95BF,
    0x0A9553,
    0x0B4A47,
    0x6B553B,
    0x0AD54F,
    0x055A45,
    0x4A5D38,
    0x0A5B4C,
    0x052B42,
    0x3A93B6,
    /*2081-2090*/
    0x069349,
    0x7729BD,
    0x06AA51,
    0x0AD546,
    0x54DABA,
    0x04B64E,
    0x0A5743,
    0x452738,
    0x0D264A,
    0x8E933E,
    /*2091-2099*/
    0x0D5252,
    0x0DAA47,
    0x66B53B,
    0x056D4F,
    0x04AE45,
    0x4A4EB9,
    0x0A4D4C,
    0x0D1541,
    0x2D92B5
  ];

  /**
   * 将农历日期转换为公历日期
   * @param year    农历年份
   * @param month   农历月
   * @param monthDay   农历日
   * @param isLeapMonth   该月是否是闰月(该参数可以根据本类中leapMonth()方法，先判断一下要查询的年份是否有闰月，并且闰的几月)
   * @return 返回农历日期对应的公历日期，year0, month1, day2.
   */
  static List<int> lunarToSolar(
      int year, int month, int monthDay, bool isLeapMonth) {
    int dayOffset;
    int leapMonth;
    int i;
    if (year < MIN_YEAR ||
        year > MAX_YEAR ||
        month < 1 ||
        month > 12 ||
        monthDay < 1 ||
        monthDay > 30) {
      throw new Exception("Illegal lunar date, must be like that:\n\t" +
          "year : 1900~2099\n\t" +
          "month : 1~12\n\t" +
          "day : 1~30");
    }
    dayOffset = (LUNAR_INFO[year - MIN_YEAR] & 0x001F) - 1;
    if (((LUNAR_INFO[year - MIN_YEAR] & 0x0060) >> 5) == 2) {
      dayOffset += 31;
    }
    for (i = 1; i < month; i++) {
      if ((LUNAR_INFO[year - MIN_YEAR] & (0x80000 >> (i - 1))) == 0) {
        dayOffset += 29;
      } else {
        dayOffset += 30;
      }
    }
    dayOffset += monthDay;
    leapMonth = (LUNAR_INFO[year - MIN_YEAR] & 0xf00000) >> 20;
    // 这一年有闰月
    if (leapMonth != 0) {
      if (month > leapMonth || (month == leapMonth && isLeapMonth)) {
        if ((LUNAR_INFO[year - MIN_YEAR] & (0x80000 >> (month - 1))) == 0) {
          dayOffset += 29;
        } else {
          dayOffset += 30;
        }
      }
    }
    if (dayOffset > 366 || (year % 4 != 0 && dayOffset > 365)) {
      year += 1;
      if (year % 4 == 1) {
        dayOffset -= 366;
      } else {
        dayOffset -= 365;
      }
    }
    List<int> solarInfo = [0, 0, 0];
    for (i = 1; i < 13; i++) {
      int iPos = DAYS_BEFORE_MONTH[i];
      if (year % 4 == 0 && i > 2) {
        iPos += 1;
      }
      if (year % 4 == 0 && i == 2 && iPos + 1 == dayOffset) {
        solarInfo[1] = i;
        solarInfo[2] = dayOffset - 31;
        break;
      }
      if (iPos >= dayOffset) {
        solarInfo[1] = i;
        iPos = DAYS_BEFORE_MONTH[i - 1];
        if (year % 4 == 0 && i > 2) {
          iPos += 1;
        }
        if (dayOffset > iPos) {
          solarInfo[2] = dayOffset - iPos;
        } else if (dayOffset == iPos) {
          if (year % 4 == 0 && i == 2) {
            solarInfo[2] = DAYS_BEFORE_MONTH[i] - DAYS_BEFORE_MONTH[i - 1] + 1;
          } else {
            solarInfo[2] = DAYS_BEFORE_MONTH[i] - DAYS_BEFORE_MONTH[i - 1];
          }
        } else {
          solarInfo[2] = dayOffset;
        }
        break;
      }
    }
    solarInfo[0] = year;
    return solarInfo;
  }

  /**
   * 传回农历year年month月的总天数
   *
   * @param year   要计算的年份
   * @param month        要计算的月
   * @return 传回天数
   */
  static int daysInMonth(int year, int month) {
    return daysInMontaThree(year, month, false);
  }

  /**
   * 传回农历year年month月的总天数
   *
   * @param year   要计算的年份
   * @param month    要计算的月
   * @param leap   当月是否是闰月
   * @return 传回天数，如果闰月是错误的，返回0.
   */
  static int daysInMontaThree(int year, int month, bool leap) {
    int mLeapMonth = leapMonth(year);
    int offset = 0;
    // 如果本年有闰月且month大于闰月时，需要校正
    if (leapMonth != 0 && month > mLeapMonth) {
      offset = 1;
    }
    // 不考虑闰月
    if (!leap) {
      return daysInLunarMonth(year, month + offset);
    } else {
      // 传入的闰月是正确的月份
      if (leapMonth != 0 && leapMonth == month) {
        return daysInLunarMonth(year, month + 1);
      }
    }
    return 0;
  }

  /**
   * 传回农历 year年的总天数
   *
   * @param year 将要计算的年份
   * @return 返回传入年份的总天数
   */
  static int daysInLunarYear(int year) {
    int i, sum = 348;
    if (leapMonth(year) != 0) {
      sum = 377;
    }
    int monthInfo = LUNAR_INFO[year - MIN_YEAR] & 0x0FFF80;
    for (i = 0x80000; i > 0x7; i >>= 1) {
      if ((monthInfo & i) != 0) {
        sum += 1;
      }
    }
    return sum;
  }

  /**
   * 传回农历 year年month月的总天数，总共有13个月包括闰月
   *
   * @param year  将要计算的年份
   * @param month 将要计算的月份
   * @return 传回农历 year年month月的总天数
   */
  static int daysInLunarMonth(int year, int month) {
    if ((LUNAR_INFO[year - MIN_YEAR] & (0x100000 >> month)) == 0) {
      return 29;
    } else {
      return 30;
    }
  }

  /**
   * 传回农历 year年闰哪个月 1-12 , 没闰传回 0
   * @param year 将要计算的年份
   * @return 传回农历 year年闰哪个月1-12, 没闰传回 0
   */
  static int leapMonth(int year) {
    return ((LUNAR_INFO[year - MIN_YEAR] & 0xF00000)) >> 20;
  }
}

//class CalendarLunarUtil {
//  //农历年
//  int year = 0;
//
//  int month = 0;
//
//  int day = 0;
//
//  bool leap = false;
//
//  ///中文月名称
//  static List<String> chineseNumber = [
//    "一",
//    "二",
//    "三",
//    "四",
//    "五",
//    "六",
//    "七",
//    "八",
//    "九",
//    "十",
//    "十一",
//    "十二"
//  ];
//
//  ///中文日期格式
//  static DateFormat chineseDateFormat = new DateFormat("yyyy年MM月dd日");
//
//  ///农历数据， 1901 ~ 2100 年之间正确
//  static List<int> lunarInfo = [
//    0x04bd8,
//    0x04ae0,
//    0x0a570,
//    0x054d5,
//    0x0d260,
//    0x0d950,
//    0x16554,
//    0x056a0,
//    0x09ad0,
//    0x055d2,
//    0x04ae0,
//    0x0a5b6,
//    0x0a4d0,
//    0x0d250,
//    0x1d255,
//    0x0b540,
//    0x0d6a0,
//    0x0ada2,
//    0x095b0,
//    0x14977,
//    0x04970,
//    0x0a4b0,
//    0x0b4b5,
//    0x06a50,
//    0x06d40,
//    0x1ab54,
//    0x02b60,
//    0x09570,
//    0x052f2,
//    0x04970,
//    0x06566,
//    0x0d4a0,
//    0x0ea50,
//    0x06e95,
//    0x05ad0,
//    0x02b60,
//    0x186e3,
//    0x092e0,
//    0x1c8d7,
//    0x0c950,
//    0x0d4a0,
//    0x1d8a6,
//    0x0b550,
//    0x056a0,
//    0x1a5b4,
//    0x025d0,
//    0x092d0,
//    0x0d2b2,
//    0x0a950,
//    0x0b557,
//    0x06ca0,
//    0x0b550,
//    0x15355,
//    0x04da0,
//    0x0a5d0,
//    0x14573,
//    0x052d0,
//    0x0a9a8,
//    0x0e950,
//    0x06aa0,
//    0x0aea6,
//    0x0ab50,
//    0x04b60,
//    0x0aae4,
//    0x0a570,
//    0x05260,
//    0x0f263,
//    0x0d950,
//    0x05b57,
//    0x056a0,
//    0x096d0,
//    0x04dd5,
//    0x04ad0,
//    0x0a4d0,
//    0x0d4d4,
//    0x0d250,
//    0x0d558,
//    0x0b540,
//    0x0b5a0,
//    0x195a6,
//    0x095b0,
//    0x049b0,
//    0x0a974,
//    0x0a4b0,
//    0x0b27a,
//    0x06a50,
//    0x06d40,
//    0x0af46,
//    0x0ab60,
//    0x09570,
//    0x04af5,
//    0x04970,
//    0x064b0,
//    0x074a3,
//    0x0ea50,
//    0x06b58,
//    0x055c0,
//    0x0ab60,
//    0x096d5,
//    0x092e0,
//    0x0c960,
//    0x0d954,
//    0x0d4a0,
//    0x0da50,
//    0x07552,
//    0x056a0,
//    0x0abb7,
//    0x025d0,
//    0x092d0,
//    0x0cab5,
//    0x0a950,
//    0x0b4a0,
//    0x0baa4,
//    0x0ad50,
//    0x055d9,
//    0x04ba0,
//    0x0a5b0,
//    0x15176,
//    0x052b0,
//    0x0a930,
//    0x07954,
//    0x06aa0,
//    0x0ad50,
//    0x05b52,
//    0x04b60,
//    0x0a6e6,
//    0x0a4e0,
//    0x0d260,
//    0x0ea65,
//    0x0d530,
//    0x05aa0,
//    0x076a3,
//    0x096d0,
//    0x04bd7,
//    0x04ad0,
//    0x0a4d0,
//    0x1d0b6,
//    0x0d250,
//    0x0d520,
//    0x0dd45,
//    0x0b5a0,
//    0x056d0,
//    0x055b2,
//    0x049b0,
//    0x0a577,
//    0x0a4b0,
//    0x0aa50,
//    0x1b255,
//    0x06d20,
//    0x0ada0
//  ];
//
//  // 传回农历 y年的总天数
//  static int yearDays(int y) {
//    int i, sum = 348;
//    for (i = 0x8000; i > 0x8; i >>= 1) {
//      if ((lunarInfo[y - 1900] & i) != 0) sum += 1;
//    }
//    return (sum + leapDays(y));
//  }
//
//  // 传回农历 y年闰月的天数
//  static int leapDays(int y) {
//    if (leapMonthM(y) != 0) {
//      if ((lunarInfo[y - 1900] & 0x10000) != 0)
//        return 30;
//      else
//        return 29;
//    } else
//      return 0;
//  }
//
//  // 传回农历 y年闰哪个月 1-12 , 没闰传回 0
//  static int leapMonthM(int y) {
//    print('$y');
//    return (lunarInfo[y - 1900] & 0xf);
//  }
//
//  // 传回农历 y年m月的总天数
//  static int monthDays(int y, int m) {
//    if ((lunarInfo[y - 1900] & (0x10000 >> m)) == 0)
//      return 29;
//    else
//      return 30;
//  }
//
//  // 传回农历 y年的生肖
//  String animalsYear() {
//    final List<String> Animals = [
//      "鼠",
//      "牛",
//      "虎",
//      "兔",
//      "龙",
//      "蛇",
//      "马",
//      "羊",
//      "猴",
//      "鸡",
//      "狗",
//      "猪"
//    ];
//    return Animals[(year - 4) % 12];
//  }
//
//  // 传入 月日的offset 传回干支, 0=甲子
//  static String cyclicalm(int num) {
//    final List<String> Gan = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"];
//    final List<String> Zhi = [
//      "子",
//      "丑",
//      "寅",
//      "卯",
//      "辰",
//      "巳",
//      "午",
//      "未",
//      "申",
//      "酉",
//      "戌",
//      "亥"
//    ];
//    return (Gan[num % 10] + Zhi[num % 12]);
//  }
//
//  // 传入 offset 传回干支, 0=甲子
//  String cyclical() {
//    int num = year - 1900 + 36;
//    return (cyclicalm(num));
//  }
//
//  static String getChinaDayString(int day) {
//    List<String> chineseTen = ["初", "十", "廿", "卅"];
//    int n = day % 10 == 0 ? 9 : day % 10 - 1;
//    if (day > 30) return "";
//    if (day == 10)
//      return "初十";
//    else
//      return chineseTen[day ~/ 10] + chineseNumber[n];
//  }
//
//  String getChinaMonthString() {
//    return chineseNumber[month - 1];
//  }
//
//  String toString() {
//    return "$year" +
//        "年" +
//        (leap ? "闰" : "") +
//        chineseNumber[month - 1] +
//        "月" +
//        getChinaDayString(day);
//  }
//
//  ///使用指定日历日期构造一个农历日历
//  CalendarLunarUtil(DateTime cal) {
//    int yearCyl, monCyl, dayCyl;
//    int leapMonth = 0;
//    DateTime? baseDate;
//    try {
//      baseDate = chineseDateFormat.parse("1900年1月31日");
//    } catch (e) {}
//
//    // 求出和1900年1月31日相差的天数, 注意此处毫秒，除以86400000000
//    int offset =
//        ((cal.microsecondsSinceEpoch - baseDate!.microsecondsSinceEpoch) ~/
//            86400000000);
//    dayCyl = offset + 40;
//    monCyl = 14;
//
//    // 用offset减去每农历年的天数
//    // 计算当天是农历第几天
//    // i最终结果是农历的年份
//    // offset是当年的第几天
//    int iYear, daysOfYear = 0;
//    for (iYear = 1900; iYear < 2050 && offset > 0; iYear++) {
//      daysOfYear = yearDays(iYear);
//      offset -= daysOfYear;
//      monCyl += 12;
//    }
//    if (offset < 0) {
//      offset += daysOfYear;
//      iYear--;
//      monCyl -= 12;
//    }
//    // 农历年份
//    year = iYear;
//
//    yearCyl = iYear - 1864;
//    leapMonth = leapMonthM(iYear); // 闰哪个月,1-12
//    leap = false;
//
//    // 用当年的天数offset,逐个减去每月（农历）的天数，求出当天是本月的第几天
//    int iMonth, daysOfMonth = 0;
//    for (iMonth = 1; iMonth < 13 && offset > 0; iMonth++) {
//      // 闰月
//      if (leapMonth > 0 && iMonth == (leapMonth + 1) && !leap) {
//        --iMonth;
//        leap = true;
//        daysOfMonth = leapDays(year);
//      } else
//        daysOfMonth = monthDays(year, iMonth);
//
//      offset -= daysOfMonth;
//      // 解除闰月
//      if (leap && iMonth == (leapMonth + 1)) leap = false;
//      if (!leap) monCyl++;
//    }
//    // offset为0时，并且刚才计算的月份是闰月，要校正
//    if (offset == 0 && leapMonth > 0 && iMonth == leapMonth + 1) {
//      if (leap) {
//        leap = false;
//      } else {
//        leap = true;
//        --iMonth;
//        --monCyl;
//      }
//    }
//    // offset小于0时，也要校正
//    if (offset < 0) {
//      offset += daysOfMonth;
//      --iMonth;
//      --monCyl;
//    }
//    month = iMonth;
//    day = offset + 1;
//  }
//}
