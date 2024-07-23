import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:taknikat/Ui/create_share_page/provider/provider.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/bloc/create_event_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/my_events_event.dart';
import 'package:taknikat/Ui/setting_page/my_posts/update_post/update_post_provider.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/core/filters/event_filter.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/filters/shares_filter.dart';
import 'package:taknikat/data/prefs_helper/prefs_helper.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/attributes/attributes.dart';
import 'package:taknikat/model/base_response/base_response.dart';
import 'package:taknikat/model/category_model/category_model.dart';
import 'package:taknikat/model/country/country_model.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/notification/notification.dart';
import 'package:taknikat/model/post_model/post_model.dart';
import 'package:taknikat/model/product_model/comment_model.dart';
import 'package:taknikat/model/product_model/product_model.dart';
import 'package:taknikat/model/project_model/project_model.dart';
import 'package:taknikat/model/reject_model/reject_model.dart';
import 'package:taknikat/model/report_model/report_model.dart';
import 'package:taknikat/model/serializer/serializer.dart';
import 'package:taknikat/model/service_model/service_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';
import 'package:taknikat/model/skill_model/skill_model.dart';
import 'package:taknikat/model/user_base_model/user_base_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';
import 'package:taknikat/model/vendor_detail_model/vendor_detail_model.dart';

import '../../Ui/all_events_page/bloc/events_bloc.dart';
import '../../app/App.dart';
import '../../model/user_country/user_country_model.dart';

class HttpHelper {
  final Dio _dio;
   String? token;
  HttpHelper(this._dio) {
    _dio.interceptors.addAll([
      InterceptorsWrapper(onRequest: (options, handler) async {
         token= await sl<PrefsHelper>().getToken();
        if (token != null && (!(options.extra['withoutToken'] ?? false))) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      }),
      LogInterceptor(
        request: true,
        requestHeader: true,
        responseBody: true,
        requestBody: true,
      ),
    ]);
  }

