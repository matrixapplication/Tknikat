// import 'dart:async';
//
// import 'package:app_links/app_links.dart';
// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:taknikat/Ui/events_content_page/events_content_page.dart';
// import 'package:taknikat/Ui/product_content_page/product_content_page.dart';
// import 'package:taknikat/Ui/project_content_page/project_content_page.dart';
// import 'package:taknikat/Ui/service_content_page/service_content_page.dart';
// import 'package:taknikat/Ui/setting_page/my_posts/post_screen/post_screen.dart';
// import 'package:taknikat/Ui/share_content_page/share_content_page.dart';
// import 'package:taknikat/data/repository/repository.dart';
// import 'package:taknikat/injectoin.dart';
// // import 'package:uni_links/uni_links.dart';
//
// class UriInvoker {
//   static Uri? latestUri;
//   static late GlobalKey<NavigatorState> _navigatorKey;
//   static StreamSubscription<Uri?>? _subscription;
//   static  AppLinks _appLinks = AppLinks();
//
//   static initPlatformStateForUri(GlobalKey<NavigatorState> navigatorKey) async {
//     print('initPlatformStateForUri');
//     _navigatorKey = navigatorKey;
//     _subscription ??= _appLinks.uriLinkStream.listen((uri) {
//       debugPrint('uriLinkStream');
//       routeToPage(uri);
//     }, onError: (err) {
//       debugPrint('Uri_invoker got err: $err');
//     });
//
//   //   Uri? initialUri = await getInitialUri();
//   //   try {
//   //     routeToPage(initialUri);
//   //   } on PlatformException {
//   //     initialUri = null;
//   //   } on FormatException {
//   //     initialUri = null;
//   //   }
//   //   latestUri = initialUri;
//   }
//
//   static void routeToPage(Uri? uri) async {
//     if (uri != null) {
//       Widget? route;
//       final path = uri.path.substring(1, uri.path.lastIndexOf('/'));
//       final pathEnd = uri.path.lastIndexOf('/');
//       final String idOrSlug = uri.path.substring(pathEnd + 1);
//       try {
//         switch (path) {
//           case 'products':
//             final product = await sl<Repository>().getProductBySlug(idOrSlug);
//             route = ProductContentPage(product);
//             break;
//           case 'services':
//             final service =
//                 await sl<Repository>().getServiceByIdOrSlug(idOrSlug);
//             route = ServiceContentPage(service);
//             break;
//           case 'projects':
//             final project =
//                 await sl<Repository>().getProjectByIdOrSlug(idOrSlug);
//             route = ProjectContentPage(project);
//             break;
//           case 'events':
//             final event = await sl<Repository>().getEventByIdOrSlug(idOrSlug);
//             route = EventContentPage(event);
//             break;
//
//           case 'post':
//             final post = await sl<Repository>().getPostById(idOrSlug as int);
//             route = PostScreen(
//               fromMyPostsList: false,
//               postModel: post,
//             );
//             break;
//           case 'events/shares':
//             final share =
//                 await sl<Repository>().getShareById(int.parse(idOrSlug));
//             route = ShareContentPage(share: share, event: share.event!);
//             break;
//         }
//         if (route != null)
//           Navigator.of(_navigatorKey.currentContext!).push(
//             PageTransition(
//               duration: Duration(milliseconds: 500),
//               type: PageTransitionType.fade,
//               child: route,
//             ),
//           );
//         BotToast.closeAllLoading();
//       } finally {
//         latestUri = null;
//         uri = null;
//       }
//     }
//   }
// }
//
// // https://taknikat.com/services/tsoyr-mntgatkm-bahtrafyh-alasr-almntgh-almtaaam-almhlat-4
// // https://taknikat.com/products/alshbk-almsttyl-alasod-783
// // https://taknikat.com/projects/aodaaa-kyas-shd-aldoaa-fy-alkamyrat-lltsoyr-alfotoghrafy-756
// // https://taknikat.com/events/1
// // https://taknikat.com/events/shares/237
