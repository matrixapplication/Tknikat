library serializer;

import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:taknikat/model/attributes/attributes.dart';
import 'package:taknikat/model/base_response/base_response.dart';
import 'package:taknikat/model/category_model/category_model.dart';
import 'package:taknikat/model/city/city.dart';
import 'package:taknikat/model/country/country_model.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/notification/notification.dart';
import 'package:taknikat/model/notification/notification_data.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/post_model/post_model.dart';
import 'package:taknikat/model/product_model/comment_model.dart';
import 'package:taknikat/model/product_model/product_model.dart';
import 'package:taknikat/model/project_model/project_model.dart';
import 'package:taknikat/model/reject_model/reject_model.dart';
import 'package:taknikat/model/report_model/report_model.dart';
import 'package:taknikat/model/service_model/service_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';
import 'package:taknikat/model/skill_model/skill_model.dart';
import 'package:taknikat/model/user_base_model/user_base_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';
import 'package:taknikat/model/vendor_detail_model/vendor_detail_model.dart';

import '../perm_model.dart';

part 'serializer.g.dart';

@SerializersFor(const [
  BaseResponse,
  ProjectModel,
  ServiceModel,
  CategoryModel,
  // NotificationData,
  UserModel,
  PermModel,

  VendorDetailModel,
  UserBaseModel,
  Paginator,
  Attributes,
  Notification,
  SkillModel,
  CommentModel,
  Country,
  City,
  EventModel,
  ShareModel,
  ReportModel,
  RejectModel,
  PostModel,
  EventStatus,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(EventStatus.serializer)
      ..addBuilderFactory(const FullType(EventStatus), () => EventStatus)
      ..addBuilderFactory(
          const FullType(ReportModel), () => ListBuilder<ReportModel>())
      ..addBuilderFactory(
          const FullType(RejectModel), () => ListBuilder<RejectModel>())
      ..addBuilderFactory(
          const FullType(PostModel), () => ListBuilder<PostModel>())
      ..addBuilderFactory(const FullType(VendorDetailModel),
          () => ListBuilder<VendorDetailModel>())
      ..addBuilderFactory(
          const FullType(SkillModel), () => ListBuilder<SkillModel>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              const FullType(Paginator),
            ],
          )),
          () => ListBuilder<Paginator>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(ProductModel),
            ],
          )),
          () => ListBuilder<ProductModel>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(ReportModel),
            ],
          )),
          () => ListBuilder<ReportModel>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(RejectModel),
            ],
          )),
          () => ListBuilder<RejectModel>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(PostModel),
            ],
          )),
          () => ListBuilder<PostModel>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(ProjectModel),
            ],
          )),
          () => ListBuilder<ProjectModel>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(CommentModel),
            ],
          )),
          () => ListBuilder<CommentModel>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(ServiceModel),
            ],
          )),
          () => ListBuilder<ServiceModel>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(EventModel),
            ],
          )),
          () => ListBuilder<EventModel>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ProductModel),
                ],
              ),
            ],
          )),
          () => BaseResponseBuilder<BuiltList<ProductModel>>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ReportModel),
                ],
              ),
            ],
          )),
          () => BaseResponseBuilder<BuiltList<ReportModel>>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(RejectModel),
                ],
              ),
            ],
          )),
          () => BaseResponseBuilder<BuiltList<RejectModel>>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(PostModel),
                ],
              ),
            ],
          )),
          () => BaseResponseBuilder<BuiltList<PostModel>>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              const FullType(ProductModel),
            ],
          )),
          () => BaseResponseBuilder<ProductModel>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              const FullType(ReportModel),
            ],
          )),
          () => BaseResponseBuilder<ReportModel>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              const FullType(RejectModel),
            ],
          )),
          () => BaseResponseBuilder<RejectModel>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              const FullType(PostModel),
            ],
          )),
          () => BaseResponseBuilder<PostModel>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              const FullType(ServiceModel),
            ],
          )),
          () => BaseResponseBuilder<ServiceModel>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ProjectModel),
                ],
              ),
            ],
          )),
          () => BaseResponseBuilder<BuiltList<ProjectModel>>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(CommentModel),
                ],
              ),
            ],
          )),
          () => BaseResponseBuilder<BuiltList<CommentModel>>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(Country),
            ],
          )),
          () => ListBuilder<Country>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(UserModel),
            ],
          )),
          () => ListBuilder<UserModel>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(City),
            ],
          )),
          () => ListBuilder<City>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ServiceModel),
                ],
              ),
            ],
          )),
          () => BaseResponseBuilder<BuiltList<ServiceModel>>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(UserModel),
                ],
              ),
            ],
          )),
          () => BaseResponseBuilder<BuiltList<UserModel>>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(CategoryModel),
                ],
              ),
            ],
          )),
          () => BaseResponseBuilder<BuiltList<CategoryModel>>())
      ..addBuilderFactory(
          (FullType(
            List,
            [
              const FullType(SkillModel),
            ],
          )),
          // Todo check type
          () => <SkillModel>[])
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              const FullType(Paginator),
            ],
          )),
          () => BaseResponseBuilder<Paginator>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              const FullType(UserBaseModel),
            ],
          )),
          () => BaseResponseBuilder<UserBaseModel>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              const FullType(UserModel),
            ],
          )),
          () => BaseResponseBuilder<UserModel>())
      ..addBuilderFactory((const FullType(Attributes)), () => Attributes())
      // ..addBuilderFactory(
      //     (const FullType(NotificationData)), () => NotificationData())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(Notification),
            ],
          )),
          () => BaseResponseBuilder<Notification>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(Notification),
                ],
              ),
            ],
          )),
          () => BaseResponseBuilder<BuiltList<Notification>>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(Notification),
            ],
          )),
          () => ListBuilder<Notification>())
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(EventModel),
            ],
          )),
          () => BaseResponseBuilder<EventModel>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              FullType(EventModel),
            ],
          )),
          () => ListBuilder<EventModel>())
      ..addBuilderFactory(
        (FullType(
          BaseResponse,
          [
            FullType(
              BuiltList,
              [
                const FullType(EventModel),
              ],
            ),
          ],
        )),
        () => BaseResponseBuilder<BuiltList<EventModel>>(),
      )
      ..addBuilderFactory(
          (FullType(
            BaseResponse,
            [
              FullType(ShareModel),
            ],
          )),
          () => BaseResponseBuilder<ShareModel>())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              FullType(ShareModel),
            ],
          )),
          () => ListBuilder<ShareModel>())
      ..addBuilderFactory(
        (FullType(
          BaseResponse,
          [
            FullType(
              BuiltList,
              [
                const FullType(ShareModel),
              ],
            ),
          ],
        )),
        () => BaseResponseBuilder<BuiltList<ShareModel>>(),
      ))
    .build();
