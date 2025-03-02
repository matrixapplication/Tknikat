import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:star_menu/star_menu.dart';
import 'package:taknikat/Ui/AllProducts_WithFilter_page/all_products_page.dart';
import 'package:taknikat/Ui/AllProjects_WithFilter_page/all_projects_page.dart';
import 'package:taknikat/Ui/AllServices_WithFilter_page/all_services_page.dart';
import 'package:taknikat/Ui/about_us/about_us_page.dart';
import 'package:taknikat/Ui/all_events_page/all_events_page.dart';
import 'package:taknikat/Ui/auth_screen/page/signin_page.dart';
import 'package:taknikat/Ui/base_page/widgets/drawer_item.dart';
import 'package:taknikat/Ui/contactus_page/contactus_page.dart';
import 'package:taknikat/Ui/home_page/bloc/home_bloc.dart';
import 'package:taknikat/Ui/home_page/bloc/home_event.dart';
import 'package:taknikat/Ui/home_page/bloc/home_state.dart';
import 'package:taknikat/Ui/setting_page/edit_profile_page/edit_profile_page.dart';
import 'package:taknikat/Ui/setting_page/my_posts/wall_page.dart';
import 'package:taknikat/Ui/setting_page/profile_page.dart';
import 'package:taknikat/app/bloc/app_bloc.dart';
import 'package:taknikat/app/bloc/app_event.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/core/widgets/icon_widget.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';
import 'package:taknikat/injectoin.dart';
import '../../core/app_localizations.dart';
import '../../core/assets_image/app_images.dart';
import '../../core/login_dialog.dart';
import '../../core/notifications_service.dart';
import '../../core/utils/globle.dart';
import '../../data/http_helper/http_helper.dart';
import '../gallery/gallery_category/gallary_category_screen.dart';
import '../gallery/gallery_screen.dart';
import '../layout/widgets/custom_bottom_bar.dart';
import '../setting/setting_screen.dart';
import '../setting_page/bloc/settings_bloc.dart';
import '../setting_page/bloc/settings_event.dart';
import '../setting_page/bloc/settings_state.dart';
import '../setting_page/my_events/add_event_screen.dart';
import '../setting_page/my_events/my_events_page.dart';
import '../setting_page/my_posts/add_post_screen.dart';
import '../setting_page/my_products/add_product_screen.dart';
import '../setting_page/my_products/my_products_page.dart';
import '../setting_page/my_projects/add_project_screen.dart';
import '../setting_page/my_projects/my_projects_page.dart';
import '../setting_page/my_services/add_service_screen.dart';
import '../setting_page/my_services/my_services_page.dart';
import 'circular/src/circular_menu.dart';
import 'circular/src/circular_menu_item.dart';
import 'navigation_bar_provider.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int pageIndex = 0;
  final _bloc = sl<HomeBloc>();
  final _bloc2 = sl<SettingsBloc>();
  List<Widget> pages = [
    WallPage(),
    ProfilePage(),

    // HomePage(),
    // AllCategoriesPage(),

    // MyCart(),
  ];

  @override
  void initState() {
    kScaffoldKey =GlobalKey<ScaffoldState>();
    updateFcmToken();
    _bloc2.add(InitSettings());
    pageIndex = 0;
    Provider.of<BottomNavigationProvider>(context,listen: false).intial(0);
    super.initState();
  }

  updateFcmToken() async {
    HttpHelper httpHelper = HttpHelper(sl());
    if (deviceToken != null) await httpHelper.updateToken(deviceToken!);
  }
  StarMenuController starMenuController = StarMenuController();

  @override
  Widget build(BuildContext context) {
    sizeAware = MediaQuery.sizeOf(context);
    return Consumer<BottomNavigationProvider>(builder: (_, provider, ___) {
      Locale myLocale = Localizations.localeOf(context);
      String languageCode = myLocale.languageCode;
      return BlocBuilder(
          bloc: _bloc,
          builder: (BuildContext context, HomeState state) {
            return WillPopScope(
              onWillPop: () async {
                return provider.navigateToPreviousPage();
              },
              child: Scaffold(
                  key: kScaffoldKey,
                  drawer: new Drawer(
                    backgroundColor: Colors.white,
                    child:
                    BlocConsumer(
                      listener: (context, SettingsState state) {},
                      bloc: _bloc2,
                      builder: (context, SettingsState state) {
                        var user = state.user;
                        return Stack(
                          children: [
                            state.isLoading
                                ? Center(child: loader(context: context))
                                : Container(),
                            Positioned.fill(
                                child: Column(
                              children: [
                                Container(
                                    color:Colors.white,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         40.height,
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.end,
                                           children: [
                                             IconWidget(
                                               widget: Icon(Icons.clear),
                                               onTap: (){
                                                 kScaffoldKey.currentState!.closeDrawer();
                                               },
                                               height:48.h,
                                               width:48.h,
                                             ),
                                           ],
                                       ),
                                        Container(
                                          height: sizeAware.height * 0.160857142857143,
                                          child: appAuthState && user.firstName != null
                                              ? Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  kScaffoldKey.currentState!
                                                      .closeDrawer();
                                                  context
                                                      .read<
                                                      BottomNavigationProvider>()
                                                      .index = 1;
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          shape:
                                                          BoxShape.circle,
                                                          border: Border.all(
                                                              width: 3,
                                                              color: Colors
                                                                  .white)),
                                                      child: CircleAvatar(
                                                          radius: 30,
                                                          backgroundImage: (user
                                                              .avatar ==
                                                              null ||
                                                              user.avatar ==
                                                                  ""
                                                              ? AssetImage("assets/images/profile.png")
                                                              : CachedNetworkImageProvider(
                                                              getImagePath(
                                                                  user.avatar!))) as ImageProvider),
                                                    ),
                                                    if (user != null)
                                                      Expanded(
                                                        child: Container(
                                                          margin:
                                                          EdgeInsets.all(
                                                              8),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              baseText(
                                                                user!.firstName
                                                                    .toString() +
                                                                    " " +
                                                                    user.lastName
                                                                        .toString(),
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              baseText(
                                                                  user.email
                                                                      .toString() ??
                                                                      '',
                                                                  color: Colors
                                                                      .black,
                                                                  size: 11.0),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              DrawerItem(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            duration: Duration(milliseconds: 1000),
                                                            type: PageTransitionType.fade,
                                                            child: EditProfilePage())).then((value) {
                                                      if (value == 'refresh') {
                                                        _bloc.add(InitHome());}
                                                    });
                                                  },
                                                  image: AppImages.editProfile,
                                                  title:getLangLocalization('Edit Personal Info'))

                                            ],
                                          )
                                              : Container(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Colors.white38,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8)),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Column(
                                                  children: [
                                                    FittedBox(
                                                      child: Text(
                                                        AppLocalizations.of(
                                                            context)
                                                            .translate(
                                                            "Welcome"),
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .w200),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        AppLocalizations.of(
                                                            context)
                                                            .translate(
                                                            "Please log in to enjoy the purchase"),
                                                        softWrap: true,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).pushReplacement(PageTransition(
                                                            duration: Duration(
                                                                milliseconds:
                                                                500),
                                                            type:
                                                            PageTransitionType
                                                                .fade,
                                                            child:
                                                            SignInPage()));
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: primaryColor,
                                                            borderRadius: BorderRadius.circular(16)),
                                                        alignment:
                                                        AlignmentDirectional.center,
                                                        padding: EdgeInsets.all(10),
                                                        margin: EdgeInsets.all(10),
                                                        width: sizeAware.width * 0.4,
                                                        child: Text(AppLocalizations.of(context).translate("sign in"),
                                                          style: TextStyle(color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                  child:
                                 Container(
                                     child: SingleChildScrollView(
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           10.height,
                                           Padding(padding: 16.paddingHorizontal,
                                             child: BlackRegularText(label: getLangLocalization('Discover'),fontWeight: FontWeight.w300,)
                                           ),
                                           10.height,
                                           FittedBox(
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                 children: [
                                                   FittedBox(child:
                                                   IconWidget(
                                                       onTap:(){
                                                         Navigator.of(context).push(
                                                             PageTransition(
                                                                 duration: Duration(
                                                                     milliseconds: 700),
                                                                 type:
                                                                 PageTransitionType.fade,
                                                                 child: AllProductsPage(
                                                                   custom_filter:
                                                                   CustomFilter(
                                                                       search: ""),
                                                                   title: '',
                                                                 )));
                                                       },
                                                       widget: Container(
                                                         child: Column(
                                                           children: [
                                                             SvgPicture.asset(AppImages.product),
                                                             3.height,
                                                             BlackRegularText(label:getLangLocalization('Products') ,fontSize: 13,)

                                                           ],
                                                         ),
                                                         padding:8.paddingAll,
                                                       )
                                                   ),),
                                                   FittedBox(child:  IconWidget(
                                                       onTap:(){
                                                         Navigator.of(context).push(
                                                             PageTransition(
                                                                 duration: Duration(
                                                                     milliseconds: 700),
                                                                 type:
                                                                 PageTransitionType.fade,
                                                                 child: AllProjectsPage(
                                                                   custom_filter:
                                                                   CustomFilter(
                                                                       search: ""),
                                                                 )));
                                                       },
                                                       widget: Container(
                                                         child: Column(
                                                           children: [
                                                             SvgPicture.asset(AppImages.video),
                                                             3.height,
                                                             BlackRegularText(label: getLangLocalization('Videos') ,fontSize: 13,)

                                                           ],
                                                         ),
                                                         padding:8.paddingAll,
                                                       )
                                                   ),),
                                                   FittedBox(
                                                     child:  IconWidget(
                                                         onTap:(){
                                                           Navigator.of(context).push(
                                                               PageTransition(
                                                                   duration: Duration(
                                                                       milliseconds: 700),
                                                                   type:
                                                                   PageTransitionType.fade,
                                                                   child: AllServicesPage(
                                                                     custom_filter:
                                                                     CustomFilter(
                                                                         search: ""),
                                                                   )));
                                                         },
                                                         widget: Container(
                                                           child: Column(
                                                             children: [
                                                               SvgPicture.asset(AppImages.services2),
                                                               3.height,
                                                               BlackRegularText(label: getLangLocalization('Services') ,fontSize: 13,)
                                                             ],
                                                           ),
                                                           padding:8.paddingAll,
                                                         )
                                                     ),),
                                                   FittedBox(child:   IconWidget(
                                                       onTap:(){
                                                         Navigator.of(context).push(
                                                             PageTransition(
                                                                 duration: Duration(
                                                                     milliseconds: 700),
                                                                 type:
                                                                 PageTransitionType.fade,
                                                                 child: AllEventPage()));
                                                       },
                                                       widget: Container(
                                                         child: Column(
                                                           children: [
                                                             SvgPicture.asset(AppImages.events),
                                                             3.height,
                                                             BlackRegularText(label:getLangLocalization('Events'),fontSize: 13,)
                                                           ],
                                                         ),
                                                         padding:8.paddingAll,
                                                       )
                                                   ))
                                                 ],
                                               ),
                                           ),
                                           16.height,
                                           Padding(padding: 16.paddingHorizontal, child: BlackRegularText(label:  getLangLocalization('More'),fontWeight: FontWeight.w300,)),
                                           10.height,
                                           if(appAuthState && user.firstName != null)
                                           DrawerItem(
                                               onTap: () {
                                                 Navigator.push(
                                                     context,
                                                     PageTransition(
                                                         duration: Duration(milliseconds: 1000),
                                                         type: PageTransitionType.fade,
                                                         child: SettingScreen()));

                                               },
                                               image: AppImages.set4,
                                               title:getLangLocalization('Settings')),
                                           DrawerItem(
                                               onTap: () {
                                                 Navigator.of(context).push(
                                                     PageTransition(
                                                         duration: Duration(
                                                             milliseconds: 700),
                                                         type:
                                                         PageTransitionType.fade,
                                                         child: AboutUsPage(image: AppImages.about,)));
                                               },
                                               image: AppImages.set3,
                                               title:AppLocalizations.of(context).translate("About Us")),
                                           DrawerItem(
                                               onTap: () {
                                                 Navigator
                                                     .of(context)
                                                     .push(PageTransition(
                                                     duration: Duration(milliseconds: 700),
                                                     type: PageTransitionType.fade,
                                                     child: ContactPage()));
                                               },
                                               image: AppImages.set2,
                                               title:AppLocalizations.of(
                                                   context)
                                                   .translate(
                                                   "Contact Us"),),    
                                           DrawerItem(
                                               onTap: () {
                                                 Navigator.of(context).push(PageTransition(duration: Duration(milliseconds: 700),
                                                     type: PageTransitionType.fade,
                                                     child: AboutUsPage(title: getLangLocalization('Terms & Conditions'), image: AppImages.terms,)));
                                               },
                                               image:AppImages.set1,
                                               title: getLangLocalization('Terms & Conditions'),
                                           ),
                                           SizedBox(
                                             height: 40,
                                           )
                                         ],
                                       ),
                                     ),
                                     color: Colors.white,
                                 )
                                )
                              ],
                            )),
                          ],
                        );
                      },
                    ),
                  ),
                  floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
                  floatingActionButton:
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                        color: Colors.
                        white
                    ),
                     padding: 5.paddingAll,
                     margin: 25.paddingBottom,
                     child:
                     FloatingActionButton(
                       backgroundColor: primaryColor,
                       shape: const CircleBorder(),
                       onPressed: () {},
                       child:    Container(
                         // color: Colors.red,
                         margin: EdgeInsets.only(bottom: 0),
                         width: 70,
                         height: 70,
                         padding: 10.paddingAll,
                         child: SvgPicture.asset(AppImages.category)
                       ),
                     ).addStarMenu(
                         items: [
                           CircularMenuItem(
                               color: primaryColor,
                               icon: Icons.image,
                               image:  AppImages.pro1,
                               margin: 5,
                               badgeLabel: '${getLangLocalization('Posts')}',
                               enableBadge: false,
                               onTap: () {
                                 if (appUser != null) {
                                   Navigator.of(context).push(PageTransition(
                                       duration: Duration(milliseconds: 700),
                                       type: PageTransitionType.fade,
                                       child: AddPostScreen()));
                                 } else {
                                   showLoginFirstDialog(context);
                                 }
                               }),

                           CircularMenuItem(
                               color: primaryColor,
                               icon: Icons.calendar_month,
                               margin: 5,
                               image: AppImages.pro2,
                               badgeLabel: '${getLangLocalization('Products')}',

                               onTap: () {
                                 if (appUser != null) {
                                   Navigator.of(context).push(MaterialPageRoute(
                                     builder: (context) => AddProductScreen(),
                                   ));
                                 } else {
                                   showLoginFirstDialog(context);
                                 }
                               }),

                           CircularMenuItem(
                               color: primaryColor,
                               icon: Icons.video_call_outlined,
                               image: AppImages.pro3,
                               badgeLabel: '${getLangLocalization('Services')}',

                               margin: 5, onTap: () {
                             if (appUser != null) {
                               Navigator.of(context).push(MaterialPageRoute(
                                 builder: (context) => AddServiceScreen(),
                               ));
                             } else {
                               showLoginFirstDialog(context);
                             }

                           }),
                           CircularMenuItem(
                               color: primaryColor,
                               icon: Icons.work,
                               margin: 5,
                               image: AppImages.pro4,
                               badgeLabel: '${getLangLocalization('videos')}',

                               onTap: () {
                                 if (appUser != null) {
                                   Navigator.of(context).push(MaterialPageRoute(
                                     builder: (context) => AddProjectScreen(),
                                   ));
                                 } else {
                                   showLoginFirstDialog(context);
                                 }

                               }),
                           CircularMenuItem(
                               color: primaryColor,
                               icon: Icons.category_outlined,
                               margin: 5,
                               image: AppImages.pro5,
                               badgeLabel: '${getLangLocalization('events')}',

                               onTap: () {
                                 if (appUser != null) {
                                   Navigator.of(context).push(MaterialPageRoute(
                                     builder: (context) => AddEventScreen(),
                                   ));
                                 } else {
                                   showLoginFirstDialog(context);
                                 }
                               }),
                           CircularMenuItem(
                               color: primaryColor,
                               icon: Icons.post_add,
                               image: AppImages.pro6,
                               badgeLabel: '${getLangLocalization('albums')}',

                               margin: 5,
                               onTap: () {
                                 if (appUser != null) {
                                   Navigator.of(context).push(MaterialPageRoute(
                                     builder: (context) => GalleryCategoryScreen(),
                                   ));
                                 } else {
                                   showLoginFirstDialog(context);
                                 }
                               }),
                         ],
                         params: StarMenuParameters.arc(ArcType.semiUp),
                      controller: starMenuController,
                      onItemTapped: (index, controller) {
                           print('index : $index');
                           starMenuController.closeMenu!();
                      }),


              ),

                  body: Stack(
                    children: [
                      PageTransitionSwitcher(
                        duration: Duration(milliseconds: 1100),
                        transitionBuilder: (
                            Widget child,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            ) {
                          return FadeThroughTransition(
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            child: child,
                          );
                        },
                        child: pages[provider.index],
                      ),
                      Positioned(
                        bottom: 0,
                        child: CustomBottomBar(
                          onChange: (int value) {
                            setState(() {
                              provider.index = value;
                            });
                          },
                        ),
                      )
                    ],
                  )),
            );
          });
    });
  }
}

