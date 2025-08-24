import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:url_launcher/url_launcher.dart';

bool kIsShowPayment=false;
class UpdateChecker {
  static Dio dio = Dio();
  static bool tryGetVersion=true;
  static Future<Map<String, dynamic>?> getLatestVersion() async {
    try {
     return await FirebaseFirestore.instance.collection('updates').doc('version_user').get().then((value) {
        print('📍 getLatestVersionversion : ${value.data()}');
        return value.data();
      });
    } catch (e) {
      if(tryGetVersion==false){
        return null;
      }
      Firebase.initializeApp();
      getLatestVersion();
      tryGetVersion=false;
      print("Error fetching version: $e");
    }
    return null;
  }

  static Future<void> checkForUpdate(BuildContext context) async {
    print('checkForUpdate .......');
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    Map<String, dynamic>? latestVersion = await getLatestVersion();
       if(latestVersion != null&&latestVersion['is_hide']!=null && latestVersion['is_hide']==true){
        return;
       }else{
         checkVersion(
             '$currentVersion+$buildNumber',
             latestVersion!,
             context
         );
       }

    }


  static Future<bool?> checkPayment() async {
    try {
      return await FirebaseFirestore.instance.collection('settings').doc('payment').get().then((value) {
        print('📍 checkPaymentCheckPayment : ${value.data()}');
        kIsShowPayment = value.data()?['is_show']??false;
        print('📍 checkPayment55 : ${kIsShowPayment}');
        return value.data()?['is_show']??false;
      });
    } catch (e) {

    }
    return null;
  }
  }

  void checkVersion(String currentVersion, Map<String, dynamic> latestVersion,BuildContext context) {
    final current = Version.parse(currentVersion.trim());
    if (Platform.isAndroid && latestVersion['android_version'] != null) {
      final serverVersion = Version.parse(latestVersion['android_version'].toString().trim());
       print('serverVersion .... :  $serverVersion');
       print('current .... :  $current');
      if (current < serverVersion) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: AlertDialog(
                  title:
                  Text(
                    getLangLocalization('newUpdate'),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  content:
                  Text(
                    getLangLocalization('newUpdateMess'),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        launchUrl(Uri.parse(
                            'https://play.google.com/store/apps/details?id=com.iTO.app&pcampaignid=web_share'));
                      },
                      child:
                      Text(
                        getLangLocalization('updateNow'),
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,
                            color: Colors.blue
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if(latestVersion['is_force']!=null && latestVersion['is_force']==false)
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child:
                        Text(
                          getLangLocalization('later'),
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blue),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),),
        );
      }
    } else if (Platform.isIOS && latestVersion['ios_version'] != null) {
      final serverVersion = Version.parse(latestVersion['ios_version'].toString().trim());
      if (current < serverVersion) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: AlertDialog(
                  title:
                  Text(
                    getLangLocalization('newUpdate'),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  content:
                  Text(
                    getLangLocalization('newUpdateMess'),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        launchUrl(Uri.parse(
                            'https://apps.apple.com/us/app/ito/id6741041097'));
                      },
                      child:
                      Text(
                        getLangLocalization('updateNow'),

                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,
                            color: Colors.blue
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if(latestVersion['is_force']!=null && latestVersion['is_force']==false)
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child:
                        Text(
                          getLangLocalization('later'),
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600,
                              color: Colors.blue
                          ),
                          textAlign: TextAlign.center,
                        ),

                      ),
                  ],
                ),),
        );
      }
    } else {
      print("لا يوجد تحديث متاح");
    }
  }

