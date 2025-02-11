import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


const appDatePattern = 'd MMM yyyy';
const appTimePattern = 'hh:mm a';

DateTime stringDateToDateTime(String date) {
  return DateTime.parse(date);
}

DateTime stringServerPublicToDateTime(String stringDate) {
  /// ex: "2021-02-04 01:29 PM" -> DateTime().toString()
  /// -> 2021-02-04 13:29:00.000

  return Intl.withLocale(
      'en', () => DateFormat("yyyy-MM-dd hh:mm a").parse(stringDate));
}

String dateToAppDate(DateTime date) {
  return DateFormat(appDatePattern).format(date);
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay addTimeTest({int hour = 0, int minute = 0} ) {
    int h = this.hour;
    int m = this.minute;
    if ((minute + m) > 60) {h = this.hour + hour + 1;m = 00;}
    else {m = this.minute + minute;}

    return replacing(hour: this.hour + hour, minute: this.minute+minute,);
  }


  TimeOfDay addTime({required int hour ,required int minute } ) {

    DateTime date = DateFormat('HH:mm').parse('${this.hour}:${this.minute}').add(Duration(minutes: minute,hours: hour));
    return TimeOfDay(hour: date.hour, minute: date.minute);
  }

}

extension ToAppDate on DateTime {

  String toAppDate() {
    return dateToAppDate(this);
  }
  String toAppTime() {
    return DateFormat(appTimePattern).format(this);
  }

  String toTimeIfToday() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final thisDate = DateTime(year, month, day);

    if(thisDate == today) {
      return toAppTime();
    }
    return toAppDate();
  }

}
