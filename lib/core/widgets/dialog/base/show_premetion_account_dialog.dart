
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/widgets/dialog/base/simple_dialogs.dart';
import 'package:taknikat/injectoin.dart';

import '../../../../model/perm_model.dart';
import '../../../constent.dart';
import '../../custom_button.dart';
import '../../texts/black_texts.dart';
enum PermissionType{
  like,
  comment,
  add_post,
  add_video,
  add_service,
  add_product,
  add_event,
  toggle_social_info,
  create_album,
  album_photos_count,
  accept_requests
}
bool checkUserPermission(String permissionKey) {

  bool res =kUser?.perms?.any((permission) => permission.key == permissionKey)??false;
  print("dfgdfgpermissionKey resres $res");
  print("dfgdfgpermissionKey resres ${kUser?.perms?.toList()}");

  return res;
}

bool checkUserPermissionWithCount(String permissionKey, int requiredCount) {
  print("checkUserPermissionWithCount requiredCount $requiredCount");
  final permission = kUser?.perms?.firstWhere(
        (perm) => perm.key == permissionKey,
    orElse: () => PermModel(),
  );

  if (permission?.key.isEmpty??true) return false;

  if (permission?.hasCount??false) {
    return permission!.count > requiredCount;
  }else{
    return false;
  }
}

Future<bool> checkPermissionAndShowDialog(BuildContext context, String permissionKey, {
      int? requiredCount,
      String? customMessage,
    }) async {
  bool hasPermission;
    print('asdasdasd customMessage${permissionKey}');
  if (requiredCount != null) {
    hasPermission = checkUserPermissionWithCount(permissionKey, requiredCount);
  } else {
    hasPermission = checkUserPermission( permissionKey);
  }

  if (!hasPermission) {
    await showPermissionDeniedDialog(context, permissionKey, customMessage);
    return false;
  }

  return true;
}

Future showPermissionDeniedDialog(
    BuildContext context,
    String permissionKey,
    String? customMessage,
    ) async =>
    showCustomDialog(
      context,
      _buildPermissionDeniedBody(context, permissionKey, customMessage),
      onDismissCallback: () => context.pop(),
      isCancellable: true,
    );

Widget _buildPermissionDeniedBody(BuildContext context, String permissionKey, String? customMessage) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12.h),
    child: Container(
      color: Colors.white,
      margin: 16.paddingHorizontal,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.clear,
                color: Colors.black,
                size: 25.r,
              ),
            ),
          ),
          16.height,
          Icon(
            Icons.lock_outline,
            color: Colors.red,
            size: 40.r,
          ),
          16.height,
          BlackRegularText(
            label: getLangLocalization('permissionProfile'),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          8.height,
          BlackRegularText(
            label: customMessage ?? getLangLocalization('permissionProfileMess'),
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
          ),
          24.height,
          CustomButton(
            onTap: () {
              context.pop();
            },
            raduis: 50,
            title: getLangLocalization('Ok'),
            width: 100.w,
            height: 35.h,
          ),
        ],
      ),
    ),
  );
}