// import 'package:json_annotation/json_annotation.dart';
//
//
//
// class NotificationModel {
//
//   int?  userId;
//   String?  title;
//   String?  message;
//   String?  createdAt;
//   String?  image;
//   String?  userName;
//   NotificationData?  data;
//   int?  read;
//
//   NotificationModel(
//       {this.userId,
//       this.title,
//       this.message,
//       this.createdAt,
//       this.image,
//       this.userName,
//       this.data,
//       this.read});
//
//   Map<String, dynamic> toMap() {
//     return {
//       'user_id': this.userId,
//       'title': this.title,
//       'message': this.message,
//       'created_at': this.createdAt,
//       'image': this.image,
//       'user_name': this.userName,
//       'data': this.data,
//       'read': this.read,
//     };
//   }
//
//   factory NotificationModel.fromMap(Map<String, dynamic> map) {
//     return NotificationModel(
//       userId: map['user_id'] as int?,
//       title: map['title'] as String?,
//       message: map['message'] as String?,
//       createdAt: map['created_at'] as String?,
//       image: map['image'] as String?,
//       userName: map['user_name'] as String?,
//       data: map['data'] != null ? NotificationData.fromJson(map['data'] as Map<String, dynamic>) : null,
//       read: map['read'] as int?,
//     );
//   }
//
// }
// class NotificationData {
//   String? modelType;
//   dynamic modelId;
//   String? slug;
//   String? comment;
//   dynamic denied;
//
//   NotificationData({this.modelType, this.modelId, this.slug, this.comment, this.denied});
//
//   Map<String, dynamic> toJson() {
//     return {
//       'model_type': this.modelType,
//       'model_id': this.modelId,
//       'slug': this.slug,
//       'comment': this.comment,
//       'denied': this.denied,
//     };
//   }
//
//   factory NotificationData.fromJson(Map<String, dynamic> map) {
//     return NotificationData(
//       modelType: map['model_type'] as String,
//       modelId: map['model_id'] as dynamic,
//       slug: map['slug'] as String,
//       comment: map['comment'] as String,
//       denied: map['denied'] as dynamic,
//     );
//   }
// }
//
