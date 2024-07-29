import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taknikat/injectoin.dart';
import 'package:url_launcher/url_launcher.dart';

const String IS_LOGIN = "login";
const String IS_SKIP = "skip";
// const String BaseUrl = "https://teknikat.dev02.matrix-clouds.com/api/";
// const String imagesPrefix = "https://teknikat.dev02.matrix-clouds.com/storage/";
const String imagesPrefix = "https://taknikat.com/storage/";

const String BaseUrl = "https://taknikat.com/api/";
// const String domain5 = "taknikat.com";
// const String url = "https://dev02.matrix-clouds.com/";
const String url = "https://taknikat.com/";
// const String DevBaseUrl = "https://taknikat.com/api/";
// const String DevBaseUrl = "https://teknikat.dev02.matrix-clouds.com/api/";
//token
Color primaryColor = Color(0xFF349DD8);
Color secondryColor = Colors.grey;
Color othercolor = Color(0xFF86B1D2);

String getImagePath(String image) {
  if (image == "") return imagesPrefix + "not_found.jpeg";
  late String url;
  url = image.contains('http')
      ? image.toString()
      : imagesPrefix + image.toString();
  return deleteDoubleSlashExceptProtocol(url);
}

String deleteDoubleSlashExceptProtocol(String input) {
  return input
      .replaceAll("://", "~")
      .replaceAll("//", "/")
      .replaceAll("~", "://");
}

String getDateOnly(String? date, {String? local}) {
  if (date != null && date.trim().isNotEmpty)
    return DateFormat.yMMMd(local).format(DateTime.parse(date));
  return "";
}

String getDateYmd(String? date, {String? local}) {
  if (date != null && date.trim().isNotEmpty)
    return DateFormat.yMd(local).format(DateTime.parse(date));
  return "";
}

String getTime(String? date, {String? local}) {
  if (date != null && date.trim().isNotEmpty)
    return DateFormat.Hms(local).format(DateTime.parse(date));
  return "";
}

launchURL(String? url) async {
  if (url != null) {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

var mainTitle = TextStyle(
  color: Colors.black,
  fontFamily: 'BoutrosAsma',
  fontSize: 24,
);
var subTitle = TextStyle(
  color: Colors.blue,
  fontFamily: 'BoutrosAsma',
  fontSize: 20,
);
var styleTitle = TextStyle(
  fontSize: 20,
  fontFamily: 'BoutrosAsma',
  color: Colors.white,
);
