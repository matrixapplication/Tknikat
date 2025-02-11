
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../app/App.dart';



class DateConverter {
  static const  String _locale ='en';


  static String chatFormat(String? dateTime) {
    if(dateTime == null){
      return DateFormat('yyyy-MM-dd - HH:mm a',_locale).format(DateTime.now());
    }
    DateTime date = DateFormat('yyyy-MM-dd HH:mm:ss',_locale).parse(dateTime);
    return DateFormat('yyyy-MM-dd - HH:mm a',_locale).format(date);

  }

  static String toAppDateFormat(String? dateTime) {
    if(dateTime == null){
      return DateFormat('dd MMM yyyy',_locale).format(DateTime.now());
    }
    DateTime date = DateFormat('yyyy-MM-dd',_locale).parse(dateTime);
    return DateFormat('dd MMM yyyy',_locale).format(date);

  }

  static String dateToStringRangeCalender(DateTime dateTime) {
    String date = DateFormat('yyyy-MM-dd',_locale).format(dateTime);
    return date;
  }
  static String slotDateCalenderRange({DateTime? fromDate , DateTime? toDate}) {
    if(fromDate ==null && toDate==null)return'';
    String from =fromDate ==null?'': DateFormat('yyyy-MM-dd',_locale).format(fromDate);
    String to =toDate ==null?'': DateFormat('yyyy-MM-dd',_locale).format(toDate);
    return '$from ${to.isEmpty?'':' - '} $to' ;
  }

  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss',_locale).format(dateTime);
  }
  static DateTime formatDateAPIForm(DateTime dateTime) {
    String data= DateFormat('yyyy-MM-dd hh:mm:ss','en').format(dateTime);
    return DateFormat('yyyy-MM-dd','en').parse(data).toLocal();

  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
    // return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static String estimatedDateAPI(String date) {
    var dateTime =  DateFormat('dd-MM-yyyy','en').parse(date).toLocal();
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }


  static DateTime isoStringToLocalDateWithOutTimer(String? dateTime) {
    if(dateTime == null){return DateTime.now();}
    try{
      return DateFormat('yyyy-MM-dd',_locale).parse(dateTime).toLocal();
    }catch(e){
      return DateTime.now();
    }
  }

  static String slotDate(DateTime dateTime) {
    // String date = DateFormat('MM-dd-yyyy',_locale).format(dateTime);
    return DateFormat.yMMMd(_locale).format(dateTime);
    // return date;
  }

  static String slotDateCalender(DateTime? dateTime) {
    if(dateTime ==null)return'';
    String date = DateFormat('yyyy-MM-dd',_locale).format(dateTime);
    return date;
  }

  static String slotDateAPI(String myDate) {
    DateTime datetime = DateFormat('MM-dd-yyyy',_locale).parse(myDate).toLocal();

    String date = DateFormat('yyyy-MM-dd',_locale).format(datetime);

    return date;
  }
  static DateTime fromAPIToDate(String myDate) {
    DateTime datetime = DateFormat('MM-dd-yyyy',_locale).parse(myDate).toLocal();

    return datetime;
  }
  static DateTime changeDateFormat(DateTime date) {
    DateTime datetime = DateFormat('yyyy-MM-dd',_locale).parse(date.toString()).toLocal();

    return datetime;
  }

  static DateTime slotStringToLocalDate(String dateTime) {
    return DateFormat('yyyy/MM/dd',_locale).parse(dateTime, true);
  }

  static DateTime convertStringToDatetime(String? dateTime) {
    if (dateTime == null) {
      return DateTime.now();
    }
    return DateFormat("yyyy/MM/dd",_locale).parse(dateTime);
  }

  static String isoStringToDateToDomain (String? dateTime) {
    try{
      DateTime date=isoStringToLocalDate(dateTime);
      return  DateFormat('yyyy-MM-dd',_locale).format(date);
    }catch(e){
      return  DateFormat('yyyy-MM-dd',_locale).format(DateTime.now());
    }
    // return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime, true).toLocal();
  }


  static DateTime isoStringToLocalDate(String? dateTime) {
    if(dateTime == null){return DateTime.now();}
    try{

      DateTime d =  DateFormat('yyyy-MM-ddThh:mm:ss',_locale).parse(dateTime).toLocal();
      return d;
    }catch(e){

      return DateTime.now();
    }
  }

  static DateTime? isoStringToLocalDateCanBeNull(String? dateTime) {
    if(dateTime == null){return DateTime.now();}
    try{

      DateTime d =  DateFormat('yyyy-MM-ddThh:mm:ss',_locale).parse(dateTime).toLocal();
      return d;
    }catch(e){

      return DateTime.now();
    }
  }

  static DateTime isoStringToLocalDateCalenderView(String? dateTime,DateTime lastDate) {
    if(dateTime == null){return DateTime.now();}
    try{
      return DateFormat('yyyy-mm-ddThh:mm:ss',_locale).parse(dateTime).toLocal();
    }catch(e){
      return DateTime.now();
    }
  }


  static String isoStringToLocalDateTime({DateTime? date , String? time}) {
    if(date == null|| time == null )return '';
    String d = slotDateCalender(date);

    String dateTime = '${d}T$time';

    try{
      DateTime date= DateFormat('yyyy-MM-ddThh:mm a',_locale).parse(dateTime).toLocal();
      return  DateFormat('yyyy-MM-dd HH:mm',_locale).format(date);

    }catch(e){
      return '';
    }
  }


  // 2022-01-01T00:00:00
  static String convertDateDomainData(String? dateTime) {
    if (dateTime == null) {
      return "";
    }
    String date = '';
    try {
      date = DateFormat('yyyy-MM-dd',_locale).format(DateFormat('yyyy-mm-ddThh:mm:ss',_locale).parse(dateTime, true).toLocal());
    } catch(e) {
      date = '';
    }
    return date;
  }

  static String isoStringToLocalTimeTimeOnly(String dateTime) {
   try{
     String date = DateFormat('hh:mm a').format(DateFormat('HH:mm a',_locale).parse(dateTime, true));


     return date;
   }catch(e){
     String date = DateFormat('hh:mm a').format(DateFormat('HH:mm',_locale).parse(dateTime, true));


     return date;
   }


  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('HH:mm',_locale).format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalTimeWithAMPMOnly(String dateTime) {

    return DateFormat('hh:mm a',_locale).format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalTimeWithAMPMOnlyDate(DateTime dateTime) {
    return DateFormat('hh:mm a',_locale).format(dateTime);
  }

  static String isoStringToLocalTimeWithAmPmAndDay(String dateTime) {
    return DateFormat('hh:mm a, EEE',_locale).format(isoStringToLocalDate(dateTime));
  }

  static String stringToStringTime(String dateTime) {
    DateTime inputDate = DateFormat('HH:mm:ss').parse(dateTime);
    return DateFormat('hh:mm a').format(inputDate);
  }

  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('a',_locale).format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd MMM yyyy',_locale).format(isoStringToLocalDate(dateTime));
  }

  static String localDateFromDateToIsoString(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return DateFormat('dd MMM hh aa',_locale).format(dateTime);
  }

  static String localDateFromToIsoString(String? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return DateFormat('dd MMM hh aa',_locale)
        .format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime.toUtc());
  }

  static String isoDayWithDateString(String dateTime) {
    return DateFormat('EEE, MMM d, yyyy')
        .format(isoStringToLocalDate(dateTime));
  }

  static String isoDayWithDateStringForView(String dateTime) {
    return DateFormat('EEE, MMM d, yyyy','en').format(isoStringToLocalDate(dateTime));
  }

  static String convertTimeRange(String start, String end) {
    DateTime startTime = DateFormat('HH:mm:ss').parse(start);
    DateTime endTime = DateFormat('HH:mm:ss').parse(end);
    return '${DateFormat('hh:mm aa',_locale).format(startTime)} - ${DateFormat('hh:mm aa',_locale).format(endTime)}';
  }

  static String stringTimeToDateTime(String time) {

    DateTime startTime = DateFormat('HH:mm a').parse(time);

    return DateFormat('HH:mm:ss').format(startTime);
  }


  // static String dateTimeToTimeString(DateTime dateTime) {
  //
  //   // DateTime startTime = DateFormat('HH:mm a').parse(time);
  //
  //   log('stringTimeToDateTime', startTime.toString());
  //   return DateFormat('HH:mm:ss').format(startTime);
  // }

  static String stringTimeToDateTime1(String time) {
    // log('stringTimeToDateTime', time.toString());
    // try{
    //   DateTime dateTime=  DateFormat('hh:mm',_locale).parse(time);
    //
    // }catch(e){
    //   log('stringTimeToDateTime', e.toString());
    //
    // }
    DateTime dateTime= DateFormat('HH:mm',_locale).parse(time);
    String hour ='${dateTime.hour}';
    String minute ='${dateTime.minute}';

    if(dateTime.hour<9){ hour ='0${dateTime.hour}';}
    if(dateTime.minute<9){ minute ='0${dateTime.minute}';}

    String myTime = '$hour:$minute:00';
    return myTime.toString();
  }

  static TimeOfDay formatTimeFromStringToTimeOfDay(String? time) {
    if((time??'').isEmpty)return TimeOfDay.now();
    try{
      DateTime dateTime= DateFormat('hh:mm a',_locale).parse(time!);

      return TimeOfDay.fromDateTime(dateTime);
    }catch(e){
      return TimeOfDay.now();
    }
  }

  static String formatTimeFromHHMMSSToHHMMA(String time) {
    // log('stringTimeToDateTime', time.toString());

    DateTime startTime = DateFormat('HH:mm:ss',_locale).parse(time);

    // log('stringTimeToDateTime', startTime.toString());
    return DateFormat('hh:mm a',_locale).format(startTime);
  }

  static String? getMM(String? time) {
    if ((time??'').isEmpty) return DateFormat('mm', _locale).format(DateTime.now());
    try {
      DateTime startTime = DateFormat('HH:mm:ss', _locale).parse(time!);
      return DateFormat('mm', _locale).format(startTime);
    } catch (e) {
      return DateFormat('mm', _locale).format(DateTime.now());
    }
  }

  static String? getHH(String? time) {
    if ((time??'').isEmpty) return DateFormat('hh', _locale).format(DateTime.now());

    try{
      DateTime startTime = DateFormat('HH:mm:ss',_locale).parse(time!);
      return DateFormat('hh',_locale).format(startTime);
    }catch(e){
      return DateFormat('hh', _locale).format(DateTime.now());

    }
  }

  static String? getA(String? time) {
    if ((time??'').isEmpty) return DateFormat('a', _locale).format(DateTime.now());
    try{
      DateTime startTime = DateFormat('HH:mm:ss',_locale).parse(time!);
      return DateFormat('a',_locale).format(startTime);
    }catch(e){
      return DateFormat('a', _locale).format(DateTime.now());
    }
  }


  static String formatTimeFromHHMMAToHHMMSS(String time) {
    DateTime startTime = DateFormat('hh:mm a',_locale).parse(time);
    final res =DateFormat('hh:mm a',_locale).format(startTime);
    print('asdasdsd $res');
    return res;
  }

}
