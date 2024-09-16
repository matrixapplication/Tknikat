import 'dart:io';

import 'package:built_collection/src/list.dart';
import 'package:taknikat/Ui/create_share_page/provider/provider.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/bloc/create_event_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/my_events_event.dart';
import 'package:taknikat/Ui/setting_page/my_posts/update_post/update_post_provider.dart';
import 'package:taknikat/core/filters/event_filter.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/filters/shares_filter.dart';
import 'package:taknikat/data/http_helper/http_helper.dart';
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
import 'package:taknikat/model/service_model/service_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';
import 'package:taknikat/model/skill_model/skill_model.dart';
import 'package:taknikat/model/user_base_model/user_base_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';
import 'package:taknikat/model/vendor_detail_model/vendor_detail_model.dart';

import '../../core/notifications_service.dart';
import '../../model/user_country/user_country_model.dart';

class Repository {
  HttpHelper _ihttpHelper;
  PrefsHelper _iprefHelper;

  Repository(this._ihttpHelper, this._iprefHelper);

  Future<String> getAppLanguage() async {
    return await _iprefHelper.getAppLanguage();
  }

  Future<void> setAppLanguage(String value) async {
    await _iprefHelper.setAppLanguage(value);
  }

  Future<void> setNotification(bool value) async {
    await _iprefHelper.setNotification(value);
  }

  Future<bool> getNotification() async {
    return await _iprefHelper.getNotification();
  }

  Future<BaseResponse<BuiltList<CategoryModel>>> getCategories(
      String type, int page) async {
    final categories = await _ihttpHelper.getCategories(type, page);
    return categories;
  }

  Future<BaseResponse<BuiltList<ProductModel>>> getMyProducts(int page) async {
    final data = await _ihttpHelper.getMyProducts(page);
    return data;
  }

  Future<BaseResponse<BuiltList<ServiceModel>>> getMyServices(int page) async {
    final data = await _ihttpHelper.getMyServices(page);
    return data;
  }

  Future<BuiltList<EventModel>> getMyEvents(int page) async {
    final data = await _ihttpHelper.getMyEvents(page);
    return data;
  }

  Future<BaseResponse<BuiltList<ProjectModel>>> getMyProjects(int page) async {
    final data = await _ihttpHelper.getMyProjects(page);
    return data;
  }

  Future<BaseResponse<BuiltList<ProjectModel>>> getContractorProjects(
      int contractorId, int page) async {
    final projects =
        await _ihttpHelper.getContractorProjects(contractorId, page);
    return projects;
  }

  Future<bool> getIsLogin() async {
    // TODO: implement getIsLogin
    return await _iprefHelper.getIsLogin();
  }

  Future<UserBaseModel> login(String phone, String password) async {
    final userbase = await _ihttpHelper.login(phone, password);
    await saveUser(userbase);
    return userbase;
  }
  Future<UserBaseModel> loginWithGoogle({String? name, String? email,String? phone, String? uId}) async {
    final userBase = await _ihttpHelper.loginWithGoogle(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
    );
    await saveUser(userBase);
    return userBase;
  }

  Future<UserBaseModel> register(
      String first_name,
      String last_name,
      String email,
      String password,
      String mobile,
      // String? gender,
      // bool terms,
      // File image,
      // int? country,
      // int? city
      ) async {
    final user = await _ihttpHelper.register(first_name, last_name,email,
        password, mobile,
      // gender,
        // terms, image, country, city
    );
    // await saveUser(user);
    return user;
  }
  Future<UserBaseModel> completeProfile(
      String? email,
      String? gender,
      String phone,
      File image,
      int? country,
      int? city
      ) async {
    final user = await _ihttpHelper.completeProfile(
        email,
        phone ,gender,
        image, country, city
    );
    await saveUser(user);
    return user;
  }

  Future<bool> sendCode({required String email}) async {
    return await _ihttpHelper.sendCode(
      email: email,
    );
  }  Future<bool> sendEmailCode({required String email}) async {
    return await _ihttpHelper.senEmailCode(
      email: email,
    );
  }

  Future<bool> logout() async {
    appAuthState = false;

    final appLogout = await _iprefHelper.logout();
    return appLogout;
  }

  Future<bool> deleteAccount() async {
    await _ihttpHelper.deleteAccount((await _iprefHelper.getUser()).id);
    final appLogout = await _iprefHelper.logout();
    appAuthState = false;
    return appLogout;
  }

  Future<UserModel> getUser() async {
    final user = await _iprefHelper.getUser();
    appUser=user;
    return user;
  }
  Future<UserCountryModel?> getCountryUsers(String id,String type) async {
    final res = await _ihttpHelper.getCountryUsers(id,type);
    return res;
  }

