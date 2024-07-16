import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get_it/get_it.dart';
import 'package:taknikat/Ui/AllCategories_page/bloc/all_categories_bloc.dart';
import 'package:taknikat/Ui/AllCategories_page/bloc/all_categories_event.dart';
import 'package:taknikat/Ui/AllRecentSharesWithFilter/bloc/cubit.dart';
import 'package:taknikat/Ui/contactus_page/bloc/contactus_bloc.dart';
import 'package:taknikat/Ui/filter_screen/bloc/filter_bloc.dart';
import 'package:taknikat/Ui/home_page/bloc/home_bloc.dart';
import 'package:taknikat/Ui/home_page/bloc/home_event.dart';
import 'package:taknikat/Ui/project_content_page/bloc/project_content_bloc.dart';
import 'package:taknikat/Ui/report_page/bloc/report_bloc.dart';
import 'package:taknikat/Ui/retails_page/bloc/retails_bloc.dart';
import 'package:taknikat/Ui/services_page/bloc/services_bloc.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_bloc.dart';
import 'package:taknikat/Ui/setting_page/edit_profile_page/bloc/edit_profile_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/bloc/create_event_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/create_post_bloc/create_post_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_event.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_screen/bloc/post_screen_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_products/bloc/my_products_event.dart';
import 'package:taknikat/Ui/setting_page/my_projects/bloc/my_projects_event.dart';
import 'package:taknikat/Ui/vendor_page/bloc/vendor_bloc.dart';
import 'package:taknikat/Ui/vendor_page/vendor_posts/bloc/vendor_posts_bloc.dart';
import 'package:taknikat/data/http_helper/http_helper.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/model/user_model/user_model.dart';
import 'Ui/AllNotification_page/bloc/notification_bloc.dart';
import 'Ui/AllProducts_WithFilter_page/bloc/all_products_bloc.dart';
import 'Ui/AllProjects_WithFilter_page/bloc/all_projects_bloc.dart';
import 'Ui/AllServices_WithFilter_page/bloc/all_services_bloc.dart';
import 'Ui/all_events_page/bloc/events_bloc.dart';
import 'Ui/all_shares_page/bloc/shares_bloc.dart';
import 'Ui/auth_screen/bloc/auth_bloc.dart';
import 'Ui/create_share_page/provider/provider.dart';
import 'Ui/product_content_page/bloc/product_content_bloc.dart';
import 'Ui/see_all_users/bloc/see_all_users.dart';
import 'Ui/service_content_page/bloc/service_content_bloc.dart';
import 'Ui/setting_page/bloc/settings_event.dart';
import 'Ui/setting_page/get_countries_user/get_country_users_cubit.dart';
import 'Ui/setting_page/my_events/bloc/my_events_bloc.dart';
import 'Ui/setting_page/my_products/bloc/my_products_bloc.dart';
import 'Ui/setting_page/my_projects/bloc/my_projects_bloc.dart';
import 'Ui/setting_page/my_services/bloc/my_services_bloc.dart';
import 'Ui/setting_page/my_shares/bloc/my_shares_bloc.dart';
import 'Ui/share_content_page/bloc/share_bloc.dart';
import 'app/bloc/app_bloc.dart';
import 'core/app_localizations.dart';
import 'data/prefs_helper/prefs_helper.dart';
import 'model/country/country_model.dart';

final sl = GetIt.instance;
String appLanguage = 'us';
String appCurrency(BuildContext context) =>
    "${AppLocalizations.of(context).translate("sar")}";
String appCurrencyUS(BuildContext context) =>
    "${AppLocalizations.of(context).translate("us")}";
bool appAuthState = false;
String appVersion = "";
UserModel? appUser;
List<Country>? appCountries;

// String imagesPrefix = "https://taknikat.com/" + "/storage/";
late Size sizeAware;
String baseUrl = FlavorConfig.instance.variables["baseUrl"];