  Future<BaseResponse<BuiltList<ServiceModel>>> getServicesByCategory(
      int? categoryId,
      {int page = 0}) async {
    try {
      var queryParameters = {"page": page.toString()};
      if (categoryId != null) {
        queryParameters['category'] = categoryId.toString();
      }
      final response = await _dio.get("services",
          queryParameters: queryParameters,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));
      var data = serializers.deserialize(json.decode(response.data),
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ServiceModel),
                ],
              ),
            ],
          ));
      return data as BaseResponse<BuiltList<ServiceModel>>;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<ProjectModel> getProjectDetails(int id) async {
    try {
      final response = await _dio.get("project/" + id.toString());
      var data = serializers.deserialize(
        json.decode(response.data)['content'],
        specifiedType: FullType(ProjectModel),
      );
      return data as ProjectModel;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ProjectModel>>> getAllProjects(int page) async {
    try {
      var queryParameters = {"page": page.toString()};
      final response = await _dio.get("projects",
          queryParameters: queryParameters,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));
      var data = serializers.deserialize(json.decode(response.data),
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ProjectModel),
                ],
              ),
            ],
          ));
      return data as BaseResponse<BuiltList<ProjectModel>>;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ProductModel>>> getRetailsByCategory(
      int? categoryId,
      {int page = 0}) async {
    try {
      var queryParameters = {"page": page.toString()};
      if (categoryId != null) {
        queryParameters['category'] = categoryId.toString();
      }
      final response = await _dio.get("products",
          queryParameters: queryParameters,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }, extra: {
            "withoutToken": true
          }));
      var data = serializers.deserialize(json.decode(response.data),
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ProductModel),
                ],
              ),
            ],
          ));
      return data as BaseResponse<BuiltList<ProductModel>>;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<EventModel>>> getEvents(EventsFilter? filter,
      {required int page}) async {
    try {
      var queryParameters = {
        "page": page,
        if (filter != null) ...filter.toMap()
      };

      final response = await _dio.get(
        "events",
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept-Language": appLanguage,
          },
        ),
      );
      final data = json.decode(response.data);
      print('res type  ${data.runtimeType}');
      data['content'] = data['content']['data'];
      final result = serializers.deserialize(data,
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(EventModel),
                ],
              ),
            ],
          ));
      return result as BaseResponse<BuiltList<EventModel>>;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw throw NetworkException.haundler(e);
    }
  }

  Future<EventModel> getEventByIdOrSlug(dynamic id) async {
    try {
      final response = await _dio.get(
        "events/$id",
        options: Options(
          headers: {
            "Accept-Language": appLanguage,
          },
        ),
      );
      final data = json.decode(response.data);
      print('res type  ${data}');
      data['content'] = data['content']['event'];

      final decode = json.decode(response.data);
      var baseResponse = serializers.deserialize(data['content'],
          specifiedType: FullType(EventModel));
      return baseResponse as EventModel;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ShareModel>>> getSharees(
      int eventId, SharesFilter filter,
      {int page = 0, ShareStatus? status}) async {
    try {
      var queryParameters = {
        "page": page.toString(),
        ...filter.toMap(),
      };

      final response = await _dio.get(
        "events/$eventId",
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept-Language": appLanguage,
          },
        ),
      );
      final jsonData = json.decode(response.data);
      final EventModel event = serializers.deserialize(
          jsonData['content']['event'],
          specifiedType: const FullType(EventModel)) as EventModel;

      jsonData['content'] = jsonData['content']['share'];

      final data = serializers.deserialize(jsonData,
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ShareModel),
                ],
              ),
            ],
          ));
      final ListBuilder<ShareModel> list2 = ListBuilder<ShareModel>();
      final list = (data as BaseResponse<BuiltList<ShareModel>>).content
          as BuiltList<ShareModel>;
      for (int i = 0; i < list.length; i++) {
        list2.add(list[i].rebuild((p0) => p0.event = event.toBuilder()));
      }

      final BaseResponse<BuiltList<ShareModel>> resp = BaseResponse(
        (b) => b
          ..content = list2.build()
          ..result = data.result
          ..error_code = data.error_code
          ..images_prefix = data.images_prefix
          ..paginator = data.paginator?.toBuilder(),
      );
      return resp;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<CategoryModel>>> getCategories(
      String type, int page) async {
    try {
      var queryParameters = {"page": page.toString()};

      final response = await _dio.get('categories?type=$type',
          queryParameters: queryParameters,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));

      final baseResponse = serializers.deserialize(json.decode(response.data),
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(CategoryModel),
                ],
              ),
            ],
          ));
      return baseResponse as BaseResponse<BuiltList<CategoryModel>>;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ProductModel>>> getMyProducts(int page) async {
    try {
      var queryParameters = {"page": page.toString()};

      final response = await _dio.get(
        'my-products',
        queryParameters: queryParameters,
      );

      final products = serializers.deserialize(
        json.decode(response.data),
        specifiedType: FullType(
          BaseResponse,
          [
            FullType(
              BuiltList,
              [
                const FullType(ProductModel),
              ],
            ),
          ],
        ),
      );
      return products as BaseResponse<BuiltList<ProductModel>>;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ProjectModel>>> getMyProjects(int page) async {
    try {
      var queryParameters = {"page": page.toString()};

      final response = await _dio.get(
        'my-projects',
        queryParameters: queryParameters,
      );

      final projects = serializers.deserialize(
        json.decode(response.data),
        specifiedType: FullType(
          BaseResponse,
          [
            FullType(
              BuiltList,
              [
                const FullType(ProjectModel),
              ],
            ),
          ],
        ),
      );
      return projects as BaseResponse<BuiltList<ProjectModel>>;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ServiceModel>>> getMyServices(int page) async {
    try {
      var queryParameters = {"page": page.toString()};

      final response = await _dio.get(
        'my-services',
        queryParameters: queryParameters,
      );

      final services = serializers.deserialize(
        json.decode(response.data),
        specifiedType: FullType(
          BaseResponse,
          [
            FullType(
              BuiltList,
              [
                const FullType(ServiceModel),
              ],
            ),
          ],
        ),
      );
      return services as BaseResponse<BuiltList<ServiceModel>>;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ProjectModel>>> getContractorProjects(
      int storeId, int page) async {
    try {
      var queryParameters = {"page": page.toString()};

      final response = await _dio.get('projects?user_id=' + storeId.toString(),
          queryParameters: queryParameters,
          options: Options(headers: {"Accept-Language": appLanguage}));

      final projects = serializers.deserialize(
        json.decode(response.data),
        specifiedType: FullType(
          BaseResponse,
          [
            FullType(
              BuiltList,
              [
                const FullType(ProjectModel),
              ],
            ),
          ],
        ),
      );
      return projects as BaseResponse<BuiltList<ProjectModel>>;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<UserBaseModel> login(String phone, String password) async {
    // TODO: implement login
    try {
      final formData = {"phone_number": phone, "password": password};

      final response = await _dio.post('user/login',
          data: formData,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));
      print('login Response StatusCode ${response.statusCode}');

      var baseResponse = serializers.deserialize(
          json.decode(response.data)['content'],
          specifiedType: FullType(UserBaseModel));
      print("implement login status : $baseResponse");

      return baseResponse as UserBaseModel;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }
  Future<UserBaseModel> loginWithGoogle({String? name, String? email,String? phone, String? uId}) async {
    // TODO: implement login
    try {
      final formData =
      {
        "provider_type": 'gmail',
        "name": name,
        "email": email,
        "phone_number": phone,
        "uid": uId};

      final response = await _dio.post('user/login-provider',
          data: formData,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));
      print('login Response StatusCode ${response.statusCode}');
      if (response.statusCode == 200) {

      }
      var baseResponse = serializers.deserialize(
          json.decode(response.data)['content'],
          specifiedType: FullType(UserBaseModel));
      print("implement login status : $baseResponse");

      return baseResponse as UserBaseModel;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> sendCode({String? email}) async {
    try {
      final formData = FormData.fromMap({
        "email": email,
      });

      final response = await _dio.post(
        'send-code',
        data: formData,
      );

      // final baseResponse = json.decode(response.data)['result'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<UserBaseModel> register(
      String first_name,
      String last_name,
      String email,
      String password,
      String? mobile,
      // String? gender,
      // bool terms,
      // File avatar,
      // int? country,
      // int? city
      ) async {
    try {
      final formData = FormData.fromMap(
        {
          "password": password,
          "password_confirmation": password,
          "email": email,
          "phone_number": mobile,
          "first_name": first_name,
          "last_name": last_name,
          // "terms": terms,
          // "country": country,
          // "city": city,
          // "gender": (gender?.isNotEmpty ?? false) ? gender : null,
        },
      );
      // if (avatar.path.isNotEmpty) {
      //   formData.files.add(MapEntry(
      //     "avatar",
      //     await MultipartFile.fromFile(avatar.path,
      //         filename: basename(avatar.path)),
      //   ));
      // }
      final response = await _dio.post('user/register',
          data: formData,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));
      final baseResponse = serializers.deserialize(
          json.decode(response.data)['content'],
          specifiedType: FullType(UserBaseModel));
      print("implement register status : $baseResponse");
      return  baseResponse as UserBaseModel;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }
  Future<UserBaseModel> completeProfile(
      String? email,
      String? phone,
      String? gender,
      File avatar,
      int? country,
      int? city
      ) async {
    try {
     final token2= await sl<PrefsHelper>().getToken();

      final formData = FormData.fromMap(
        {
          "email": email,
          "phone_number": phone,
          "country": country,
          "city": city,
          "gender": (gender?.isNotEmpty ?? false) ? gender : null,
        },
      );
      if (avatar.path.isNotEmpty) {
        formData.files.add(MapEntry(
          "avatar",
          await MultipartFile.fromFile(avatar.path,
              filename: basename(avatar.path)),
        ));
      }

      final response = await _dio.post('user/complete-profile',
          data: formData,
          options: Options(headers: {
            "Accept-Language": appLanguage,
            "Authorization": token2,
          }));
      final baseResponse = serializers.deserialize(
          json.decode(response.data)['content'],
          specifiedType: FullType(UserBaseModel));
      print("implement register status : $baseResponse");
      return baseResponse as UserBaseModel;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ProductModel>>> getProductByValue({
    int? pageId,
    required CustomFilter filters,
  }) async {
    // TODO: implement getProductByValue
    try {
      final queryParameters = filters.toMap()
        ..addAll({"page": pageId.toString()});

      final response = await _dio.get('products',
          queryParameters: queryParameters,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }, extra: {
            "withoutToken": true
          }));

      var data = serializers.deserialize(json.decode(response.data),
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ProductModel),
                ],
              ),
            ],
          ));
      return data as BaseResponse<BuiltList<ProductModel>>;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ServiceModel>>> getServiceByValue({
    int pageId = 0,
    CustomFilter filters = const CustomFilter(),
  }) async {
    try {
      final queryParameters = filters.toMap()
        ..addAll({"page": pageId.toString()});

      var url = 'services';

      final response = await _dio.get(url,
          queryParameters: queryParameters,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));

      var data = serializers.deserialize(json.decode(response.data),
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ServiceModel),
                ],
              ),
            ],
          ));
      return data as BaseResponse<BuiltList<ServiceModel>>;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ProjectModel>>> getProjectByValue({
    int pageId = 0,
    CustomFilter filters = const CustomFilter(),
  }) async {
    try {
      var queryParameters = filters.toMap()
        ..addAll({"page": pageId.toString()});

      var url = 'projects';

      final response = await _dio.get(url,
          queryParameters: queryParameters,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));

      var data = serializers.deserialize(json.decode(response.data),
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ProjectModel),
                ],
              ),
            ],
          ));
      return data as BaseResponse<BuiltList<ProjectModel>>;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> registerAsFreelancer(
      {String? first_name,
      String? last_name,
      String? email,
      String? password,
      String? mobile,
      bool? terms,
      File? image,
      String? post_code,
      String? location,
      String? experience_years,
      String? about,
      int? profession_id}) async {
    try {
      final formData = FormData.fromMap(
        {
          "password": password,
          "password_confirmation": password,
          "email": email,
          "phone_number": mobile,
          "first_name": first_name,
          "last_name": last_name,
          "is_designer": 1,
          "terms": terms
        },
      );
      if (image?.path.isNotEmpty ?? false) {
        formData.files.add(MapEntry(
          "avatar",
          await MultipartFile.fromFile(image!.path,
              filename: basename(image.path)),
        ));
      }

      final response = await _dio.post('new-user',
          data: formData,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));
      if (json.decode(response.data)['result'] == "success")
        return true;
      else
        return false;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<BuiltList<Country>> getCountries() async {
    try {
      final response = await _dio.get('countries',
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage
          }));
      final countries =
          serializers.deserialize(json.decode(response.data)['content'],
              specifiedType: FullType(
                BuiltList,
                [
                  const FullType(Country),
                ],
              ));
      return countries as BuiltList<Country>;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<UserModel> getProfile() async {
    try {
      final response = await _dio.get('user/profile');

      final baseResponse =
          serializers.deserialize(json.decode(response.data)['content'],
              specifiedType: FullType(
                UserModel,
              ));
      return baseResponse as UserModel;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<UserCountryModel?> getCountryUsers(String id,String type) async {
    try {
      final response = await _dio.get('get-users',
      data: {
        'type':type,
        'id':id,}
      );
      if (response.statusCode == 200) {
        // Parse JSON response using UserCountryModel.fromJson
        var responseData = json.decode(response.data);
        var userModel = UserCountryModel.fromJson(responseData);

        // Print or handle the parsed userModel
        print("Response: $userModel");

        return userModel;
      } else {
        // Handle non-200 status code
        print("Failed to load data, status code: ${response.statusCode}");
        // throw NetworkException("Failed to load data, status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle Dio errors or JSON parsing errors
      print("NetworkException: ${e.toString()}");
      throw NetworkException.haundler(e.toString());
    }
  }

  Future<UserModel> editUser(
      {String? first_name,
      String? last_name,
      String? email,
      String? facebook,
      String? youtube,
      String? instagram,
      String? linkedin,
      String? twitter,
      String? snapchat,
      String? phone,
      String? gender,
      int? countryId,
      int? cityId,
      String? summary,
      List<SkillModel>? skills,
      File? image}) async {
    try {
      final formData = FormData.fromMap({
        "email": email,
        "facebook": facebook,
        "youtube": youtube,
        "instagram": instagram,
        "linkedin": linkedin,
        // "twitter": twitter,
        "snapchat": snapchat,
        "first_name": first_name,
        "last_name": last_name,
        "phone_number": phone,
        "country": countryId,
        "city": cityId,
        "summary": summary,
        "gender": gender,
      }, ListFormat.multiCompatible);

      if (image != null && image.path.isNotEmpty) {
        formData.files.add(MapEntry(
          "avatar",
          await MultipartFile.fromFile(image.path,
              filename: basename(image.path)),
        ));
      }
      if (skills != null && skills.isNotEmpty) {
        for (var item in skills) {
          formData.fields.add(
            MapEntry("skills[]", item.id.toString()),
          );
        }
      }
      print(formData.fields);

      final response = await _dio.post(
        'user/update',
        data: formData,
      );

      final baseResponse =
          serializers.deserialize(json.decode(response.data)['content']['user'],
              specifiedType: FullType(
                UserModel,
              ));
      return baseResponse as UserModel;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  @override
  Future<UserBaseModel> verfyCode(String email, String activation_code) async {
    try {
      final formData = FormData.fromMap({
        "email": email,
        "activation_code": activation_code,
      });

      final response = await _dio.post(
        'verify-email',
        data: formData,
      );

      var baseResponse = serializers.deserialize(
          json.decode(response.data)['content'],
          specifiedType: FullType(UserBaseModel));

      return baseResponse as UserBaseModel;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<void> deleteAccount(id) async {
    try {
      await _dio.delete(
        'user/delete/$id',
      );
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<UserBaseModel> activateAccountConfirm(
      String email, String activation_code) async {
    try {
      final formData = FormData.fromMap({
        "phone_number": email,
        "activation_code": activation_code,
      });

      final response = await _dio.post('user/activateUser',
          data: formData,
          options: Options(headers: {"Accept-Language": appLanguage}));

      var baseResponse = serializers.deserialize(
          json.decode(response.data)['content'],
          specifiedType: FullType(UserBaseModel));

      return baseResponse as UserBaseModel;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> resetPassword(
    String old_password,
    String password,
    String password_confirmation,
  ) async {
    try {
      final formData = {
        "old_password": old_password,
        "password": password,
        "password_confirmation": password_confirmation
      };

      final response = await _dio.post(
        'reset-password-confirm',
        data: formData,
      );
      print('login Response StatusCode ${response.statusCode}');

      if (response.statusCode == 200) {
        final baseResponse = serializers.deserialize(json.decode(response.data),
            specifiedType: FullType(
              BaseResponse,
              [
                const FullType(UserModel),
              ],
            )) as BaseResponse<UserModel>;
        print("implement rates status : $baseResponse");
        if (baseResponse.error_des == "success") {
          return true;
        } else {
          throw NetworkException(error: '');
        }
      } else {
        throw NetworkException(error: '');
      }
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> contactUs(
      String name, String mail, String title, String message) async {
    try {
      final formData = {
        "name": name,
        "email": mail,
        // "title": title,
        "message": message.replaceAll('\n', '<br>'),
      };
      final response = await _dio.post('contact', data: formData);
      print('contactus Response StatusCode ${response.statusCode}');

      if (response.statusCode == 200) {
        print('contactus Response body  ${response.data}');

        return true;
      } else {
        print("NetworkException 222: ${response.toString()}");
        throw NetworkException(error: '');
      }
    } catch (e) {
      print("NetworkException: ${e.toString()}");
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> updateToken(String firebase_token) async {
    try {
      final response = await _dio.post(
        'users/firebase/update-token',
        data: {
          "firebase_token": firebase_token,
        },
      );

      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<CommentModel>>> getComments(
      String model_type, int model_id, int page) async {
    try {
      final queryParameters = {
        "model_type": model_type,
        "model_id": model_id,
        "page": page
      };
      final response = await _dio.get('comments',
          queryParameters: queryParameters,
          options: Options(headers: {"Accept-Language": appLanguage}));
      final data = serializers.deserialize(json.decode(response.data),
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(CommentModel),
                ],
              ),
            ],
          )) as BaseResponse<BuiltList<CommentModel>>;
      return data;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<Notification>>> getNotfication(int page) async {
    try {
      final response = await _dio.get(
        'users/notifications/user?page=' + page.toString(),
      );

      final decode = json.decode(response.data);
      final list = decode['content'] as List;
      list.forEach((element) {
        if (element['data'] != null) {
          element['data']['model_id'] = element['data']['model_id'].toString();
        }
      });
      final baseResponse = serializers.deserialize(decode,
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(Notification),
                ],
              ),
            ],
          ));
      return baseResponse as BaseResponse<BuiltList<Notification>>;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  Future<String> getAboutus() async {
    try {
      final response = await _dio.get('about-us',
          options: Options(headers: {"Accept-Language": appLanguage}));

      var about = json.decode(response.data);
      return (about['content']['raw']).replaceAll('\n', '<br>');
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  /////////forget password//////

  Future<bool> forgetPassword(String email) async {
    try {
      final formData = {
        "email": email,
      };
      final response = await _dio.post('user/forget-password', data: formData);

      // final baseResponse = json.decode(response.data)['message'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> changePassword(
    String email,
    String reset_token,
    String new_password,
  ) async {
    try {
      final formData = {
        "email": email,
        "reset_token": reset_token,
        "password": new_password,
        "password_confirmation": new_password,
      };
      final response =
          await _dio.post('user/forget-password/confirm', data: formData);
      if (json.decode(response.data)['content'] == 'api.code_not_valid') {
        return false;
      }
      return true;
      // final baseResponse = json.decode(response.data)['message'];
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<Attributes> getAttributes(int? categoryId) async {
    try {
      Map<String, dynamic>? formData;
      if (categoryId != null)
        formData = {
          "category_id": categoryId,
        };

      final response = await _dio.get('mobile-attributes',
          queryParameters: formData,
          options: Options(headers: {"Accept-Language": appLanguage}));

      var baseResponse = serializers.deserialize(
          json.decode(response.data)['content'],
          specifiedType: FullType(Attributes));
      return baseResponse as Attributes;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<BuiltList<SkillModel>> getSkills() async {
    try {
      final response = await _dio.get('skills',
          options: Options(headers: {"Accept-Language": appLanguage}));

      var baseResponse = serializers.deserialize(
        json.decode(response.data)['content'],
        specifiedType: FullType(
          BuiltList,
          [
            const FullType(SkillModel),
          ],
        ),
      );
      return baseResponse as BuiltList<SkillModel>;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> viewCart() async {
    // try {
    //   final response = await _dio.get('view-cart',
    //       options: Options(headers: {"Accept-Language": appLanguage}));
    //
    //   var baseResponse = json.decode(response.data)['content']['display'];
    //   return (baseResponse as bool);
    // } catch (e) {
    //   throw NetworkException.haundler(e);
    // }
    return false;
  }

  Future<bool> changeNotificationStatus() async {
    try {
      final response = await _dio.get('mark-notification-read');

      var baseResponse = json.decode(response.data);
      if (baseResponse['result'] == "success")
        return true;
      else
        return false;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> reviewModel(
    String model_type,
    String model_id,
    String review_content,
    String? parent_review,
    String? parent_user_id,
  ) async {
    try {
      final formData = {
        "model_type": model_type,
        "model_id": model_id,
        "review": 0,
        "review_content": review_content.replaceAll('\n', '<br>'),
        if (parent_review != null) "parent_review": parent_review,
        if (parent_user_id != null) "parent_user_id": parent_user_id,
      };
      final response = await _dio.post('review',
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
      final baseResponse = json.decode(response.data)['result'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }
  Future<bool> updateModel(
      int id,
      String content,) async {
    try {
      final formData = {
        "review_content": content,
      };
      final response = await _dio.post('updateComment/$id',
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
      final baseResponse = json.decode(response.data)['result'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }
  Future<bool> addProject(
      String title, String description, String youtubeUrl, File image) async {
    try {
      final formData = FormData.fromMap({
        "name:" + appLanguage: title,
        "description:" + appLanguage: description.replaceAll('\n', '<br>'),
        "date": DateTime.now().toString(),
        "youtube_link": youtubeUrl,
      });

      if (image.path.isNotEmpty) {
        formData.files.add(MapEntry(
          "featured_image",
          await MultipartFile.fromFile(image.path,
              filename: basename(image.path)),
        ));
      }
      //  for (int i = 0; i < project.images.length; i++) {
      //   if (images[i] != null && images[i].path.isNotEmpty) {
      //     formData.files.add(MapEntry(
      //       "photos[]",
      //       await MultipartFile.fromFile(images[i].path,
      //           filename: basename(images[i].path)),
      //     ));
      //   }
      // }
      final response = await _dio.post('projects/create',
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
      final baseResponse = json.decode(response.data)['result'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> editProject(int id, String title, String description,
      String youtubeUrl, File image) async {
    try {
      final formData = FormData.fromMap({
        "name:" + appLanguage: title,
        "description:" + appLanguage: description.replaceAll('\n', '<br>'),
        "date": DateTime.now().toString(),
        "youtube_link": youtubeUrl,
      });

      if (image != null && image.path.isNotEmpty) {
        formData.files.add(MapEntry(
          "featured_image",
          await MultipartFile.fromFile(image.path,
              filename: basename(image.path)),
        ));
      }
      final response = await _dio.post('projects/update/' + id.toString(),
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
      final baseResponse = json.decode(response.data)['result'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> removeProject(
    ProjectModel project,
  ) async {
    try {
      final response =
          await _dio.delete('projects/delete/' + project.id.toString(),
              options: Options(headers: {
                "Accept-Currency": appCurrency,
                "Accept-Language": appLanguage,
              }));
      final baseResponse = json.decode(response.data)['result'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> addProduct(String? title, String? description, num? price,
      int? categoryId, File? image, List<File?>? images) async {
    try {
      final formData = FormData.fromMap({
        "name:" + appLanguage: title,
        "description:" + appLanguage: description?.replaceAll('\n', '<br>'),
        "date": DateTime.now().toString(),
        "price": price,
        "category": categoryId,
        "is_new": 1
      });

      if (image?.path.isNotEmpty ?? false) {
        formData.files.add(MapEntry(
          "featured_image",
          await MultipartFile.fromFile(image!.path,
              filename: basename(image.path)),
        ));
      }
      if (images != null)
        for (int i = 0; i < images.length; i++) {
          if (images[i] != null && images[i]!.path.isNotEmpty) {
            formData.files.add(MapEntry(
              "images[]",
              await MultipartFile.fromFile(images[i]!.path,
                  filename: basename(images[i]!.path)),
            ));
          }
        }
      final response = await _dio.post('products/create',
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
      final baseResponse = json.decode(response.data)['result'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> editProduct(int? id, String? title, String? description,
      String? price, int? categoryId, File? image, List<File?>? images) async {
    try {
      final formData = FormData.fromMap({
        "name:" + appLanguage: title,
        "description:" + appLanguage: description?.replaceAll('\n', '<br>'),
        "date": DateTime.now().toString(),
        "price": price,
        "category": categoryId,
        "is_new": 1
      });

      if (image != null && image.path.isNotEmpty) {
        formData.files.add(MapEntry(
          "featured_image",
          await MultipartFile.fromFile(image.path,
              filename: basename(image.path)),
        ));
      }
      if (images != null)
        for (int i = 0; i < images.length; i++) {
          if (images[i] != null && images[i]!.path.isNotEmpty) {
            formData.files.add(MapEntry(
              "images[]",
              await MultipartFile.fromFile(images[i]!.path,
                  filename: basename(images[i]!.path)),
            ));
          }
        }
      final response = await _dio.post('products/update/' + id.toString(),
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
      final baseResponse = json.decode(response.data)['result'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> removeProduct(
    ProductModel project,
  ) async {
    try {
      final response =
          await _dio.delete('products/delete/' + project.id.toString(),
              options: Options(headers: {
                "Accept-Currency": appCurrency,
                "Accept-Language": appLanguage,
              }));
      //  final baseResponse = json.decode(response.data)['result'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> addService(String? title, String? description, String? price,
      int? categoryId, File? image, List<File>? images) async {
    try {
      final formData = FormData.fromMap({
        "name:" + appLanguage: title,
        "description:" + appLanguage: description?.replaceAll('\n', '<br>'),
        "date": DateTime.now().toString(),
        "price": price,
        "category": categoryId,
        "is_new": 1
      });

      if (image?.path.isNotEmpty ?? false) {
        formData.files.add(MapEntry(
          "featured_image",
          await MultipartFile.fromFile(image!.path,
              filename: basename(image.path)),
        ));
      }
      if (images != null)
        for (int i = 0; i < images.length; i++) {
          if (images[i] != null && images[i].path.isNotEmpty) {
            formData.files.add(MapEntry(
              "images[]",
              await MultipartFile.fromFile(images[i].path,
                  filename: basename(images[i].path)),
            ));
          }
        }
      final response = await _dio.post('services/create',
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
      final baseResponse = json.decode(response.data)['result'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> editService(int? id, String? title, String? description,
      String? price, int? categoryId, File? image, List<File>? images) async {
    try {
      final formData = FormData.fromMap({
        "name:" + appLanguage: title,
        "description:" + appLanguage: description?.replaceAll('\n', '<br>'),
        "date": DateTime.now().toString(),
        "price": price,
        "category": categoryId,
        "is_new": 1
      });

      if (image != null && image.path.isNotEmpty) {
        formData.files.add(MapEntry(
          "featured_image",
          await MultipartFile.fromFile(image.path,
              filename: basename(image.path)),
        ));
      }
      if (images != null)
        for (int i = 0; i < images.length; i++) {
          if (images[i] != null && images[i].path.isNotEmpty) {
            formData.files.add(MapEntry(
              "images[]",
              await MultipartFile.fromFile(images[i].path,
                  filename: basename(images[i].path)),
            ));
          }
        }
      final response = await _dio.post('services/update/' + id.toString(),
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
      final baseResponse = json.decode(response.data)['result'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> removeService(
    ServiceModel service,
  ) async {
    try {
      final response =
          await _dio.delete('services/delete/' + service.id.toString(),
              options: Options(headers: {
                "Accept-Currency": appCurrency,
                "Accept-Language": appLanguage,
              }));
      final baseResponse = json.decode(response.data)['result'];
      return true;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<UserModel>>> getAllUsers(int page) async {
    try {
      var queryParameters = {"page": page.toString()};
      final response = await _dio.get('user',
          queryParameters: queryParameters,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));

      final users = serializers.deserialize(json.decode(response.data),
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(UserModel),
                ],
              ),
            ],
          ));
      return users as BaseResponse<BuiltList<UserModel>>;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ShareModel>>> getAllRecentShares(
      int page) async {
    try {
      var queryParameters = {"page": page.toString(), "new": "new"};
      final response = await _dio.get('shares',
          queryParameters: queryParameters,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));
      final data = json.decode(response.data);
      final newData = json.decode(response.data);
      newData["content"] = data["content"]["data"];
      final shares = serializers.deserialize(newData,
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ShareModel),
                ],
              ),
            ],
          ));

      return shares as BaseResponse<BuiltList<ShareModel>>;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<UserModel> getUserById(int id) async {
    try {
      final response = await _dio.get('user/profile/$id',
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));

      final UserModel user = serializers.deserialize(
          json.decode(response.data)['content'],
          specifiedType: FullType(UserModel)) as UserModel;
      return user;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<VendorDetailModel> getVendorDetails(int id) async {
    try {
      final response = await _dio.get('user/profile/' + id.toString(),
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));

      var data = serializers.deserialize(
        json.decode(response.data)['content'],
        specifiedType: FullType(VendorDetailModel),
      );
      return data as VendorDetailModel;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<void> share(List<ShareData> shareDataList, int eventId) async {
    try {
      print(shareDataList.map((e) => e.description));
      print(shareDataList.map((e) => e.image));
      print('eventId $eventId');
      FormData data = FormData.fromMap({
        'event_id': eventId,
      });
      for(var a in shareDataList){
        data.files.add(MapEntry(
          'image[]',
          await MultipartFile.fromFile(a.image!.path, filename: a.image!.path),
        ));
        data.fields.add(MapEntry(
          'description[]',
          a.description
        ));
      }


      await _dio.post('events/share/create',
          data: data,
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));

    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  Future<void> deleteShare(int id) async {
    try {
      await _dio.delete('events/share/delete/$id',
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  Future<void> updateShare(
    ShareData shareData,
    int shareId,
  ) async {
    try {
      final formData = await shareData.toMap();
      await _dio.post('events/share/update/$shareId',
          data: FormData.fromMap(formData),
          options: Options(headers: {
            "Accept-Language": appLanguage,
          }));
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ShareModel>>> getRecentlyShares() async {
    try {
      final response = await _dio.get(
        "shares?limit=4&new=new",
        options: Options(
          headers: {
            "Accept-Language": appLanguage,
          },
        ),
      );
      final jsonData = json.decode(response.data);
      jsonData['paginator'] = null;
      jsonData['content'] = jsonData['content']['data'];
      final data = serializers.deserialize(jsonData,
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ShareModel),
                ],
              ),
            ],
          ));
      return data as BaseResponse<BuiltList<ShareModel>>;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ShareModel>>> getMyShare(
      {int page = 0, required ShareStatus status}) async {
    var queryParameters = {"page": page, "status": status.name};
    try {
      final response = await _dio.get(
        "my-share",
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept-Language": appLanguage,
          },
        ),
      );
      final jsonData = json.decode(response.data);
      final data = serializers.deserialize(jsonData,
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ShareModel),
                ],
              ),
            ],
          ));
      return data as BaseResponse<BuiltList<ShareModel>>;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  Future<ShareModel> getShareById(int id) async {
    try {
      final response = await _dio.get(
        "events/share/show/$id",
        options: Options(
          headers: {
            "Accept-Language": appLanguage,
          },
        ),
      );

      final decode = json.decode(response.data);
      decode['content']['event'] = decode['content']['event_share'];
      var baseResponse = serializers.deserialize(decode['content'],
          specifiedType: FullType(ShareModel));

      return baseResponse as ShareModel;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  Future<PostModel> getPostById(int id) async {
    try {
      final response = await _dio.get(
        "posts/$id",
        options: Options(
          headers: {
            "Accept-Language": appLanguage,
          },
        ),
      );

      final decode = json.decode(response.data);
      var baseResponse = serializers.deserialize(decode['content'],
          specifiedType: FullType(PostModel));

      return baseResponse as PostModel;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  Future<ServiceModel> getServiceById(dynamic id) async {
    try {
      final response = await _dio.get(
        "services/$id",
        options: Options(headers: {
          "Accept-Language": appLanguage,
        }, extra: {
          "withoutToken": true
        }),
      );

      final decode = json.decode(response.data);
      var baseResponse = serializers.deserialize(decode,
          specifiedType: FullType(ServiceModel));

      return baseResponse as ServiceModel;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  Future<ProductModel> getProductByIdOrSlug(dynamic id) async {
    try {
      final response = await _dio.get(
        "products/$id",
        options: Options(headers: {
          "Accept-Language": appLanguage,
        }, extra: {
          "withoutToken": true
        }),
      );

      final decode = json.decode(response.data);
      var baseResponse = serializers.deserialize(decode['content'],
          specifiedType: FullType(ProductModel));

      return baseResponse as ProductModel;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  Future<ProjectModel> getProjectByIdOrSlug(dynamic id) async {
    try {
      final response = await _dio.get(
        "projects/$id",
        options: Options(headers: {
          "Accept-Language": appLanguage,
        }, extra: {
          "withoutToken": true
        }),
      );

      final decode = json.decode(response.data);
      var baseResponse = serializers.deserialize(decode,
          specifiedType: FullType(ProjectModel));

      return baseResponse as ProjectModel;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<ShareModel>>> getUserShares(int id,
      {int page = 0}) async {
    var queryParameters = {"page": page};
    try {
      final response = await _dio.get(
        "my-share",
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept-Language": appLanguage,
          },
        ),
      );
      final jsonData = json.decode(response.data);
      final data = serializers.deserialize(jsonData,
          specifiedType: FullType(
            BaseResponse,
            [
              FullType(
                BuiltList,
                [
                  const FullType(ShareModel),
                ],
              ),
            ],
          ));
      return data as BaseResponse<BuiltList<ShareModel>>;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw NetworkException.haundler(e);
    }
  }

  ///report
  Future<BuiltList<ReportModel>> getReports() async {
    try {
      final response = await _dio.get('reporting',
          options: Options(headers: {"Accept-Language": appLanguage}));
      var baseResponse = serializers.deserialize(
        json.decode(response.data)['content']['data'],
        specifiedType: FullType(
          BuiltList,
          [
            const FullType(ReportModel),
          ],
        ),
      );
      return baseResponse as BuiltList<ReportModel>;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<void> report(
      String modelType, String modelId, String reportContent) async {
    try {
      final formData = {
        "model_id": modelId,
        "model_type": modelType,
        "report_id": reportContent,
      };
      await _dio.post('reporting',
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  ///reject
  Future<BuiltList<RejectModel>> getRejectReasons() async {
    try {
      final response = await _dio.get('reporting',
          options: Options(headers: {"Accept-Language": appLanguage}));
      var baseResponse = serializers.deserialize(
        json.decode(response.data)['content']['data'],
        specifiedType: FullType(
          BuiltList,
          [
            const FullType(RejectModel),
          ],
        ),
      );
      return baseResponse as BuiltList<RejectModel>;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<void> updateShareStatus(
    String modelId,
    String text,
    String status, [
    String? rejectReasonId,
  ]) async {
    try {
      final formData = {
        "status": status,
        "rejectOptionReason": text,
        if (rejectReasonId != null) "denied_option": rejectReasonId,
      };
      await _dio.post('events/share/update-status/$modelId',
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  /// posts
  Future<BaseResponse<BuiltList<PostModel>>> getVendorPosts(
      int page, int id) async {
    try {
      var queryParameters = {"page": page};
      final response =
          await _dio.get('posts-by-user/$id', queryParameters: queryParameters);
      final posts = serializers.deserialize(
        json.decode(response.data),
        specifiedType: FullType(
          BaseResponse,
          [
            FullType(
              BuiltList,
              [
                const FullType(PostModel),
              ],
            ),
          ],
        ),
      );
      return posts as BaseResponse<BuiltList<PostModel>>;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<PostModel>>> getMyPosts(int page) async {
    try {
      var queryParameters = {"page": page};
      final response =
          await _dio.get('my-posts', queryParameters: queryParameters);

      final posts = serializers.deserialize(
        json.decode(response.data),
        specifiedType: FullType(
          BaseResponse,
          [
            FullType(
              BuiltList,
              [
                const FullType(PostModel),
              ],
            ),
          ],
        ),
      );
      return posts as BaseResponse<BuiltList<PostModel>>;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<void> likePost(int id) async {
    try {
      await _dio.get(
        'like-post/$id',
      );
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<BaseResponse<BuiltList<PostModel>>> getPosts(int page) async {
    try {
      var queryParameters = {"page": page};
      final response =
          await _dio.get('posts', queryParameters: queryParameters);

      final posts = serializers.deserialize(
        json.decode(response.data),
        specifiedType: FullType(
          BaseResponse,
          [
            FullType(
              BuiltList,
              [
                const FullType(PostModel),
              ],
            ),
          ],
        ),
      );
      return posts as BaseResponse<BuiltList<PostModel>>;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<void> removePost(
    PostModel post,
  ) async {
    try {
      await _dio.delete('/posts/delete/${post.id!}',
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<void> removePostImage(
    String image,
    int id,
  ) async {
    try {
      image = image.substring(image.lastIndexOf('posts/') + 7);
      await _dio.get(
          '/user/removeImage?model=App\\Models\\Post&id=$id&image=posts/$image&attribute=images',
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<void> addPost(List<PostModel> posts) async {
    try {
      final formData = await toCreatePostModel(posts);
      await _dio.post('posts/create',
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<void> addSubPost(
      String description, List<File> images, String parentId) async {
    try {
      final _images = [];

      for (var image in images) {
        _images.add(await MultipartFile.fromFile(image.path,
            filename: basename(image.path)));
      }

      final formData = FormData.fromMap({
        "description": description.replaceAll('\n', '<br>'),
        "parent_id": parentId,
        'images': _images
      }, ListFormat.multiCompatible);

      await _dio.post('posts/create_post',
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<void> editPost(
    int? id,
    String description,
    List<File> images,
    List<String> imagesToRemove,
    List<SubPostParam> subPosts,
  ) async {
    try {
      /// init main post
      final map = {
        "description": description.replaceAll('\n', '<br>'),
        'images': await formatImages(images),
        'removed_images': formatImagesToRemove(imagesToRemove),
      };

      /// init sub posts
      int postsIdCounter = 0;
      for (int i = 0; i < subPosts.length; i++) {
        final SubPostParam element = subPosts[i];
        final id;
        if (element.id != null) {
          id = element.id!;
          map['post[$id][id]'] = id;
        } else {
          id = postsIdCounter;
          postsIdCounter++;
        }
        map['post[$id][description]'] = element.desc;
        if (element.images.isNotEmpty)
          map['post[$id][images]'] = await formatImages(element.images);
        if (element.removedImages.isNotEmpty)
          map['post[$id][removed_images]'] =
              formatImagesToRemove(element.removedImages);
      }

      /// request
      final formData = FormData.fromMap(map, ListFormat.multiCompatible);

      await _dio.post('posts/update/$id',
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  // Events
  Future<void> addEvent(SubmitEventParam param) async {
    try {
      final formData = FormData.fromMap({
        "name:ar": param.name,
        "description:ar": '<p><strong>${param.desc}</strong></p>',
        "status": 1,
        "activations_count": param.number,
        "start_date": param.startDate.toString(),
        "end_date": param.endDate.toString(),
      });

      formData.files.add(MapEntry(
        "featured_image",
        await MultipartFile.fromFile(param.image.path,
            filename: basename(param.image.path)),
      ));

      await _dio.post('events/create',
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<BuiltList<EventModel>> getMyEvents(int page) async {
    try {
      var queryParameters = {"page": page.toString()};

      final response = await _dio.get(
        'my-events',
        queryParameters: queryParameters,
      );
      final events =
          serializers.deserialize(json.decode(response.data)['content']['data'],
              specifiedType: FullType(
                BuiltList,
                [
                  const FullType(EventModel),
                ],
              ));
      return events as BuiltList<EventModel>;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<BuiltList<EventModel>> getVendorEvents(int page, int id) async {
    try {
      var queryParameters = {"page": page};
      final response = await _dio.get('events/by-user/$id?limit=50',
          queryParameters: queryParameters);
      final decode = json.decode(response.data);
      final events = serializers.deserialize(
        decode['content']['data'],
        specifiedType: FullType(
          BuiltList,
          [
            const FullType(EventModel),
          ],
        ),
      );
      return events as BuiltList<EventModel>;
    } catch (e) {
      throw throw NetworkException.haundler(e);
    }
  }

  Future<void> editEvent(EditEventParam param) async {
    try {
      final formData = FormData.fromMap({
        "name:ar": param.name,
        "description:ar": '<p><strong>${param.desc}</strong></p>',
        "status": 1,
        "start_date": param.startDate.toString(),
        "end_date": param.endDate.toString(),
      });
      //if the image is the old image do not send it
      if (!param.image.path.startsWith('http'))
        formData.files.add(MapEntry(
          "featured_image",
          await MultipartFile.fromFile(param.image.path,
              filename: basename(param.image.path)),
        ));
      print(formData);
      await _dio.post('events/update/${param.id}',
          data: formData,
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<void> removeEvent(
    EventModel event,
  ) async {
    try {
      await _dio.delete('events/delete/${event.id}',
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }

  Future<bool> getBlockingSettings() async {
    try {
      final response = await _dio.get('settings',
          options: Options(headers: {
            "Accept-Currency": appCurrency,
            "Accept-Language": appLanguage,
          }));

      final decode = json.decode(response.data);
      return decode['content'] as bool;
    } catch (e) {
      throw NetworkException.haundler(e);
    }
  }
}

Future<FormData> toCreatePostModel(List<PostModel> posts) async {
  late final Map<String, dynamic> json;

  ///Parent post
  if (posts.first.addedImages?.isNotEmpty ?? false) {
    List<MultipartFile> images = [];
    for (var image in posts.first.addedImages!) {
      images.add(
        await MultipartFile.fromFile(image.path,
            filename: basename(image.path)),
      );
    }
    json = {
      "description": posts.first.description!.replaceAll('\n', '<br>'),
      'images': images
    };
  }

  ///SubPosts

  for (int i = 1; i < posts.length; i++) {
    List<MultipartFile> images = [];
    if (posts[i].addedImages?.isNotEmpty ?? false)
      for (var image in posts[i].addedImages!) {
        images.add(await MultipartFile.fromFile(image.path,
            filename: basename(image.path)));

        json.addAll({
          'post[${i - 1}][description]':
              posts[i].description!.replaceAll('\n', '<br>') ?? "",
          'post[${i - 1}][images]': images,
        });
      }
  }

  final x = FormData.fromMap(json, ListFormat.multiCompatible);
  return x;
}

List<String> formatImagesToRemove(List<String> imagesToRemove) {
  final List<String> _imagesToRemove = [];
  imagesToRemove.forEach((element) {
    if (element.startsWith('http')) {
      final path = element.substring(element.lastIndexOf('storage/') + 8);
      _imagesToRemove.add(path);
    }
  });
  return _imagesToRemove;
}

Future<List<MultipartFile>> formatImages(List<File> images) async {
  final List<MultipartFile> _images = [];
  for (var image in images) {
    _images.add(await MultipartFile.fromFile(image.path,
        filename: basename(image.path)));
  }
  return _images;
}