  Future<BaseResponse<BuiltList<ProductModel>>> getProductByValue({
    int pageId = 0,
    CustomFilter filters = const CustomFilter(),
  }) async {
    final products = await _ihttpHelper.getProductByValue(
      pageId: pageId,
      filters: filters,
    );
    return products;
  }

  Future<BaseResponse<BuiltList<ServiceModel>>> getServiceByValue({
    int pageId = 0,
    CustomFilter filters = const CustomFilter(),
  }) async {
    final services = await _ihttpHelper.getServiceByValue(
      pageId: pageId,
      filters: filters,
    );
    print('dsfdsfdsf ${services.toJson()}');
    return services;
  }

  Future<BaseResponse<BuiltList<ProjectModel>>> getProjectByValue({
    int pageId = 0,
    CustomFilter filters = const CustomFilter(),
  }) async {
    final services = await _ihttpHelper.getProjectByValue(
      pageId: pageId,
      filters: filters,
    );
    return services;
  }

  Future<UserModel> getProfile() async {
    // TODO: implement login

    final data = await _ihttpHelper.getProfile();
    return data;
  }

  Future<void> saveUser(UserBaseModel userbase) async {
    await _iprefHelper.saveUser(userbase.user!);
    await _iprefHelper.saveToken(userbase.token!);
    appAuthState = true;
    if (deviceToken != null) await updateToken(deviceToken!);
  }

  Future<UserModel> editProfile(
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
    final user = await _ihttpHelper.editUser(
        first_name: first_name,
        last_name: last_name,
        phone: phone,
        image: image,
        summary: summary,
        gender: gender,
        countryId: countryId,
        cityId: cityId,
        skills: skills,
        email: email,
        facebook: facebook,
        instagram: instagram,
        youtube: youtube,
        linkedin: linkedin,
        snapchat: snapchat);
    await _iprefHelper.saveUser(user);
    appUser = user;
    return user;
  }

  Future<bool> reviewModel({
    required String model_type,
    required String model_id,
    required String review_content,
    int? parent_review,
    int? user_id,
  }) async {
    final data = await _ihttpHelper.reviewModel(
        model_type,
        model_id,
        review_content,
        parent_review?.toString() ?? null,
        user_id?.toString() ?? null);

    return data;
  }
  Future<bool> UpdateModel({
    required int id,
    required String content,
  }) async {
    final data = await _ihttpHelper.updateModel(
        id,
       content,
     );
    return data;
  }

  Future<bool> resetPassword(String old_password, String password,
      String password_confirmation) async {
    final language = await _iprefHelper.getAppLanguage();

    final data = await _ihttpHelper.resetPassword(
        old_password, password, password_confirmation);

    return data;
  }

  Future<bool> contactUs(
      String name, String mail, String title, String message) async {
    return await _ihttpHelper.contactUs(name, mail, title, message);
  }

  Future<bool> updateToken(String firebase_token) async {
    return await _ihttpHelper.updateToken(firebase_token);
  }

  Future<BaseResponse<BuiltList<Notification>>> getNotfication(int page) async {
    final notifications = await _ihttpHelper.getNotfication(page);
    return notifications;
  }

  Future<String> getAboutus() async {
    return await _ihttpHelper.getAboutus();
  }

  Future<bool> forgetPassword(String email) async {
    // TODO: implement forgetPassword
    return await _ihttpHelper.forgetPassword(email);
  }

  Future forgetPasswordConfirm(
      String email, String reset_code, String password) async {
    return await _ihttpHelper.changePassword(email, reset_code, password);
  }

  Future<BaseResponse<BuiltList<ProjectModel>>> getAllProjects(int page) async {
    return await _ihttpHelper.getAllProjects(page);
  }

  Future<BaseResponse<BuiltList<CommentModel>>> getComments(
      String model_type, int model_id, int page) async {
    return await _ihttpHelper.getComments(model_type, model_id, page);
  }

  Future<BaseResponse<BuiltList<ServiceModel>>> getServicesByCategory(
      int? categoryId,
      {int page = 0}) async {
    return await _ihttpHelper.getServicesByCategory(categoryId, page: page);
  }

  Future<BaseResponse<BuiltList<ShareModel>>> getRecentlyShares() async {
    return await _ihttpHelper.getRecentlyShares();
  }

  Future<BaseResponse<BuiltList<ShareModel>>> getAllRecentShares(
      int page) async {
    return await _ihttpHelper.getAllRecentShares(page);
  }