// import 'package:animations/animations.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';
// import 'package:taknikat/Ui/AllCategories_page/allCategories.dart';
// import 'package:taknikat/Ui/AllProducts_WithFilter_page/all_products_page.dart';
// import 'package:taknikat/Ui/AllProjects_WithFilter_page/all_projects_page.dart';
// import 'package:taknikat/Ui/AllServices_WithFilter_page/all_services_page.dart';
// import 'package:taknikat/Ui/about_us/about_us_page.dart';
// import 'package:taknikat/Ui/all_events_page/all_events_page.dart';
// import 'package:taknikat/Ui/auth_screen/page/signin_page.dart';
// import 'package:taknikat/Ui/contactus_page/contactus_page.dart';
// import 'package:taknikat/Ui/home_page/bloc/home_bloc.dart';
// import 'package:taknikat/Ui/home_page/bloc/home_event.dart';
// import 'package:taknikat/Ui/home_page/bloc/home_state.dart';
// import 'package:taknikat/Ui/home_page/page/home_page.dart';
// import 'package:taknikat/Ui/setting_page/edit_profile_page/bloc/edit_profile_bloc.dart';
// import 'package:taknikat/Ui/setting_page/edit_profile_page/bloc/edit_profile_event.dart';
// import 'package:taknikat/Ui/setting_page/edit_profile_page/bloc/edit_profile_state.dart';
// import 'package:taknikat/Ui/setting_page/edit_profile_page/edit_profile_page.dart';
// import 'package:taknikat/Ui/setting_page/my_posts/wall_page.dart';
// import 'package:taknikat/Ui/setting_page/profile_page.dart';
// import 'package:taknikat/app/bloc/app_bloc.dart';
// import 'package:taknikat/app/bloc/app_event.dart';
// import 'package:taknikat/core/base_widget/base_text.dart';
// import 'package:taknikat/core/base_widget/constent.dart';
// import 'package:taknikat/core/constent.dart';
// import 'package:taknikat/core/filters/filter_class.dart';
// import 'package:taknikat/core/style/custom_loader.dart';
// import 'package:taknikat/injectoin.dart';
//
// import '../../app/App.dart';
// import '../../core/app_localizations.dart';
// import '../../core/base_widget/dialogcustom.dart';
// import '../../core/notifications_service.dart';
// import '../../core/uri_invoker.dart';
// import '../../data/http_helper/http_helper.dart';
// import '../AllNotification_page/allNotification_page.dart';
// import '../AllNotification_page/bloc/notification_bloc.dart';
// import '../AllNotification_page/bloc/notification_state.dart';
// import '../auth_screen/page/complete_profile_page.dart';
// import '../cart/cart_page.dart';
// import '../setting/setting_screen.dart';
// import '../setting_page/bloc/settings_bloc.dart';
// import '../setting_page/bloc/settings_event.dart';
// import '../setting_page/bloc/settings_state.dart';
// import 'navigation_bar_provider.dart';
//
// class BasePage extends StatefulWidget {
//   @override
//   _BasePageState createState() => _BasePageState();
// }
//
// class _BasePageState extends State<BasePage> {
//   int pageIndex = 0;
//   final _bloc = sl<HomeBloc>();
//   final _bloc2 = sl<SettingsBloc>();
//   List<Widget> pages = [
//     WallPage(),
//     HomePage(),
//     AllCategoriesPage(),
//     ProfilePage(),
//     SettingScreen(),
//     // MyCart(),
//   ];
//
//   @override
//   void initState() {
//     updateFcmToken();
//     _bloc2.add(InitSettings());
//     pageIndex = 0;
//     super.initState();
//   }
//
//   updateFcmToken() async {
//     HttpHelper httpHelper = HttpHelper(sl());
//     if (deviceToken != null) await httpHelper.updateToken(deviceToken!);
//   }
//
//   // int _currentIndex = 0;
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     sizeAware = MediaQuery.of(context).size;
//     final cartView = sl<SettingsBloc>().state.viewCart;
//     // sl<SettingsBloc>().add(InitSettings());update-token
//
//     return Consumer<BottomNavigationProvider>(builder: (_, provider, ___) {
//       int _currentIndex = provider.index;
//       Locale myLocale = Localizations.localeOf(context);
//       String languageCode = myLocale.languageCode;
//
//       return BlocBuilder(
//           bloc: _bloc,
//           builder: (BuildContext context, HomeState state) {
//             return WillPopScope(
//               onWillPop: () async {
//                 return provider.navigateToPreviousPage();
//               },
//               child: Scaffold(
//                 key: _scaffoldKey,
//                 appBar: AppBar(
//                   // leading: IconButton(
//                   //     onPressed: () {
//                   //       _scaffoldKey.currentState!.openDrawer();
//                   //     },
//                   //     icon: SvgPicture.asset(
//                   //       "assets/images/dehaze.svg",
//                   //       color: Colors.white,
//                   //     )),
//                   leading: appAuthState
//                       ?
//                   (_currentIndex!=4?
//                   InkWell(
//                     onTap: () {
//                       if (appAuthState)
//                         Navigator.of(context).push(PageTransition(
//                             duration: Duration(milliseconds: 500),
//                             type: PageTransitionType.fade,
//                             child: AllNotificationPage()));
//                       else
//                         showLogin(context);
//                     },
//                     child: FittedBox(
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Container(
//                             padding: EdgeInsets.only(
//                                 top: 18, right: 20, left: 20),
//                             child: SvgPicture.asset(
//                               "assets/images/notification.svg",
//                               height: 40,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           BlocBuilder(
//                               bloc: sl<NotificationBloc>(),
//                               builder: (BuildContext context,
//                                   NotificationState state) {
//                                 return state.unreadenNotificationCount !=
//                                     0
//                                     ? Positioned(
//                                   top: 10,
//                                   right: 6,
//                                   child: new Center(
//                                     child: CircleAvatar(
//                                       radius:
//                                       sizeAware.width * 0.01,
//                                       backgroundColor: Colors.red,
//                                     ),
//                                   ),
//                                 )
//                                     : Container();
//                               }),
//                         ],
//                       ),
//                     ),
//                   ):SizedBox())
//                       : SizedBox(),
//
//                   // actions: [
//                   //   if (appAuthState)
//                   //     InkWell(
//                   //       onTap: () {
//                   //         if (appAuthState)
//                   //           Navigator.of(context).push(PageTransition(
//                   //               duration: Duration(milliseconds: 500),
//                   //               type: PageTransitionType.fade,
//                   //               child: AllNotificationPage()));
//                   //         else
//                   //           showLogin(context);
//                   //       },
//                   //       child: FittedBox(
//                   //         child: Stack(
//                   //           alignment: Alignment.center,
//                   //           children: [
//                   //             Container(
//                   //               padding: EdgeInsets.all(18),
//                   //               child: SvgPicture.asset(
//                   //                 "assets/images/notification.svg",
//                   //               ),
//                   //             ),
//                   //             BlocBuilder(
//                   //                 bloc: sl<NotificationBloc>(),
//                   //                 builder: (BuildContext context,
//                   //                     NotificationState state) {
//                   //                   return state.unreadenNotificationCount != 0
//                   //                       ? Positioned(
//                   //                           top: 10,
//                   //                           right: 6,
//                   //                           child: new Center(
//                   //                             child: CircleAvatar(
//                   //                               radius: sizeAware.width * 0.01,
//                   //                               backgroundColor: Colors.red,
//                   //                             ),
//                   //                           ),
//                   //                         )
//                   //                       : Container();
//                   //                 }),
//                   //           ],
//                   //         ),
//                   //       ),
//                   //     ),
//                   // ],
//                   actions: [
//                     // if (_currentIndex == 3)
//                     //   IconButton(
//                     //     icon: Icon(
//                     //       Icons.arrow_forward_ios,
//                     //       color: Colors.white,
//                     //     ),
//                     //     onPressed: () {
//                     //       final _bloc = sl<SettingsBloc>();
//                     //
//                     //       _bloc.add(GetUserData());
//                     //       Navigator.of(context).push(PageTransition(
//                     //           duration: Duration(milliseconds: 700),
//                     //           type: PageTransitionType.fade,
//                     //           child: EditProfilePage()));
//                     //       // if (appAuthState)
//                     //       //   Navigator.of(context).push(PageTransition(
//                     //       //       duration: Duration(milliseconds: 500),
//                     //       //       type: PageTransitionType.fade,
//                     //       //       child: AllNotificationPage()));
//                     //       // else
//                     //       //   showLogin(context);
//                     //     },
//                     //   ),
//                   ],
//                   title: Container(
//                     margin: EdgeInsets.only(top: 13, left: 20, right: 20),
//                     // width: sizeAware.width * 0.282051282051282,
//                     child: _currentIndex == 3
//                         ? BlocConsumer(
//                             listener: (context, SettingsState state) {},
//                             bloc: _bloc2,
//                             builder: (context, SettingsState state) {
//                               var user = state.user;
//                               return  InkWell(
//                                 onTap: () {
//                                   final _bloc = sl<SettingsBloc>();
//
//                                   _bloc.add(GetUserData());
//                                   Navigator.of(context).push(PageTransition(
//                                       duration: Duration(milliseconds: 700),
//                                       type: PageTransitionType.fade,
//                                       child: EditProfilePage()));
//                                 },
//                                 child: Container(
//                                   margin: EdgeInsets.all(8),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       baseText(
//                                         '${user.firstName?.toString()??''}  ${user.lastName?.toString()??''}'
//                                         ,
//                                         color: Colors.white,
//                                       ),
//                                       baseText('${user.email?.toString() ?? ''}',
//                                           color: Colors.white, size: 11.0),
//                                     ],
//                                   ),
//                                 ),
//                               );
//
//                               ;
//                             })
//                         :
//                     _currentIndex == 4?
//                       Text(AppLocalizations.of(context)
//                         .translate("Settings"),style: TextStyle(color: Colors.white,fontSize:25),):
//                     SvgPicture.asset(
//                             "assets/images/logo-white.svg",
//                             color: Colors.white,
//                             height: sizeAware.height * 0.050090047393365,
//                           ),
//                   ),
//                   automaticallyImplyLeading: false,
//                   centerTitle: true,
//                   backgroundColor: primaryColor,
//                   elevation: 0,
//                   bottom: PreferredSize(
//                     preferredSize: Size(sizeAware.width, 20),
//                     child: Stack(
//                       children: [
//                         Positioned.fill(
//                             child: Container(
//                           color:
//                               // ? Colors.transparent
//                               Colors.white,
//                         )),
//                         ClipPath(
//                           // clipper: CustomClipPath(),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: primaryColor,
//                               borderRadius: BorderRadius.only(
//                                 bottomRight: Radius.circular(30),
//                                 bottomLeft: Radius.circular(30),
//                               ),
//                             ),
//                             child: Column(
//                               children: [
//                                 Container(height: 20),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 bottomNavigationBar: BottomNavigationBar(
//                     items: <BottomNavigationBarItem>[
//                       BottomNavigationBarItem(
//                         icon: Icon(FontAwesomeIcons.bars),
//                         label: AppLocalizations.of(context)
//                             .translate("Publications"),
//                       ),
//                       BottomNavigationBarItem(
//                         icon: SvgPicture.asset(
//                           "assets/images/home.svg",
//                           color:
//                               _currentIndex == 1 ? primaryColor : secondryColor,
//                         ),
//                         label: AppLocalizations.of(context).translate("Home"),
//                       ),
//                       BottomNavigationBarItem(
//                         icon: SvgPicture.asset(
//                           "assets/images/category.svg",
//                           color:
//                               _currentIndex == 2 ? primaryColor : secondryColor,
//                         ),
//                         label: AppLocalizations.of(context)
//                             .translate("Categories"),
//                       ),
//                       BottomNavigationBarItem(
//                         icon: SvgPicture.asset(
//                           "assets/images/user.svg",
//                           color:
//                               _currentIndex == 3 ? primaryColor : secondryColor,
//                         ),
//                         label:
//                             AppLocalizations.of(context).translate("Profile"),
//                       ),
//                       BottomNavigationBarItem(
//                         icon: Icon(Icons.settings_sharp),
//                         label: AppLocalizations.of(context)
//                             .translate("Settings"),
//                       ),
//                       if (cartView ?? false)
//                         BottomNavigationBarItem(
//                           icon: Icon(Icons.shopping_cart_outlined),
//                           label: 'Cart',
//                         ),
//                     ],
//                     currentIndex: _currentIndex,
//                     selectedItemColor: primaryColor,
//                     unselectedItemColor: secondryColor,
//                     onTap: (i) {
//                       // if (i == 3 && !appAuthState) {
//                       //   showLogin(context);
//                       //   return;
//                       // }
//                       setState(() {
//                         provider.index = i;
//                       });
//                     }),
//                 drawer: new Drawer(
//                   child: BlocConsumer(
//                     listener: (context, SettingsState state) {},
//                     bloc: _bloc2,
//                     builder: (context, SettingsState state) {
//                       var user = state.user;
//                       return Stack(
//                         children: [
//                           state.isLoading
//                               ? Center(child: loader(context: context))
//                               : Container(),
//                           Positioned.fill(
//                               child: Column(
//                             children: [
//                               Container(
//                                 height: sizeAware.height / 3.0 + 1,
//                                 color: primaryColor,
//                                 child: DrawerHeader(
//                                   child: Container(
//                                       child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Container(
//                                         height: 20,
//                                         width: 20,
//                                         child: SvgPicture.asset(
//                                           "assets/images/dehaze.svg",
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       Divider(
//                                         color: Colors.white12,
//                                         thickness: .7,
//                                       ),
//                                       Container(
//                                         height: sizeAware.height *
//                                             0.160857142857143,
//                                         child: appAuthState &&
//                                                 user.firstName != null
//                                             ? GestureDetector(
//                                                 onTap: () {
//                                                   _scaffoldKey.currentState!
//                                                       .closeDrawer();
//                                                   context
//                                                       .read<
//                                                           BottomNavigationProvider>()
//                                                       .index = 3;
//                                                 },
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: [
//                                                     Container(
//                                                       decoration: BoxDecoration(
//                                                           shape:
//                                                               BoxShape.circle,
//                                                           border: Border.all(
//                                                               width: 3,
//                                                               color: Colors
//                                                                   .white)),
//                                                       child: CircleAvatar(
//                                                           radius: 30,
//                                                           backgroundImage: (user
//                                                                           .avatar ==
//                                                                       null ||
//                                                                   user.avatar ==
//                                                                       ""
//                                                               ? AssetImage(
//                                                                   "assets/images/profile.png")
//                                                               : CachedNetworkImageProvider(
//                                                                   getImagePath(user
//                                                                       .avatar!))) as ImageProvider),
//                                                     ),
//                                                     if (user != null)
//                                                       Expanded(
//                                                         child: Container(
//                                                           margin:
//                                                               EdgeInsets.all(8),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .center,
//                                                             children: [
//                                                               baseText(
//                                                                 user!.firstName
//                                                                         .toString() +
//                                                                     " " +
//                                                                     user.lastName
//                                                                         .toString(),
//                                                                 color: Colors
//                                                                     .white,
//                                                               ),
//                                                               baseText(
//                                                                   user.email
//                                                                           .toString() ??
//                                                                       '',
//                                                                   color: Colors
//                                                                       .white,
//                                                                   size: 11.0),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     GestureDetector(
//                                                       onTap: () {
//                                                         Navigator.push(
//                                                                 context,
//                                                                 PageTransition(
//                                                                     duration: Duration(
//                                                                         milliseconds:
//                                                                             1000),
//                                                                     type: PageTransitionType
//                                                                         .fade,
//                                                                     child:
//                                                                         EditProfilePage()))
//                                                             .then((value) {
//                                                           if (value ==
//                                                               'refresh') {
//                                                             _bloc.add(
//                                                                 InitHome());
//                                                           }
//                                                         });
//                                                       },
//                                                       child: FittedBox(
//                                                         child: Container(
//                                                             margin:
//                                                                 EdgeInsets.all(
//                                                                     8),
//                                                             child: Icon(
//                                                               Icons
//                                                                   .edit_outlined,
//                                                               color:
//                                                                   Colors.white,
//                                                             )),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                             : Container(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 width: double.infinity,
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.white,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8)),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Column(
//                                                       children: [
//                                                         FittedBox(
//                                                           child: Text(
//                                                             AppLocalizations.of(
//                                                                     context)
//                                                                 .translate(
//                                                                     "Welcome"),
//                                                             style: TextStyle(
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w200),
//                                                           ),
//                                                         ),
//                                                         Expanded(
//                                                           child: Text(
//                                                             AppLocalizations.of(
//                                                                     context)
//                                                                 .translate(
//                                                                     "Please log in to enjoy the purchase"),
//                                                             softWrap: true,
//                                                             style: TextStyle(
//                                                                 fontSize: 14,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold),
//                                                           ),
//                                                         ),
//                                                         InkWell(
//                                                           onTap: () {
//                                                             Navigator.of(context).pushReplacement(PageTransition(
//                                                                 duration: Duration(
//                                                                     milliseconds:
//                                                                         500),
//                                                                 type:
//                                                                     PageTransitionType
//                                                                         .fade,
//                                                                 child:
//                                                                     SignInPage()));
//                                                           },
//                                                           child: Container(
//                                                             decoration: BoxDecoration(
//                                                                 color:
//                                                                     primaryColor,
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             16)),
//                                                             alignment:
//                                                                 AlignmentDirectional
//                                                                     .center,
//                                                             padding:
//                                                                 EdgeInsets.all(
//                                                                     10),
//                                                             margin:
//                                                                 EdgeInsets.all(
//                                                                     10),
//                                                             width: sizeAware
//                                                                     .width *
//                                                                 0.4,
//                                                             child: Text(
//                                                               AppLocalizations.of(
//                                                                       context)
//                                                                   .translate(
//                                                                       "sign in"),
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .white),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                       ),
//                                       Divider(
//                                         color: Colors.white,
//                                         thickness: .7,
//                                       ),
//                                     ],
//                                   )),
//                                   // accountEmail: Text(''), // keep blank text because email is required
//                                 ),
//                               ),
//                               Expanded(
//                                 child: SingleChildScrollView(
//                                   child: Column(
//                                     children: [
//                                       SizedBox(
//                                         height: 20,
//                                       ),
//                                       GestureDetector(
//                                         child: Padding(
//                                             padding: EdgeInsetsDirectional.only(
//                                                 start: 10, end: 10),
//                                             child: Container(
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(12),
//                                                 color: provider.index == 0
//                                                     ? othercolor
//                                                         .withOpacity(0.2)
//                                                     : Colors.white,
//                                               ),
//                                               child: ListTile(
//                                                 leading: SvgPicture.asset(
//                                                     "assets/images/home.svg",
//                                                     width: 24,
//                                                     height: 24,
//                                                     color: provider.index == 0
//                                                         ? primaryColor
//                                                         : Colors.black),
//                                                 title: Text(
//                                                   AppLocalizations.of(context)
//                                                       .translate("Home"),
//                                                   style: TextStyle(
//                                                       color: provider.index == 0
//                                                           ? primaryColor
//                                                           : Colors.black,
//                                                       fontSize: 10),
//                                                 ),
//                                               ),
//                                             )),
//                                         onTap: () {
//                                           setState(() {
//                                             provider.index = 0;
//                                           });
//                                           print(provider.index);
//                                           Navigator.pop(context);
//                                         },
//                                       ),
//                                       GestureDetector(
//                                         child: Padding(
//                                           padding: EdgeInsets.only(
//                                               left: 10, right: 10),
//                                           child: Container(
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(12),
//                                                 color: provider.index == 1
//                                                     ? othercolor
//                                                         .withOpacity(0.2)
//                                                     : Colors.white,
//                                               ),
//                                               child: ListTile(
//                                                 leading: //SvgPicture.asset("assets/bell.png",width: 20,height: 20,),
//                                                     SvgPicture.asset(
//                                                   "assets/images/category.svg",
//                                                   width: 24,
//                                                   height: 24,
//                                                   color: provider.index == 1
//                                                       ? primaryColor
//                                                       : Colors.black,
//                                                 ),
//                                                 title: Text(
//                                                   AppLocalizations.of(context)
//                                                       .translate("Categories"),
//                                                   style: TextStyle(
//                                                       color: provider.index == 1
//                                                           ? primaryColor
//                                                           : Colors.black,
//                                                       fontSize: 10),
//                                                 ),
//                                               )),
//                                         ),
//                                         onTap: () {
//                                           setState(() {
//                                             provider.index = 2;
//                                           });
//                                           print(provider.index);
//                                           Navigator.pop(context);
//                                         },
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           Navigator.of(context).push(
//                                               PageTransition(
//                                                   duration: Duration(
//                                                       milliseconds: 700),
//                                                   type: PageTransitionType.fade,
//                                                   child: AllProductsPage(
//                                                     custom_filter: CustomFilter(
//                                                         search: ""),
//                                                     title: '',
//                                                   )));
//                                         },
//                                         child: Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, right: 10),
//                                             child: Container(
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(12),
//                                                   color: Colors.white,
//                                                 ),
//                                                 child: ListTile(
//                                                   leading: SvgPicture.asset(
//                                                     "assets/images/products.svg",
//                                                     width: 24,
//                                                     height: 24,
//                                                     color: Colors.black,
//                                                   ),
//                                                   title: Text(
//                                                     AppLocalizations.of(context)
//                                                         .translate("Products"),
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 10),
//                                                   ),
//                                                 ))),
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           Navigator.of(context).push(
//                                               PageTransition(
//                                                   duration: Duration(
//                                                       milliseconds: 700),
//                                                   type: PageTransitionType.fade,
//                                                   child: AllProjectsPage(
//                                                     custom_filter: CustomFilter(
//                                                         search: ""),
//                                                   )));
//                                         },
//                                         child: Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, right: 10),
//                                             child: Container(
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(12),
//                                                   color: Colors.white,
//                                                 ),
//                                                 child: ListTile(
//                                                   leading: SvgPicture.asset(
//                                                     "assets/images/projects.svg",
//                                                     width: 24,
//                                                     height: 24,
//                                                     color: Colors.black,
//                                                   ),
//                                                   title: Text(
//                                                     AppLocalizations.of(context)
//                                                         .translate("Projects"),
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 10),
//                                                   ),
//                                                 ))),
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           Navigator.of(context).push(
//                                               PageTransition(
//                                                   duration: Duration(
//                                                       milliseconds: 700),
//                                                   type: PageTransitionType.fade,
//                                                   child: AllServicesPage(
//                                                     custom_filter: CustomFilter(
//                                                         search: ""),
//                                                   )));
//                                         },
//                                         child: Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, right: 10),
//                                             child: Container(
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(12),
//                                                   color: Colors.white,
//                                                 ),
//                                                 child: ListTile(
//                                                   leading: SvgPicture.asset(
//                                                     "assets/images/services.svg",
//                                                     width: 24,
//                                                     height: 24,
//                                                     color: Colors.black,
//                                                   ),
//                                                   title: Text(
//                                                     AppLocalizations.of(context)
//                                                         .translate("Services"),
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 10),
//                                                   ),
//                                                 ))),
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           Navigator.of(context).push(
//                                               PageTransition(
//                                                   duration: Duration(
//                                                       milliseconds: 700),
//                                                   type: PageTransitionType.fade,
//                                                   child: AllEventPage()));
//                                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>
//                                           //     CompleteProfilePage(phone: '', email: 'email')));
//                                         },
//                                         child: Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, right: 10),
//                                             child: Container(
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(12),
//                                                   color: Colors.white,
//                                                 ),
//                                                 child: ListTile(
//                                                   leading: Icon(Icons
//                                                       .local_fire_department_sharp),
//                                                   title: Text(
//                                                     AppLocalizations.of(context)
//                                                         .translate("Events"),
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 10),
//                                                   ),
//                                                 ))),
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           final _bloc = sl<AppBloc>();
//                                           if (languageCode == 'en') {
//                                             _bloc.add(SetNewLanguage('ar'));
//                                           } else {
//                                             _bloc.add(SetNewLanguage('en'));
//                                           }
//
//                                           // Access the language code
//                                           // Navigator.of(context).push(PageTransition(
//                                           //     duration: Duration(milliseconds: 700),
//                                           //     type: PageTransitionType.fade,
//                                           //     child: AllProjectsPage(
//                                           //       custom_filter:
//                                           //       CustomFilter(search: ""),
//                                           //     )));
//                                         },
//                                         child: Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, right: 10),
//                                             child: Container(
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(12),
//                                                   color: Colors.white,
//                                                 ),
//                                                 child: ListTile(
//                                                   leading: Icon(
//                                                     Icons.language_outlined,
//                                                     size: 24,
//                                                     color: Colors.black87,
//                                                   ),
//                                                   title: Text(
//                                                     AppLocalizations.of(context)
//                                                         .translate("Language"),
//                                                     style: TextStyle(
//                                                         color: Colors.black
//                                                             .withOpacity(0.8),
//                                                         fontSize: 10),
//                                                   ),
//                                                   trailing: Container(
//                                                     width: 80,
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment.end,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Container(
//                                                           width: 30,
//                                                           height: 35,
//                                                           decoration: BoxDecoration(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           8),
//                                                               color: languageCode ==
//                                                                       'en'
//                                                                   ? Colors
//                                                                       .transparent
//                                                                   : primaryColor,
//                                                               border: Border.all(
//                                                                   color: languageCode ==
//                                                                           'en'
//                                                                       ? Colors
//                                                                           .black54
//                                                                       : Colors
//                                                                           .transparent)),
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                     .only(
//                                                                     top: 5.0),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 'AR',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     color: languageCode ==
//                                                                             'en'
//                                                                         ? Colors
//                                                                             .black54
//                                                                         : Colors
//                                                                             .white,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w700),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: 10,
//                                                         ),
//                                                         Container(
//                                                           width: 30,
//                                                           height: 35,
//                                                           decoration: BoxDecoration(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           8),
//                                                               color: languageCode ==
//                                                                       'ar'
//                                                                   ? Colors
//                                                                       .transparent
//                                                                   : primaryColor,
//                                                               border: Border.all(
//                                                                   color: languageCode ==
//                                                                           'ar'
//                                                                       ? Colors
//                                                                           .black54
//                                                                       : Colors
//                                                                           .transparent)),
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                     .only(
//                                                                     top: 5.0),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 'EN',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     color: languageCode ==
//                                                                             'ar'
//                                                                         ? Colors
//                                                                             .black54
//                                                                         : Colors
//                                                                             .white,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w700),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ))),
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           Navigator.of(context).push(
//                                               PageTransition(
//                                                   duration: Duration(
//                                                       milliseconds: 700),
//                                                   type: PageTransitionType.fade,
//                                                   child: AboutUsPage()));
//                                         },
//                                         child: Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: 10, right: 10),
//                                             child: Container(
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(12),
//                                                   color: Colors.white,
//                                                 ),
//                                                 child: ListTile(
//                                                   leading: SvgPicture.asset(
//                                                     "assets/images/warning.svg",
//                                                     width: 24,
//                                                     height: 24,
//                                                     color: Colors.black,
//                                                   ),
//                                                   title: Text(
//                                                     AppLocalizations.of(context)
//                                                         .translate("About Us"),
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 10),
//                                                   ),
//                                                 ))),
//                                       ),
//                                       GestureDetector(
//                                           child: Padding(
//                                               padding: EdgeInsets.only(
//                                                   left: 10, right: 10),
//                                               child: Container(
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             12),
//                                                     color: Colors.white,
//                                                   ),
//                                                   child: ListTile(
//                                                     leading: SvgPicture.asset(
//                                                       "assets/images/call.svg",
//                                                       width: 24,
//                                                       height: 24,
//                                                       color: Colors.black,
//                                                     ),
//                                                     title: Text(
//                                                       AppLocalizations.of(
//                                                               context)
//                                                           .translate(
//                                                               "Contact Us"),
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 10),
//                                                     ),
//                                                     onTap: () => Navigator.of(
//                                                             context)
//                                                         .push(PageTransition(
//                                                             duration: Duration(
//                                                                 milliseconds:
//                                                                     700),
//                                                             type:
//                                                                 PageTransitionType
//                                                                     .fade,
//                                                             child:
//                                                                 ContactPage())),
//                                                   )))),
//                                       appAuthState
//                                           ? Container(
//                                               color: Colors.white,
//                                               padding: EdgeInsets.only(
//                                                   left: 10, right: 10),
//                                               child: ListTile(
//                                                 leading: Icon(
//                                                   Icons.logout,
//                                                   color: Colors.black,
//                                                 ),
//                                                 title: Text(
//                                                   AppLocalizations.of(context)
//                                                       .translate("Log out"),
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 10),
//                                                 ),
//                                                 onTap: () {
//                                                   AwesomeDialog(
//                                                     context: context,
//                                                     customHeader: Container(
//                                                       child: Icon(
//                                                         Icons.logout,
//                                                         size: 60,
//                                                         color: primaryColor,
//                                                       ),
//                                                     ),
//                                                     btnCancelText:
//                                                         AppLocalizations.of(
//                                                                 context)
//                                                             .translate(
//                                                                 "Cancel"),
//                                                     btnOkText:
//                                                         AppLocalizations.of(
//                                                                 context)
//                                                             .translate("Ok"),
//                                                     btnOkColor: primaryColor,
//                                                     dialogType:
//                                                         DialogType.warning,
//                                                     animType:
//                                                         AnimType.bottomSlide,
//                                                     title: AppLocalizations.of(
//                                                             context)
//                                                         .translate('sign out'),
//                                                     desc: AppLocalizations.of(
//                                                             context)
//                                                         .translate(
//                                                             'are you sure you want to logout'),
//                                                     btnCancelOnPress: () {},
//                                                     btnOkOnPress: () {
//                                                       sl<AppBloc>()
//                                                           .add(LogOutUser());
//
//                                                       Navigator.of(context)
//                                                           .pushReplacement(PageTransition(
//                                                               duration: Duration(
//                                                                   milliseconds:
//                                                                       1000),
//                                                               type:
//                                                                   PageTransitionType
//                                                                       .fade,
//                                                               child:
//                                                                   SignInPage()));
//                                                     },
//                                                   )..show();
//                                                 },
//                                               ))
//                                           : Container(),
//                                       appAuthState
//                                           ? Container(
//                                               color: Colors.white,
//                                               padding: EdgeInsets.only(
//                                                   left: 10, right: 10),
//                                               child: ListTile(
//                                                 leading: Icon(
//                                                   Icons.delete,
//                                                   color: Colors.black,
//                                                 ),
//                                                 title: Text(
//                                                   AppLocalizations.of(context)
//                                                       .translate(
//                                                           "Delete Account"),
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontSize: 10),
//                                                 ),
//                                                 onTap: () {
//                                                   AwesomeDialog(
//                                                     context: context,
//                                                     customHeader: Container(
//                                                       child: Icon(
//                                                         Icons.delete,
//                                                         size: 60,
//                                                         color: primaryColor,
//                                                       ),
//                                                     ),
//                                                     btnCancelText:
//                                                         AppLocalizations.of(
//                                                                 context)
//                                                             .translate(
//                                                                 "Cancel"),
//                                                     btnOkText:
//                                                         AppLocalizations.of(
//                                                                 context)
//                                                             .translate("Ok"),
//                                                     btnOkColor: primaryColor,
//                                                     dialogType:
//                                                         DialogType.warning,
//                                                     animType:
//                                                         AnimType.bottomSlide,
//                                                     title: AppLocalizations.of(
//                                                             context)
//                                                         .translate(
//                                                             "Delete Account"),
//                                                     desc: AppLocalizations.of(
//                                                             context)
//                                                         .translate(
//                                                             "are you sure you want to delete Account"),
//                                                     btnCancelOnPress: () {},
//                                                     btnOkOnPress: () {
//                                                       sl<AppBloc>()
//                                                           .add(DeleteAccount());
//                                                       Navigator.of(context)
//                                                           .pushReplacement(PageTransition(
//                                                               duration: Duration(milliseconds: 1000),
//                                                               type: PageTransitionType.fade,
//                                                               child: SignInPage()));
//                                                     },
//                                                   )..show();
//                                                 },
//                                               ))
//                                           : Container(),
//                                       SizedBox(
//                                         height: 40,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           )),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//                 body: PageTransitionSwitcher(
//                   duration: Duration(milliseconds: 1100),
//                   transitionBuilder: (
//                     Widget child,
//                     Animation<double> animation,
//                     Animation<double> secondaryAnimation,
//                   ) {
//                     return FadeThroughTransition(
//                       animation: animation,
//                       secondaryAnimation: secondaryAnimation,
//                       child: child,
//                     );
//                   },
//                   child: pages[_currentIndex],
//                 ),
//               ),
//             );
//           });
//     });
//   }
// }