Future iniGetIt() async {
  sl.registerLazySingleton(() => ((Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "charset": "utf-8",
        "Accept-Charset": "utf-8"
      },
      responseType: ResponseType.plain)))));
  // data
  sl.registerLazySingleton<PrefsHelper>(() => PrefsHelper());
  sl.registerLazySingleton<HttpHelper>(() => HttpHelper(sl()));
  sl.registerLazySingleton<Repository>(() => Repository(sl(), sl()));

  /// AppBloc
  sl.registerLazySingleton<AppBloc>(() => AppBloc(sl()));

  sl.registerLazySingleton<HomeBloc>(() => HomeBloc(sl()));
  sl.registerLazySingleton<AllCategoriesBloc>(() => AllCategoriesBloc(sl()));
  sl.registerLazySingleton<SettingsBloc>(() => SettingsBloc(sl()));
  sl.registerLazySingleton<NotificationBloc>(() => NotificationBloc(sl()));
  sl.registerLazySingleton<MyProjectsBloc>(() => MyProjectsBloc(sl()));
  sl.registerLazySingleton<PostsBloc>(() => PostsBloc(sl()));
  sl.registerLazySingleton<MyProductsBloc>(() => MyProductsBloc(sl()));
  sl.registerLazySingleton<MyServicesBloc>(() => MyServicesBloc(sl()));
  sl.registerLazySingleton<MyEventsBloc>(() => MyEventsBloc(sl()));
  sl.registerLazySingleton<GetCountryUsersCubit>(() => GetCountryUsersCubit(sl()));

  sl.registerFactory(() => AuthBloc(sl()));
  sl.registerFactory(() => FilterBloc(sl()));

  ///Events

  sl.registerFactory(() => ShareProvider(sl()));
  sl.registerLazySingleton(() => EventsBloc(sl()));
  sl.registerFactory(() => SharesBloc(sl()));
  sl.registerFactory(() => ShareBloc(sl()));
  sl.registerLazySingleton(() => MySharesBloc(sl()));
  sl.registerFactory(() => AllRecentSharesCubit(sl()));

  ///report
  // sl.registerFactory(() => ReportProvider(sl()));
  sl.registerFactory(() => ReportBloc(sl()));

  ///EditProfileBloc
  sl.registerFactory(() => EditProfileBloc(sl()));
  sl.registerFactory(() => RetailsBloc(sl()));
  sl.registerFactory(() => ServicesBloc(sl()));

  sl.registerFactory(() => ProductContentBloc(sl()));
  sl.registerFactory(() => ProjectContentBloc(sl()));
  sl.registerFactory(() => ServiceContentBloc(sl()));
  sl.registerFactory(() => PostScreenBloc(sl()));

  // sl.registerFactory(() => AboutBloc(sl()));\

  sl.registerFactory(() => ContactusBloc(sl()));
  sl.registerFactory(() => AllProductsBloc(sl()));
  sl.registerFactory(() => AllProjectsBloc(sl()));
  sl.registerFactory(() => AllServicesBloc(sl()));
  sl.registerFactory(() => SeeAllUsersBloc(sl()));

  sl.registerFactory(() => VendorBloc(sl()));
  sl.registerFactory(() => VendorPostBloc(sl()));
  sl.registerFactory(() => CreatePostBloc());
  sl.registerFactory(() => CreateEventBloc());

  // sl.registerFactory(() => ServiceContentBloc(sl()));
}

class InitBlocs {
  Future<void> call(callBack) async {
    sl<SettingsBloc>()
      ..add(InitSettings())
      ..stream.listen((state) => trigger(callBack));
    sl<MyProjectsBloc>()
      ..add(InitMyProjects())
      ..stream.listen((state) => trigger(callBack));
    sl<PostsBloc>()
      ..add(InitPosts())
      ..stream.listen((state) => trigger(callBack));
    sl<MyProductsBloc>()
      ..add(InitMyProducts())
      ..stream.listen((state) => trigger(callBack));

    sl<MyServicesBloc>();
    sl<HomeBloc>()
      ..add(InitHome())
      ..stream.listen((state) => trigger(callBack));
    sl<MyEventsBloc>();
    sl<AllCategoriesBloc>()
      ..add(InitCategories())
      ..stream.listen((state) => trigger(callBack));
    return;
  }

  static void trigger(Function callBack) {
    if (sl<HomeBloc>().state.initialized &&
            sl<SettingsBloc>().state.initialized &&
            sl<AllCategoriesBloc>().state.initialized &&
            // sl<MyProjectsBloc>().state.initialized &&
            sl<PostsBloc>().state.initialized
        // &&
        // sl<MyServicesBloc>().state.initialized &&
        // sl<MyProductsBloc>().state.initialized
        ) {
      callBack();
    }
  }
}