  Future<BaseResponse<BuiltList<ProductModel>>> getRetailsByCategory(
      int? categoryId,
      {int page = 0}) async {
    return await _ihttpHelper.getRetailsByCategory(categoryId, page: page);
  }

  Future<UserBaseModel> activateAccountConfirm(
      String email, String activation_code) async {
    final userbase =
        await _ihttpHelper.activateAccountConfirm(email, activation_code);
    // await saveUser(userbase);
    return userbase;
  }

  @override
  Future<UserBaseModel> verfyCode(String email, String activation_code) async {
    return await _ihttpHelper.verfyCode(email, activation_code);
  }  @override
  Future<UserBaseModel> verfyEmailCode(String email, String activation_code) async {
    return await _ihttpHelper.verfyCode(email, activation_code);
  }

  Future<Attributes> getAttributes(int categoryId) async {
    return await _ihttpHelper.getAttributes(categoryId);
  }

  Future<BuiltList<SkillModel>> getSkills() async {
    return await _ihttpHelper.getSkills();
  }

  Future<bool> viewCart() async {
    return await _ihttpHelper.viewCart();
  }

  Future<bool> changeNotificationStatus() async {
    return await _ihttpHelper.changeNotificationStatus();
  }

  @override
  Future<ProjectModel> getProjectDetails(int id) async {
    final data = await _ihttpHelper.getProjectDetails(id);
    return data;
  }

  Future<bool> addProject(
      String title, String description, String youtubeUrl, File image) async {
    final res =
        await _ihttpHelper.addProject(title, description, youtubeUrl, image);
    return res;
  }

  Future<bool> editProject(int id, String title, String description,
      String youtubeUrl, File image) async {
    final res = await _ihttpHelper.editProject(
        id, title, description, youtubeUrl, image);
    return res;
  }

  Future<bool> removeProject(ProjectModel project) async {
    final res = await _ihttpHelper.removeProject(project);
    return res;
  }

  Future<bool> addService(
      {String? title,
      String? description,
      String? price,
      int? categoryId,
      File? image,
      List<File>? images}) async {
    final res = await _ihttpHelper.addService(
        title, description, price, categoryId, image, images);
    return res;
  }

  Future<bool> editService(
      {int? id,
      String? title,
      String? description,
      String? price,
      int? categoryId,
      File? image,
      List<File>? images}) async {
    final res = await _ihttpHelper.editService(
        id, title, description, price, categoryId, image, images);
    return res;
  }

  Future<bool> removeService(ServiceModel serviceModel) async {
    final res = await _ihttpHelper.removeService(serviceModel);
    return res;
  }

  Future<bool> addProduct(
      {String? title,
      String? description,
      num? price,
      int? categoryId,
      File? image,
      List<File>? images}) async {
    final res = await _ihttpHelper.addProduct(
        title, description, price, categoryId, image, images);
    return res;
  }

  Future<BuiltList<Country>> getCountries() async {
    return await _ihttpHelper.getCountries();
  }

  Future<bool> editProduct(
      {int? id,
      String? title,
      String? description,
      String? price,
      int? categoryId,
      File? image,
      List<File>? images}) async {
    final res = await _ihttpHelper.editProduct(
        id, title, description, price, categoryId, image, images);
    return res;
  }

  Future<bool> removeProduct(ProductModel productModel) async {
    final res = await _ihttpHelper.removeProduct(productModel);
    return res;
  }

  Future<BaseResponse<BuiltList<UserModel>>> getAllUsers(int page) async {
    final users = await _ihttpHelper.getAllUsers(page);
    return users;
  }

  Future<UserModel> getUserById(int page) async {
    final user = await _ihttpHelper.getUserById(page);
    return user;
  }

  Future<VendorDetailModel> getVendorDetails(int id) async {
    final data = await _ihttpHelper.getVendorDetails(id);
    return data;
  }

  Future<BaseResponse<BuiltList<EventModel>>> getAllEvents(EventsFilter? filter,
      {int page = 0}) async {
    final events = await _ihttpHelper.getEvents(
      filter,
      page: page,
    );
    return events;
  }

  Future<BaseResponse<BuiltList<ShareModel>>> getAllShares(
    int eventId,
    SharesFilter filter,
    int page,
  ) async {
    final result = await _ihttpHelper.getSharees(
      eventId,
      filter,
      page: page,
    );
    return result;
  }

  Future<void> createShare(List<ShareData> shareDataList, int eventId) async {
    await _ihttpHelper.share(shareDataList, eventId);
  }

  Future<void> updateShare(ShareData shareData, int id) async {
    await _ihttpHelper.updateShare(shareData, id);
  }

