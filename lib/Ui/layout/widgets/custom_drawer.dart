// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:taknikat/Ui/AllProducts_WithFilter_page/all_products_page.dart';
// import 'package:taknikat/Ui/AllProjects_WithFilter_page/all_projects_page.dart';
// import 'package:taknikat/Ui/AllServices_WithFilter_page/all_services_page.dart';
// import 'package:taknikat/Ui/about_us/about_us_page.dart';
// import 'package:taknikat/Ui/all_events_page/all_events_page.dart';
// import 'package:taknikat/Ui/auth_screen/page/signin_page.dart';
// import 'package:taknikat/Ui/contactus_page/contactus_page.dart';
// import 'package:taknikat/Ui/home_page/bloc/home_bloc.dart';
// import 'package:taknikat/Ui/home_page/bloc/home_event.dart';
// import 'package:taknikat/Ui/setting_page/edit_profile_page/edit_profile_page.dart';
// import 'package:taknikat/app/bloc/app_bloc.dart';
// import 'package:taknikat/app/bloc/app_event.dart';
// import 'package:taknikat/core/base_widget/base_text.dart';
// import 'package:taknikat/core/constent.dart';
// import 'package:taknikat/core/filters/filter_class.dart';
// import 'package:taknikat/core/style/custom_loader.dart';
// import 'package:taknikat/injectoin.dart';
// import '../../../core/app_localizations.dart';
// import '../../base_page/navigation_bar_provider.dart';
// import '../../setting_page/bloc/settings_bloc.dart';
// import '../../setting_page/bloc/settings_event.dart';
// import '../../setting_page/bloc/settings_state.dart';
//
// class CustomDrawer extends StatefulWidget {
//   final GlobalKey<ScaffoldState> keyScreen;
//   const CustomDrawer({Key? key, required this.keyScreen}) : super(key: key);
//
//   @override
//   _CustomDrawerState createState() => _CustomDrawerState();
// }
//
// class _CustomDrawerState extends State<CustomDrawer> {
//   final _bloc2 = sl<SettingsBloc>();
//   final _bloc = sl<HomeBloc>();
//
//   @override
//   void initState() {
//     _bloc2.add(InitSettings());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  new Drawer(
//       child: BlocConsumer(
//         listener: (context,SettingsState state){},
//         bloc: _bloc2,
//         builder: (context,SettingsState state) {
//           var user = state.user;
//
//           return Stack(
//             children: [
//               state.isLoading
//                   ? Center(child: loader(context: context))
//                   : Container(),
//               Positioned.fill(
//                   child: Column(
//                     children: [
//                       Container(
//                         height: sizeAware.height / 3.0 + 1,
//                         color: primaryColor,
//                         child: DrawerHeader(
//                           child: Container(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     height: 20,
//                                     width: 20,
//                                     child: SvgPicture.asset(
//                                       "assets/images/dehaze.svg",
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Divider(
//                                     color: Colors.white12,
//                                     thickness: .7,
//                                   ),
//                                   Container(
//                                     height:
//                                     sizeAware.height * 0.160857142857143,
//                                     child: appAuthState &&user.firstName!=null ?
//                                     GestureDetector(
//                                       onTap: () {
//                                         widget.keyScreen.currentState!.closeDrawer();context
//                                             .read<BottomNavigationProvider>().index = 3;
//                                       },
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 border: Border.all(
//                                                     width: 3,
//                                                     color: Colors.white)),
//                                             child: CircleAvatar(
//                                                 radius: 30,
//                                                 backgroundImage: (user.avatar ==
//                                                     null ||
//                                                     user.avatar == ""
//                                                     ? AssetImage(
//                                                     "assets/images/profile.png")
//                                                     : CachedNetworkImageProvider(
//                                                     getImagePath(user
//                                                         .avatar!)))
//                                                 as ImageProvider),
//                                           ),
//                                           if( user!=null)
//                                             Expanded(
//                                               child: Container(
//                                                 margin: EdgeInsets.all(8),
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                   CrossAxisAlignment
//                                                       .start,
//                                                   mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .center,
//                                                   children: [
//                                                     baseText(
//                                                       user!.firstName
//                                                           .toString() +
//                                                           " " +
//                                                           user.lastName
//                                                               .toString(),
//                                                       color: Colors.white,
//                                                     ),
//                                                     baseText(
//                                                         user.email
//                                                             .toString()??'',
//                                                         color: Colors.white,
//                                                         size: 11.0),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           GestureDetector(
//                                             onTap: () {
//                                               Navigator.push(
//                                                   context,
//                                                   PageTransition(
//                                                       duration: Duration(
//                                                           milliseconds: 1000),
//                                                       type:
//                                                       PageTransitionType
//                                                           .fade,
//                                                       child:
//                                                       EditProfilePage()))
//                                                   .then((value) {
//                                                 if (value == 'refresh') {
//                                                   _bloc.add(InitHome());
//                                                 }
//                                               });
//                                             },
//                                             child: FittedBox(
//                                               child: Container(
//                                                   margin:
//                                                   EdgeInsets.all(8),
//                                                   child: Icon(
//                                                     Icons.edit_outlined,
//                                                     color: Colors.white,
//                                                   )),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                         : Container(
//                                       padding: const EdgeInsets.all(8.0),
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius:
//                                           BorderRadius.circular(8)),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.center,
//                                         children: [
//                                           Column(
//                                             children: [
//                                               FittedBox(
//                                                 child: Text(
//                                                   AppLocalizations.of(
//                                                       context)
//                                                       .translate(
//                                                       "Welcome"),
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                       FontWeight
//                                                           .w200),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                 child: Text(
//                                                   AppLocalizations.of(
//                                                       context)
//                                                       .translate(
//                                                       "Please log in to enjoy the purchase"),
//                                                   softWrap: true,
//                                                   style: TextStyle(
//                                                       fontSize: 14,
//                                                       fontWeight:
//                                                       FontWeight
//                                                           .bold),
//                                                 ),
//                                               ),
//                                               InkWell(
//                                                 onTap: () {
//                                                   Navigator.of(context)
//                                                       .pushReplacement(PageTransition(
//                                                       duration: Duration(
//                                                           milliseconds:
//                                                           500),
//                                                       type:
//                                                       PageTransitionType
//                                                           .fade,
//                                                       child:
//                                                       SignInPage()));
//                                                 },
//                                                 child: Container(
//                                                   decoration: BoxDecoration(
//                                                       color: primaryColor,
//                                                       borderRadius:
//                                                       BorderRadius
//                                                           .circular(
//                                                           16)),
//                                                   alignment:
//                                                   AlignmentDirectional
//                                                       .center,
//                                                   padding:
//                                                   EdgeInsets.all(10),
//                                                   margin:
//                                                   EdgeInsets.all(10),
//                                                   width: sizeAware.width *
//                                                       0.4,
//                                                   child: Text(
//                                                     AppLocalizations.of(
//                                                         context)
//                                                         .translate(
//                                                         "sign in"),
//                                                     style: TextStyle(
//                                                         color:
//                                                         Colors.white),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Divider(
//                                     color: Colors.white,
//                                     thickness: .7,
//                                   ),
//                                 ],
//                               )),
//                           // accountEmail: Text(''), // keep blank text because email is required
//                         ),
//                       ),
//                       Expanded(
//                         child: SingleChildScrollView(
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               GestureDetector(
//                                 child: Padding(
//                                     padding: EdgeInsetsDirectional.only(
//                                         start: 10, end: 10),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                         BorderRadius.circular(12),
//                                         color: provider.index == 0
//                                             ? othercolor.withOpacity(0.2)
//                                             : Colors.white,
//                                       ),
//                                       child: ListTile(
//                                         leading: SvgPicture.asset(
//                                             "assets/images/home.svg",
//                                             width: 24,
//                                             height: 24,
//                                             color: provider.index == 0
//                                                 ? primaryColor
//                                                 : Colors.black),
//                                         title: Text(
//                                           AppLocalizations.of(context)
//                                               .translate("Home"),
//                                           style: TextStyle(
//                                               color: provider.index == 0
//                                                   ? primaryColor
//                                                   : Colors.black,
//                                               fontSize: 10),
//                                         ),
//                                       ),
//                                     )),
//                                 onTap: () {
//                                   setState(() {
//                                     provider.index = 0;
//                                   });
//                                   print(provider.index);
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                               GestureDetector(
//                                 child: Padding(
//                                   padding:
//                                   EdgeInsets.only(left: 10, right: 10),
//                                   child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                         BorderRadius.circular(12),
//                                         color: provider.index == 1
//                                             ? othercolor.withOpacity(0.2)
//                                             : Colors.white,
//                                       ),
//                                       child: ListTile(
//                                         leading: //SvgPicture.asset("assets/bell.png",width: 20,height: 20,),
//                                         SvgPicture.asset(
//                                           "assets/images/category.svg",
//                                           width: 24,
//                                           height: 24,
//                                           color: provider.index == 1
//                                               ? primaryColor
//                                               : Colors.black,
//                                         ),
//                                         title: Text(
//                                           AppLocalizations.of(context)
//                                               .translate("Categories"),
//                                           style: TextStyle(
//                                               color: provider.index == 1
//                                                   ? primaryColor
//                                                   : Colors.black,
//                                               fontSize: 10),
//                                         ),
//                                       )),
//                                 ),
//                                 onTap: () {
//                                   setState(() {
//                                     provider.index = 2;
//                                   });
//                                   print(provider.index);
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.of(context).push(PageTransition(
//                                       duration: Duration(milliseconds: 700),
//                                       type: PageTransitionType.fade,
//                                       child: AllProductsPage(
//                                         custom_filter:
//                                         CustomFilter(search: ""),
//                                         title: '',
//                                       )));
//                                 },
//                                 child: Padding(
//                                     padding: EdgeInsets.only(
//                                         left: 10, right: 10),
//                                     child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                           BorderRadius.circular(12),
//                                           color: Colors.white,
//                                         ),
//                                         child: ListTile(
//                                           leading: SvgPicture.asset(
//                                             "assets/images/products.svg",
//                                             width: 24,
//                                             height: 24,
//                                             color: Colors.black,
//                                           ),
//                                           title: Text(
//                                             AppLocalizations.of(context)
//                                                 .translate("Products"),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 10),
//                                           ),
//                                         ))),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.of(context).push(PageTransition(
//                                       duration: Duration(milliseconds: 700),
//                                       type: PageTransitionType.fade,
//                                       child: AllProjectsPage(
//                                         custom_filter:
//                                         CustomFilter(search: ""),
//                                       )));
//                                 },
//                                 child: Padding(
//                                     padding: EdgeInsets.only(
//                                         left: 10, right: 10),
//                                     child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                           BorderRadius.circular(12),
//                                           color: Colors.white,
//                                         ),
//                                         child: ListTile(
//                                           leading: SvgPicture.asset(
//                                             "assets/images/projects.svg",
//                                             width: 24,
//                                             height: 24,
//                                             color: Colors.black,
//                                           ),
//                                           title: Text(
//                                             AppLocalizations.of(context)
//                                                 .translate("Projects"),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 10),
//                                           ),
//                                         ))),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.of(context).push(PageTransition(
//                                       duration: Duration(milliseconds: 700),
//                                       type: PageTransitionType.fade,
//                                       child: AllServicesPage(
//                                         custom_filter:
//                                         CustomFilter(search: ""),
//                                       )));
//                                 },
//                                 child: Padding(
//                                     padding: EdgeInsets.only(
//                                         left: 10, right: 10),
//                                     child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                           BorderRadius.circular(12),
//                                           color: Colors.white,
//                                         ),
//                                         child: ListTile(
//                                           leading: SvgPicture.asset(
//                                             "assets/images/services.svg",
//                                             width: 24,
//                                             height: 24,
//                                             color: Colors.black,
//                                           ),
//                                           title: Text(
//                                             AppLocalizations.of(context)
//                                                 .translate("Services"),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 10),
//                                           ),
//                                         ))),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.of(context).push(PageTransition(
//                                       duration: Duration(milliseconds: 700),
//                                       type: PageTransitionType.fade,
//                                       child: AllEventPage()));
//                                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>
//                                   //     CompleteProfilePage(phone: '', email: 'email')));
//                                 },
//                                 child: Padding(
//                                     padding: EdgeInsets.only(
//                                         left: 10, right: 10),
//                                     child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                           BorderRadius.circular(12),
//                                           color: Colors.white,
//                                         ),
//                                         child: ListTile(
//                                           leading: Icon(Icons
//                                               .local_fire_department_sharp),
//                                           title: Text(
//                                             AppLocalizations.of(context)
//                                                 .translate("Events"),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 10),
//                                           ),
//                                         ))),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   final _bloc = sl<AppBloc>();
//                                   if(languageCode=='en'){
//                                     _bloc.add(SetNewLanguage('ar'));
//                                   }else{
//                                     _bloc.add(SetNewLanguage('en'));
//                                   }
//
//                                   // Access the language code
//                                   // Navigator.of(context).push(PageTransition(
//                                   //     duration: Duration(milliseconds: 700),
//                                   //     type: PageTransitionType.fade,
//                                   //     child: AllProjectsPage(
//                                   //       custom_filter:
//                                   //       CustomFilter(search: ""),
//                                   //     )));
//                                 },
//                                 child: Padding(
//                                     padding: EdgeInsets.only(
//                                         left: 10, right: 10),
//                                     child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                           BorderRadius.circular(12),
//                                           color: Colors.white,
//                                         ),
//                                         child: ListTile(
//                                           leading: Icon(Icons.language_outlined,
//                                             size: 24,
//                                             color: Colors.black87,
//                                           ),
//                                           title: Text(
//                                             AppLocalizations.of(context)
//                                                 .translate("Language"),
//                                             style: TextStyle(
//                                                 color: Colors.black.withOpacity(0.8),
//                                                 fontSize: 10),
//                                           ),
//                                           trailing:
//                                           Container(
//                                             width: 80,
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.end,
//                                               crossAxisAlignment: CrossAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                   width: 30,
//                                                   height: 35,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius: BorderRadius.circular(8),
//                                                       color: languageCode=='en'?Colors.transparent:primaryColor,
//                                                       border: Border.all(color:
//                                                       languageCode=='en'?
//                                                       Colors.black54:Colors.transparent)
//                                                   ),
//                                                   child: Padding(
//                                                     padding: const EdgeInsets.only(top: 5.0),
//                                                     child: Center(
//                                                       child: Text('AR',
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             color: languageCode=='en'?Colors.black54:Colors.white,
//                                                             fontWeight: FontWeight.w700
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 SizedBox(width: 10,),
//                                                 Container(
//                                                   width: 30,
//                                                   height: 35,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius: BorderRadius.circular(8),
//                                                       color:  languageCode=='ar'?Colors.transparent:primaryColor,
//                                                       border: Border.all(color:
//                                                       languageCode=='ar'?
//                                                       Colors.black54:Colors.transparent)
//                                                   ),
//                                                   child: Padding(
//                                                     padding: const EdgeInsets.only(top: 5.0),
//                                                     child: Center(
//                                                       child: Text('EN',
//                                                         style: TextStyle(
//                                                             fontSize: 16,
//                                                             color: languageCode=='ar'?Colors.black54:Colors.white,
//                                                             fontWeight: FontWeight.w700
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ))),
//                               ),
//
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.of(context).push(PageTransition(
//                                       duration: Duration(milliseconds: 700),
//                                       type: PageTransitionType.fade,
//                                       child: AboutUsPage()));
//                                 },
//                                 child: Padding(
//                                     padding: EdgeInsets.only(
//                                         left: 10, right: 10),
//                                     child: Container(
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                           BorderRadius.circular(12),
//                                           color: Colors.white,
//                                         ),
//                                         child: ListTile(
//                                           leading: SvgPicture.asset(
//                                             "assets/images/warning.svg",
//                                             width: 24,
//                                             height: 24,
//                                             color: Colors.black,
//                                           ),
//                                           title: Text(
//                                             AppLocalizations.of(context)
//                                                 .translate("About Us"),
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 10),
//                                           ),
//                                         ))),
//                               ),
//                               GestureDetector(
//                                   child: Padding(
//                                       padding: EdgeInsets.only(
//                                           left: 10, right: 10),
//                                       child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                             BorderRadius.circular(12),
//                                             color: Colors.white,
//                                           ),
//                                           child: ListTile(
//                                             leading: SvgPicture.asset(
//                                               "assets/images/call.svg",
//                                               width: 24,
//                                               height: 24,
//                                               color: Colors.black,
//                                             ),
//                                             title: Text(
//                                               AppLocalizations.of(context)
//                                                   .translate("Contact Us"),
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 10),
//                                             ),
//                                             onTap: () => Navigator.of(
//                                                 context)
//                                                 .push(PageTransition(
//                                                 duration: Duration(
//                                                     milliseconds: 700),
//                                                 type: PageTransitionType
//                                                     .fade,
//                                                 child: ContactPage())),
//                                           )))),
//                               appAuthState
//                                   ? Container(
//                                   color: Colors.white,
//                                   padding: EdgeInsets.only(
//                                       left: 10, right: 10),
//                                   child: ListTile(
//                                     leading: Icon(
//                                       Icons.logout,
//                                       color: Colors.black,
//                                     ),
//                                     title: Text(
//                                       AppLocalizations.of(context)
//                                           .translate("Log out"),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 10),
//                                     ),
//                                     onTap: () {
//                                       AwesomeDialog(
//                                         context: context,
//                                         customHeader: Container(
//                                           child: Icon(
//                                             Icons.logout,
//                                             size: 60,
//                                             color: primaryColor,
//                                           ),
//                                         ),
//                                         btnCancelText:
//                                         AppLocalizations.of(context)
//                                             .translate("Cancel"),
//                                         btnOkText:
//                                         AppLocalizations.of(context)
//                                             .translate("Ok"),
//                                         btnOkColor: primaryColor,
//                                         dialogType: DialogType.warning,
//                                         animType: AnimType.bottomSlide,
//                                         title:
//                                         AppLocalizations.of(context)
//                                             .translate('sign out'),
//                                         desc: AppLocalizations.of(
//                                             context)
//                                             .translate(
//                                             'are you sure you want to logout'),
//                                         btnCancelOnPress: () {},
//                                         btnOkOnPress: () {
//                                           sl<AppBloc>()
//                                               .add(LogOutUser());
//
//                                           Navigator.of(context)
//                                               .pushReplacement(PageTransition(
//                                               duration: Duration(
//                                                   milliseconds:
//                                                   1000),
//                                               type:
//                                               PageTransitionType
//                                                   .fade,
//                                               child: SignInPage()));
//                                         },
//                                       )..show();
//                                     },
//                                   ))
//                                   : Container(),
//                               appAuthState
//                                   ? Container(
//                                   color: Colors.white,
//                                   padding: EdgeInsets.only(
//                                       left: 10, right: 10),
//                                   child: ListTile(
//                                     leading: Icon(
//                                       Icons.delete,
//                                       color: Colors.black,
//                                     ),
//                                     title: Text(
//                                       AppLocalizations.of(context)
//                                           .translate("Delete Account"),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 10),
//                                     ),
//                                     onTap: () {
//                                       AwesomeDialog(
//                                         context: context,
//                                         customHeader: Container(
//                                           child: Icon(
//                                             Icons.delete,
//                                             size: 60,
//                                             color: primaryColor,
//                                           ),
//                                         ),
//                                         btnCancelText:
//                                         AppLocalizations.of(context)
//                                             .translate("Cancel"),
//                                         btnOkText:
//                                         AppLocalizations.of(context)
//                                             .translate("Ok"),
//                                         btnOkColor: primaryColor,
//                                         dialogType: DialogType.warning,
//                                         animType: AnimType.bottomSlide,
//                                         title:  AppLocalizations.of(context)
//                                             .translate("Delete Account"),
//                                         desc:
//                                         AppLocalizations.of(context)
//                                             .translate("are you sure you want to delete Account"),
//                                         btnCancelOnPress: () {},
//                                         btnOkOnPress: () {
//                                           sl<AppBloc>()
//                                               .add(DeleteAccount());
//
//                                           Navigator.of(context)
//                                               .pushReplacement(PageTransition(
//                                               duration: Duration(
//                                                   milliseconds:
//                                                   1000),
//                                               type:
//                                               PageTransitionType
//                                                   .fade,
//                                               child: SignInPage()));
//                                         },
//                                       )..show();
//                                     },
//                                   ))
//                                   : Container(),
//                               SizedBox(
//                                 height: 40,
//                               )
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   )),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
