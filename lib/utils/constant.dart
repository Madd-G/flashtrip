import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constant {
  // regular = normal, small < regular < big
  static const double fontExtraSmall = 10.0;
  static const double fontSmall = 12.0;
  static const double fontSemiSmall = 14.0;
  static const double fontRegular = 15.0;
  static const double fontSemiRegular = 16.0;
  static const double fontSemiBig = 18.0;
  static const double fontBig = 25.0;
  static const double fontExtraBig = 32.0;

  static const int mainColor = 0xffC0E6FD;

  static final oCcy = NumberFormat.currency(
      locale: 'id',
      customPattern: '\u00a4 #,### ',
      decimalDigits: 0,
      symbol: 'Rp');

  static List splitString(String data) {
    var datas = data.split(', ');
    var listData = [];
    for (var i = 0; i < datas.length; i++) {
      var currentElement = datas[i];
      listData.add(currentElement);
    }
    return listData;
  }
}
