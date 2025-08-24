import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart' as phs;
import 'package:taknikat/Ui/setting_page/bloc/settings_bloc.dart';
import 'package:taknikat/Ui/setting_page/edit_profile_page/social__accounts.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/core/widgets/tap_effect.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/country/country_model.dart';
import 'package:taknikat/model/skill_model/skill_model.dart';
import '../../../core/assets_image/app_images.dart';
import '../../../core/custom_text_field.dart';
import '../../../core/utils/date/date_converter.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/dialog/base/show_premetion_account_dialog.dart';
import '../../../core/widgets/images/custom_person_image.dart';
import '../../../core/widgets/inputs/country/countries.dart';
import '../../../core/widgets/inputs/custom_text_field_email.dart';
import '../../../core/widgets/inputs/custom_text_field_phone_code.dart';
import '../../../core/widgets/texts/black_texts.dart';
import '../../auth_screen/page/otp/widgets/auth_header_widget.dart';
import '../bloc/settings_state.dart';
import 'bloc/edit_profile_bloc.dart';
import 'bloc/edit_profile_event.dart';
import 'bloc/edit_profile_state.dart';
import 'package:collection/collection.dart';
class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isSwitched = true;
  bool stateAnimation = false;
  bool stateAnimationLanguage = false;
  bool isEdited = false;

  PhoneNumber initPhone =
      PhoneNumber(phoneNumber: '', dialCode: '+963', isoCode: 'SA');


  var _fnameController = TextEditingController();
  var _lnameController = TextEditingController();
  var _addressController = TextEditingController();
  var _birthdayController = TextEditingController();
  var _phoneController = TextEditingController();
  var _mailController = TextEditingController();
  var _summaryController = TextEditingController();
  final _bloc = sl<EditProfileBloc>();
  final _bloc2 = sl<SettingsBloc>();
  int? selectedCountry;
  int? selectedCity;
  String selectedGender = '';
  Country? currentCountry;
  List<SkillModel> listSkills = [];

  @override
  void initState() {
    super.initState();
    // _bloc2.add(InitSettings());
    _bloc.add(GetProfile());
    final user = appUser!;
    _fnameController.text = user.firstName ?? '';
    _lnameController.text = user.lastName ?? '';
    _addressController.text = user.address ?? '';
    _birthdayController.text = user.birthDate ?? '';
    print('dfgdfgdgdfgd birthDay ${user.birthDate}');
    print('dfgdfgdgdfgd address ${user.address}');
    _mailController.text = user.email ?? '';
    profileImage=getImagePath(user.avatar??'');
    // _phoneController.text = user.phoneNumber ?? '';
    _summaryController.text = user.summary ?? '';
    selectedCountry = user.countryId;
    selectedGender = user.gender ?? Gender.none.name;
    init();
    // setState(() {});
    listSkills = user.skills?.toList() ?? [];
     if (user.countryId != null) {
      currentCountry = _bloc2.state.countries.singleWhere((x) => x.id == user.countryId);
      if (currentCountry != null) selectedCity = user.cityId;

    }
    isEdited = false;
     setState(() {});
  }
  String? dialCodeText;

  void init() async {
    if (appUser!.phoneNumber != null) {
      final initPhone2 = phs.PhoneNumber.parse(appUser!.phoneNumber!);
      this.initPhone = PhoneNumber(
        phoneNumber: initPhone2.nsn,
        dialCode: initPhone2.countryCode,
        isoCode: initPhone2.isoCode.name,
      );
      dialCodeText=initPhone2.countryCode;
      setState(() {});
      _phoneController.text=initPhone.phoneNumber.toString();

    }
  }

  Future<bool?> _onBackPressed() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('هل تريد الخروج دون حفظ التغيرات؟'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('الخروج')),
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('الرجوع'))
        ],
      ),
    );
  }
   bool isPhoneShow = false;
  bool isEmailShow = false;
  bool isFaceBookShow = false;
  bool isLinkedInShow = false;
  bool isInstagramShow = false;
  bool isSnapchatShow = false;
  bool isTwitterShow = false;
  bool isYoutubeShow = false;
  bool isWhatsappShow = false;




  String? profileImage;
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String languageCode = myLocale.languageCode;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = isEdited ? await _onBackPressed() : true;
        return shouldPop ?? false;
      },
      child:

      Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: primaryColor,
          body:
          Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child:
                SvgPicture.asset(AppImages.back,height: double.infinity,fit: BoxFit.cover,),
              ),
             SingleChildScrollView(
               child: Column(
                 children: [
                   40.height,
                   AuthHeaderWidget(title: AppLocalizations.of(context).translate("profile edit")),
                   BlocConsumer(
                       bloc: _bloc,
                       listener: (BuildContext context, EditProfileState state) {},
                       builder: (BuildContext context, EditProfileState state) {
                         if (state.success) {
                           _bloc.add(GetProfile());
                           Future.delayed(Duration.zero, () {
                             AwesomeDialog(
                               context: context,
                               btnOkText: AppLocalizations.of(context).translate("Ok"),
                               btnOkColor: primaryColor,
                               dialogType: DialogType.success,
                               title: AppLocalizations.of(context)
                                   .translate("profile edit"),
                               desc: AppLocalizations.of(context).translate(
                                   "your profile has been updated successfully"),
                               btnOkOnPress: () {
                                 Navigator.of(context).pop();
                               },
                             )..show();
                           });
                         }
                         showToast(state.error);
                         if (state.error?.isNotEmpty ?? false) _bloc.add(ClearState());
                         return Stack(
                           children: [
                             SingleChildScrollView(
                               padding: 16.paddingHorizontal,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                  10.height,
                                  Container(
                                       width: double.infinity,
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           CustomPersonImage(
                                             imageUrl:profileImage,
                                             onAttachImage: (image){
                                               setState(() {
                                                 profileImage=image;
                                               });
                                             },
                                           ),
                                          32.height,
                                          Row(
                                            children: [
                                              Expanded(child: CustomTextField(
                                                title:AppLocalizations.of(context).translate("First Name"),
                                                hintText:AppLocalizations.of(context).translate("First Name"),
                                                controller: _fnameController,
                                              ),),
                                              8.width,

                                              Expanded(child: CustomTextField(
                                                title: AppLocalizations.of(context).translate("Last Name"),
                                                hintText:AppLocalizations.of(context).translate("Last Name"),
                                                controller: _lnameController,
                                              ),)
                                            ],
                                          ),

                                           CustomTextFieldEmail(
                                            title:AppLocalizations.of(context).translate("email"),
                                             controller: _mailController,
                                             suffixData:
                                             SizedBox(
                                               height: 30.h,
                                               width: 50.w,
                                               child: FittedBox(
                                                 child:  Switch(
                                                     activeColor: primaryColor,
                                                     value: appUser?.isEmailShow==1,
                                                     onChanged: (value)async {
                                                        await checkPermissionAndShowDialog(
                                                            context,
                                                            PermissionType.toggle_social_info.name,
                                                          ).then((canDo){
                                                           if (canDo) {
                                                             _bloc.add(ChangePersonalStatus((b) => b
                                                               ..keyValue = 'email'
                                                               ..statusValue = (value==true?'1':'0')));
                                                             setState(() {
                                                               isEdited = true;
                                                             });
                                                           }
                                                         });

                                                     }),
                                               ),
                                             )
                                           ),

                                           8.height,
                                           Padding(padding: 5.paddingBottom+0.paddingStart,
                                             child:
                                             BlackRegularText(label: AppLocalizations.of(context).translate("Phone Number"),fontSize: 16,fontWeight: FontWeight.w300,),
                                           ),
                                           StatefulBuilder(builder: (context,setState){
                                             return  CustomTextFieldPhoneCode(
                                               height: 46.h,
                                               // flagButtonMargin: 15.paddingBottom,
                                               suffixData:
                                               languageCode=='ar'?
                                               SizedBox(
                                                 height: 30.h,
                                                 width: 50.w,
                                                 child: FittedBox(
                                                   child:
                                                   Switch(
                                                       activeColor: primaryColor,
                                                       value: appUser?.isPhoneShow==1,
                                                       onChanged: (value) async{
                                                         await checkPermissionAndShowDialog(
                                                         context,
                                                         PermissionType.toggle_social_info.name,
                                                         ).then((canDo){
                                                           if (canDo) {
                                                             _bloc.add(
                                                                 ChangePersonalStatus((b) => b
                                                                   ..keyValue = 'phone'
                                                                   ..statusValue = (value==true?'1':'0')));
                                                             setState(() {
                                                               isEdited = true;
                                                             });
                                                           }
                                                         });


                                                       })
                                                 ),
                                               ):null,
                                               prefixWidget:
                                               languageCode=='en'?
                                               SizedBox(
                                                 height: 30.h,
                                                 width: 50.w,
                                                 child: FittedBox(
                                                     child:
                                                     Switch(
                                                         activeColor: primaryColor,
                                                         value: appUser?.isPhoneShow==1,
                                                         onChanged: (value) {
                                                           _bloc.add(
                                                               ChangePersonalStatus((b) => b
                                                                 ..keyValue = 'phone'
                                                                 ..statusValue = (value==true?'1':'0')));
                                                           setState(() {
                                                             isEdited = true;
                                                           });
                                                         })
                                                 ),
                                               ):null,
                                               hint:AppLocalizations.of(context).translate("Phone Number"),
                                               controller: _phoneController,
                                               initialCountry: countries.firstWhereOrNull(
                                                     (element) => element.code == initPhone.isoCode,
                                               ),
                                               defaultValue: _phoneController.text,
                                               onCountryChanged: (county){
                                                 print('dialCodeText dd ${dialCodeText}');

                                                 setState((){
                                                   dialCodeText=county.dialCode;
                                                 });
                                                 print('dialCodeText  ${dialCodeText}');

                                               },

                                               textInputAction: TextInputAction.next,
                                             );
                                           }),
                                           CustomTextField(
                                             suffixIcon:Icon(Icons.calendar_month_outlined) ,
                                             title: AppLocalizations.of(context).translate("Birthday"),
                                             hintText:AppLocalizations.of(context).translate("Birthday"),
                                             controller: _birthdayController,
                                             enable: false,
                                             onTap: (){
                                               showDatePicker(
                                                   context: context,
                                                   initialDate: DateTime.now(),
                                                   firstDate: DateTime(1900),
                                                   lastDate: DateTime(2050),
                                               ).then((value){
                                                 if(value!=null){
                                                   setState(() {
                                                    ;
                                                     _birthdayController.text =  DateConverter.toAppDateFormat2(value.toString()).toString();
                                                   });
                                                 }
                                               });
                                             },
                                           ),
                                           CustomTextField(
                                             title: AppLocalizations.of(context).translate("Address"),
                                             hintText:AppLocalizations.of(context).translate("Address"),
                                             controller: _addressController,
                                             maxLines: 3,
                                           ),
                                           Container(
                                             margin: EdgeInsets.all(6),
                                             child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 BlocBuilder<SettingsBloc, SettingsState>(
                                                   bloc: sl<SettingsBloc>(),
                                                   builder: (context, state) {
                                                     return Column(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         BlackRegularText(label:  AppLocalizations.of(context).translate("Country"),fontSize: 16,),
                                                         Container(
                                                           margin: EdgeInsets.all(6),
                                                           alignment: Alignment.center,
                                                           height: sizeAware.height * 0.056992,
                                                           decoration: BoxDecoration(
                                                             color: Color(0xffF7F7F8),
                                                             borderRadius:
                                                             BorderRadius.circular(10),
                                                           ),
                                                           child: DropdownButton<int>(
                                                             value: selectedCountry,
                                                             items: appCountries!.isEmpty ? [] : appCountries!.map(
                                                                   (e) =>
                                                                   DropdownMenuItem<
                                                                       int>(
                                                                     value: e.id,
                                                                     child: Padding(
                                                                       padding:
                                                                       const EdgeInsetsDirectional
                                                                           .only(
                                                                           start:
                                                                           8.0),
                                                                       child: Text(
                                                                         e.name??'',
                                                                         style:
                                                                         TextStyle(
                                                                           fontSize: 14,
                                                                         ),
                                                                       ),
                                                                     ),
                                                                   ),
                                                             )
                                                                 .toList(),
                                                             onChanged: (selected) {
                                                               setState(() {
                                                                 selectedCity=null;
                                                                 selectedCountry = selected!;
                                                                 currentCountry = appCountries!
                                                                     .singleWhere((x) =>
                                                                 x.id == selected);
                                                               });
                                                             },
                                                             isExpanded: true,
                                                             underline: Container(),
                                                             icon: Container(
                                                               margin: EdgeInsets.symmetric(
                                                                   horizontal: 10),
                                                               child: Icon(Icons.keyboard_arrow_down_rounded, color: primaryColor,
                                                               ),
                                                             ),
                                                             hint: Row(
                                                               children: [
                                                                 SizedBox(width: 4),
                                                                 Padding(
                                                                   padding:
                                                                   EdgeInsets.all(8.0),
                                                                   child: Text(
                                                                       AppLocalizations.of(
                                                                           context)
                                                                           .translate(
                                                                           "Country"),
                                                                       style: TextStyle()),
                                                                 ),
                                                               ],
                                                             ),
                                                           ),
                                                         ),
                                                         selectedCountry != null ?
                                                         Column(
                                                           crossAxisAlignment: CrossAxisAlignment.start,

                                                           children: [
                                                             BlackRegularText(label:  AppLocalizations.of(context).translate("City"),fontSize: 16,),
                                                             Container(
                                                                 margin: EdgeInsets.all(6),
                                                                 alignment: Alignment.center,
                                                                 height: sizeAware.height *
                                                                     0.056992,
                                                                 decoration: BoxDecoration(
                                                                   color: Color(0xffF7F7F8),
                                                                   borderRadius:
                                                                   BorderRadius.circular(
                                                                       10),
                                                                 ),
                                                                 child:
                                                                 DropdownButton<int>(
                                                                   value: selectedCity??null,
                                                                   items: currentCountry
                                                                       ?.cities
                                                                       .isEmpty ??
                                                                       false
                                                                       ? []
                                                                       : currentCountry!
                                                                       .cities
                                                                       .map(
                                                                         (e) =>
                                                                         DropdownMenuItem<
                                                                             int>(
                                                                           value: e.id,
                                                                           child:
                                                                           Padding(
                                                                             padding: const EdgeInsetsDirectional
                                                                                 .only(
                                                                                 start:
                                                                                 8.0),
                                                                             child: Text(
                                                                               e.name!,
                                                                               style:
                                                                               TextStyle(
                                                                                 fontSize:
                                                                                 14,
                                                                               ),
                                                                             ),
                                                                           ),
                                                                         ),
                                                                   )
                                                                       .toList(),
                                                                   onChanged: (selected) {
                                                                     setState(() {
                                                                       print(selected);
                                                                       selectedCity =
                                                                       selected!;
                                                                     });
                                                                   },
                                                                   isExpanded: true,
                                                                   underline: Container(),
                                                                   icon: Container(
                                                                     margin: EdgeInsets
                                                                         .symmetric(
                                                                         horizontal: 10),
                                                                     child: Icon(
                                                                       Icons
                                                                           .keyboard_arrow_down_rounded,
                                                                       color: primaryColor,
                                                                     ),
                                                                   ),
                                                                   hint: Row(
                                                                     children: [
                                                                       SizedBox(width: 4),
                                                                       Padding(
                                                                         padding:
                                                                         EdgeInsets.all(
                                                                             8.0),
                                                                         child: Text(
                                                                             AppLocalizations.of(
                                                                                 context)
                                                                                 .translate(
                                                                                 "City"),
                                                                             style:
                                                                             TextStyle()),
                                                                       ),
                                                                     ],
                                                                   ),
                                                                 ),
                                                             )
                                                           ],
                                                         )
                                                             : Container(),
                                                       ],
                                                     );
                                                   },
                                                 ),
                                               ],
                                             ),
                                           ),
                                           Padding(
                                             padding:
                                             EdgeInsets.symmetric(horizontal: 8.w,vertical: 16.h),
                                             child: Row(
                                               children: [
                                                 Expanded(
                                                   child: RadioListTile<String>(
                                                       contentPadding: EdgeInsets.zero,
                                                       value: Gender.male.apiKey,
                                                       groupValue: selectedGender,
                                                       onChanged: (value) {
                                                         setState(() {
                                                           selectedGender = value!;
                                                           isEdited = true;

                                                         });
                                                         print(selectedGender);
                                                       },
                                                       title:
                                                       Container(
                                                         decoration: BoxDecoration(
                                                           boxShadow: [
                                                             BoxShadow(
                                                                 color: Colors.black
                                                                     .withOpacity(0.03),
                                                                 blurRadius: 5,
                                                                 offset: Offset(4, 8))
                                                           ],
                                                           // color: Colors.white,
                                                           border: Border.all(color: Colors.black.withOpacity(0.05), width: 1),
                                                           borderRadius: BorderRadius.circular(20),
                                                         ),
                                                         padding: 16.paddingHorizontal+8.paddingVert,
                                                         child:
                                                        FittedBox(
                                                          fit: BoxFit.scaleDown,
                                                          child:  Row(
                                                            children: [
                                                              SvgPicture.asset(AppImages.male),
                                                              8.width,

                                                              Text(
                                                                AppLocalizations.of(context)
                                                                    .translate('male'),
                                                              ),

                                                            ],
                                                          ),
                                                        )
                                                       )
                                                   ),
                                                 ),
                                                 Expanded(
                                                   child: RadioListTile<String>(
                                                       contentPadding: EdgeInsets.zero,
                                                       value: Gender.female.apiKey,
                                                       groupValue: selectedGender,
                                                       onChanged: (value) {
                                                         setState(() {
                                                           selectedGender = value!;
                                                           isEdited = true;

                                                         });
                                                         print(selectedGender);
                                                       },
                                                       title:

                                                       Container(
                                                         decoration: BoxDecoration(
                                                           boxShadow: [
                                                             BoxShadow(
                                                                 color: Colors.black
                                                                     .withOpacity(0.03),
                                                                 blurRadius: 5,
                                                                 offset: Offset(4, 8))
                                                           ],
                                                           // color: Colors.white,
                                                           border: Border.all(color: Colors.black.withOpacity(0.05), width: 1),
                                                           borderRadius: BorderRadius.circular(20),
                                                         ),
                                                         padding: 16.paddingHorizontal+8.paddingVert,
                                                         child:
                                                        FittedBox(
                                                          fit: BoxFit.scaleDown,
                                                          child:  Row(
                                                            children: [
                                                              SvgPicture.asset(AppImages.female),
                                                              8.width,

                                                              Text(
                                                                AppLocalizations.of(context)
                                                                    .translate('female'),


                                                              ),

                                                            ],
                                                          ),
                                                        )
                                                       )

                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                           CustomTapEffect(onTap: (){
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>SocialAccountsScreen()));
                                           },
                                             child: Container(
                                             padding: 4.paddingAll,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(12.r),
                                                 color: Color(0xffE4F0FA)
                                             ),
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Padding(padding: 12.paddingHorizontal,
                                                   child: BlackRegularText(label:AppLocalizations.of(context).translate("socialAccounts"),fontSize: 16,),
                                                 ),
                                                 Container(
                                                   height: 36.h,
                                                   width: 36.h,
                                                   decoration: BoxDecoration(
                                                       borderRadius: BorderRadius.circular(8.r),
                                                       color: Colors.white
                                                   ),
                                                   child: Icon(Icons.arrow_forward),
                                                 )
                                               ],
                                             ),
                                           ),
                                           ),
                                           16.height,
                                           Container(
                                             margin: EdgeInsets.all(6),
                                             child:
                                             MultiSelectDialogField<SkillModel>(
                                               items: sl<SettingsBloc>()
                                                   .state
                                                   .skills
                                                   .map((e) =>
                                                   MultiSelectItem(e, e.name!))
                                                   .toList(),
                                               initialValue:
                                               appUser?.skills?.toList() ?? [],
                                               title: Text(
                                                 AppLocalizations.of(context)
                                                     .translate("Skills"),
                                                 style: TextStyle(),
                                               ),
                                               // selectedColor:
                                               //     Colors.blue,
                                               decoration: BoxDecoration(
                                                 color: Colors.grey[200],
                                                 borderRadius:
                                                 BorderRadius.circular(10),
                                               ),
                                               buttonIcon: Icon(
                                                 Icons.grid_on_outlined,
                                                 color: primaryColor,
                                               ),

                                               itemsTextStyle:
                                               TextStyle(color: Colors.black),
                                               selectedItemsTextStyle:
                                               TextStyle(color: Colors.black),
                                               unselectedColor: Colors.grey[200],
                                               selectedColor: primaryColor,

                                               buttonText: Text(
                                                 AppLocalizations.of(context)
                                                     .translate("Skills"),
                                                 style: TextStyle(),
                                               ),
                                               listType: MultiSelectListType.CHIP,
                                               onConfirm: (results) {
                                                 listSkills = results;
                                                 isEdited = true;
                                               },
                                             ),
                                           ),
                                           SizedBox(
                                             height: sizeAware.height * 0.08,
                                           ),

                                           CustomButton(
                                             loading: state.isLoading,
                                             onTap: (){
                                             _bloc.add(TryEdit((b) => b
                                               ..first_name = _fnameController.text
                                               ..last_name = _lnameController.text
                                               ..email = _mailController.text
                                               ..facebook = null
                                               ..instagram = null
                                               ..linkedin = null
                                               ..youtube = null
                                               ..snapchat =null
                                               ..phone = '+${dialCodeText}${_phoneController.text}'
                                               ..countryId = selectedCountry??0
                                               ..cityId = selectedCity??0
                                               ..skills = listSkills
                                               ..address = _addressController.text
                                               ..birthday = _birthdayController.text
                                               ..summary = _summaryController.text
                                               ..image = File(profileImage??'')
                                               ..gender = selectedGender));
                                             setState(() {
                                               isEdited = false;
                                             });
                                           },title: AppLocalizations.of(context).translate("Save Changes"),),
                                            16.height,
                                           // CustomButton(
                                           //   isOutlined: true,
                                           //   onTap: (){
                                           //     // Navigator.pop(context);
                                           //   },title: AppLocalizations.of(context).translate("Change Password"),)
                                         ],
                                       )),
                                   SizedBox(
                                     height: 40,
                                   )
                                 ],
                               ),
                             ),
                             state.isLoading
                                 ? Center(
                               child: loader(context: context),
                             )
                                 : Container()
                           ],
                         );
                       })
                 ],
               )
             )

            ],
          )));

  }


}