  Future<void> deleteShare(int id) async {
    await _ihttpHelper.deleteShare(id);
  }

  //todo:
  Future<bool> addComment(int shareId, String content) async {
    return _ihttpHelper.reviewModel(
        'share', shareId.toString(), content, null, null);
  }

  Future<BaseResponse<BuiltList<CommentModel>>> getShareComments(int id,
      {int page = 0}) async {
    return _ihttpHelper.getComments('share', id, page);
  }

  Future<ShareModel> getShareById(int id) async {
    return _ihttpHelper.getShareById(id);
  }

  Future<PostModel> getPostById(int id) async {
    return _ihttpHelper.getPostById(id);
  }

  Future<ProductModel> getProductById(int id) async {
    return _ihttpHelper.getProductByIdOrSlug(id);
  }

  Future<ProductModel> getProductBySlug(String slug) async {
    return _ihttpHelper.getProductByIdOrSlug(slug);
  }

  Future<ProjectModel> getProjectByIdOrSlug(dynamic id) async {
    return _ihttpHelper.getProjectByIdOrSlug(id);
  }

  Future<EventModel> getEventByIdOrSlug(dynamic id) async {
    return _ihttpHelper.getEventByIdOrSlug(id);
  }

  Future<ServiceModel> getServiceByIdOrSlug(dynamic id) async {
    return _ihttpHelper.getServiceById(id);
  }

  Future<BaseResponse<BuiltList<ShareModel>>> getMyShares(
      {int page = 0, required ShareStatus status}) async {
    return _ihttpHelper.getMyShare(page: page, status: status);
  }

  /// report
  Future<void> report(
      {required String modelType,
      required String modelId,
      required String reportContent}) async {
    await _ihttpHelper.report(modelType, modelId, reportContent);
  }

  Future<BuiltList<ReportModel>> getReports() async {
    return _ihttpHelper.getReports();
  }

  /// response to share
  Future<void> rejectShare({
    required String id,
    required String text,
    required String rejectReasonId,
  }) async {
    await _ihttpHelper.updateShareStatus(
      id,
      text,
      ShareStatus.unapproved.name,
      rejectReasonId,
    );
  }

  Future<void> approveShare({
    required String id,
    required String text,
  }) async {
    await _ihttpHelper.updateShareStatus(
      id,
      text,
      ShareStatus.approved.name,
    );
  }

  Future<BuiltList<RejectModel>> getRejectReasons() async {
    return _ihttpHelper.getRejectReasons();
  }

  /// posts
  Future<void> getLikePosts(int id) async {
    await _ihttpHelper.likePost(id);
  }

  Future<BaseResponse<BuiltList<PostModel>>> getMyPosts(int page) async {
    final data = await _ihttpHelper.getMyPosts(page);
    return data;
  }

  Future<BaseResponse<BuiltList<PostModel>>> getVendorPosts(
      int page, int id) async {
    final data = await _ihttpHelper.getVendorPosts(page, id);
    return data;
  }

  Future<BaseResponse<BuiltList<PostModel>>> getPosts(int page) async {
    final data = await _ihttpHelper.getPosts(page);
    return data;
  }

  Future<void> addPost(List<PostModel> posts) async {
    await _ihttpHelper.addPost(posts);
  }

  Future<void> addSubPost(
      String description, List<File> image, String parentId) async {
    await _ihttpHelper.addSubPost(description, image, parentId);
  }

  Future<void> editPost(int? id, String description, List<File> images,
      List<String> imagesToRemove, List<SubPostParam> subPosts) async {
    await _ihttpHelper.editPost(
        id, description, images, imagesToRemove, subPosts);
  }

  Future<void> removePost(PostModel post) async {
    await _ihttpHelper.removePost(post);
  }

  // Event
  Future<void> addEvent(SubmitEventParam param) async {
    await _ihttpHelper.addEvent(param);
  }

  // Future<BaseResponse<BuiltList<EventModel>>> getMyEvents(int page) async {
  //   final data = await _ihttpHelper.getMyEvents(page);
  //   return data;
  // }
  Future<BuiltList<EventModel>> getVendorEvents(int page, int id) async {
    final data = await _ihttpHelper.getVendorEvents(page, id);
    return data;
  }

  Future<void> editEvent(EditEventParam param) async {
    await _ihttpHelper.editEvent(param);
  }

  Future<void> removeEvent(EventModel event) async {
    await _ihttpHelper.removeEvent(event);
  }

  Future<bool> getBlockingSettings() async {
    return await _ihttpHelper.getBlockingSettings();
  }
}
