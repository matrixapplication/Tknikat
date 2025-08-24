import 'dart:io';

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
import '../../core/widgets/dialog/base/show_premetion_account_dialog.dart';
import '../../data/http_helper/http_helper.dart';
import '../gallery/gallery_category/gallary_category_screen.dart';
import '../gallery/gallery_screen.dart';
import '../layout/widgets/custom_bottom_bar.dart';
import '../my_orders/my_orders_screen.dart';
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
    print('updateFcmToken ${deviceToken}');
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
                                           if(appAuthState && user.firstName != null && checkUserPermission(PermissionType.accept_requests.name))
                                           DrawerItem(
                                               onTap: () {
                                                 Navigator.push(
                                                     context,
                                                     PageTransition(
                                                         duration: Duration(milliseconds: 1000),
                                                         type: PageTransitionType.fade,
                                                         child: MyOrdersScreen(
                                                           isProvider: true,
                                                         )));

                                               },
                                               image: AppImages.shop,
                                               title: getLangLocalization('MyOrdersProvider')),
                                           if(appAuthState && user.firstName != null)
                                             DrawerItem(
                                                 onTap: () {
                                                   Navigator.push(
                                                       context,
                                                       PageTransition(
                                                           duration: Duration(milliseconds: 1000),
                                                           type: PageTransitionType.fade,
                                                           child: MyOrdersScreen(
                                                               isProvider:false
                                                           )));

                                                 },
                                                 image: AppImages.pro2,
                                                 title:getLangLocalization('MyOrders')),
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
                     margin:Platform.isAndroid?
                    20.paddingBottom:0.paddingBottom,
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
                               onTap: () async{
                                 if (appUser != null) {
                                   await checkPermissionAndShowDialog(
                                   context,
                                   PermissionType.add_post.name,
                                   ).then((canDo){
                                     if (canDo) {
                                       Navigator.of(context).push(PageTransition(
                                           duration: Duration(milliseconds: 700),
                                           type: PageTransitionType.fade,
                                           child: AddPostScreen()));
                                     }
                                   });


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

                               onTap: ()async {
                                 if (appUser != null) {
                                   await checkPermissionAndShowDialog(
                                   context,
                                   PermissionType.add_product.name,
                                   ).then((canDo){
                                     if (canDo) {
                                       Navigator.of(context).push(MaterialPageRoute(
                                         builder: (context) => AddProductScreen(),
                                       ));
                                     }
                                   });

                                 } else {
                                   showLoginFirstDialog(context);
                                 }
                               }),

                           CircularMenuItem(
                               color: primaryColor,
                               icon: Icons.video_call_outlined,
                               image: AppImages.pro3,
                               badgeLabel: '${getLangLocalization('Services')}',

                               margin: 5, onTap: () async{
                             if (appUser != null) {
                               await checkPermissionAndShowDialog(
                               context,
                               PermissionType.add_service.name,
                               ).then((canDo){
                                 if (canDo) {
                                   Navigator.of(context).push(MaterialPageRoute(
                                     builder: (context) => AddServiceScreen(),
                                   ));
                                 }
                               });

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

                               onTap: () async{
                                 if (appUser != null) {
                                   await checkPermissionAndShowDialog(
                                   context,
                                   PermissionType.add_video.name,
                                   ).then((canDo){
                                     if (canDo) {
                                       Navigator.of(context).push(MaterialPageRoute(
                                         builder: (context) => AddProjectScreen(),
                                       ));
                                     }
                                   });


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

                               onTap: () async{
                                 if (appUser != null) {
                                   await checkPermissionAndShowDialog(
                                   context,
                                   PermissionType.add_event.name,
                                   ).then((canDo){
                                     if (canDo) {
                                       Navigator.of(context).push(MaterialPageRoute(
                                         builder: (context) => AddEventScreen(),
                                       ));
                                     }
                                   });


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
                               onTap: () async{
                                 if (appUser != null) {
                                   await checkPermissionAndShowDialog(
                                   context,
                                   PermissionType.create_album.name,
                                   ).then((canDo){
                                     if (canDo) {
                                       Navigator.of(context).push(MaterialPageRoute(
                                         builder: (context) => GalleryCategoryScreen(),
                                       ));
                                     }
                                   });

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
                          bottom: 0.h,
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
