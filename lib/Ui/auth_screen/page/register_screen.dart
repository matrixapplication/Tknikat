import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/auth_screen/page/verification_code_page.dart';

import '../../../core/app_localizations.dart';
import '../../../core/base_widget/base_toast.dart';
import '../../../core/constent.dart';
import '../../../core/custom_text_field.dart';
import '../../../core/style/custom_loader.dart';
import '../../../injectoin.dart';
import '../../AllCategories_page/bloc/all_categories_event.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  final formKey = GlobalKey<FormState>();
   final _bloc = sl<AuthBloc>();
   bool checkBoxValue = false;

   TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
  String phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffE8E8E8),
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title:      Text(
          AppLocalizations.of(context)
              .translate("Create Your Account"),
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:
      BlocConsumer<AuthBloc, AuthState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state.successSignup) {
              Navigator.of(context).push(PageTransition(
                  duration: Duration(milliseconds: 700),
                  type: PageTransitionType.fade,
                  child: VerificationCodePage( 'signup',state.user.phoneNumber??number.phoneNumber.toString(),state.user.email??_emailController.text)));
              _passwordController.clear();
              _lastNameController.clear();
              _firstNameController.clear();
              _emailController.clear();
              phoneNumber='';
              _passwordConfirmController.clear();

            }
          },
          builder: (BuildContext context, AuthState state) {
      showToast(state.error);
      // if (state.error?.isNotEmpty ?? false) _bloc.add(ClearError());
       return  SingleChildScrollView(
         child:
        Form(
          key: formKey,
          child:Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: primaryColor,
              //     borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(20),
              //       bottomRight: Radius.circular(20),
              //     ),
              //   ),
              //   child: Column(
              //     children: [
              //       Text(
              //         "Create Your \n Account",
              //         style: TextStyle(
              //           fontSize: 40,
              //
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white,
              //         ),
              //         textAlign: TextAlign.end,
              //       ),
              //       SizedBox(
              //         height: 30,
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 50,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 40),

                child:  Column(
                  children: [

                    CustomTextField(
                      borderColor: Colors.transparent,

                      contentHorizontalPadding: 16,
                      borderRadius:30,
                      hintText:AppLocalizations.of(context).translate("First Name"), controller: _firstNameController,),
                    SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      borderColor: Colors.transparent,

                      contentHorizontalPadding: 16,
                      borderRadius:30,
                      hintText:AppLocalizations.of(context).translate("Last Name"), controller: _lastNameController,),
                    SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      textInputType: TextInputType.emailAddress,
                      borderColor: Colors.transparent,
                      contentHorizontalPadding: 16,
                      borderRadius:30,
                      hintText:AppLocalizations.of(context).translate("Email") , controller: _emailController,),
                    SizedBox(
                      height: 25,
                    ),
                   Stack(
                     children: [
                       Padding(
                         padding:
                         EdgeInsets.only(right: 0, left: 0),
                         child: Container(
                           height: 50,
                           width: double.infinity,
                           decoration: BoxDecoration(
                               color: Colors.white,
                               border: Border.all(
                                   color: Colors.transparent,
                                   width: 1),
                               borderRadius:
                               BorderRadius.circular(50)),
                           margin: EdgeInsets.symmetric(
                               horizontal: 6, vertical: 0),
                           child: Padding(
                             padding:
                             EdgeInsets.only(left: 20.0),

                           ),
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(left: 20.0,right: 10,top: 5),
                         child: InternationalPhoneNumberInput(
                         selectorConfig: SelectorConfig(
                           selectorType:
                           PhoneInputSelectorType
                               .DIALOG,
                         ),
                           errorMessage:AppLocalizations.of(context).translate("InvalidMess") ,
                         countries: [
                           'AF',
                           'AL',
                           'DZ',
                           'AS',
                           'AD',
                           'AO',
                           'AI',
                           'AQ',
                           'AG',
                           'AR',
                           'AM',
                           'AW',
                           'AU',
                           'AT',
                           'AZ',
                           'BS',
                           'BH',
                           'BD',
                           'BB',
                           'BY',
                           'BE',
                           'BZ',
                           'BJ',
                           'BM',
                           'BT',
                           'BO',
                           'BQ',
                           'BA',
                           'BW',
                           'BV',
                           'BR',
                           'IO',
                           'BN',
                           'BG',
                           'BF',
                           'BI',
                           'KH',
                           'CM',
                           'CA',
                           'CV',
                           'KY',
                           'CF',
                           'TD',
                           'CL',
                           'CN',
                           'CX',
                           'CC',
                           'CO',
                           'KM',
                           'CG',
                           'CD',
                           'CK',
                           'CR',
                           'HR',
                           'CU',
                           'CW',
                           'CY',
                           'CZ',
                           'DK',
                           'DJ',
                           'DM',
                           'DO',
                           'EC',
                           'EG',
                           'SV',
                           'GQ',
                           'ER',
                           'EE',
                           'SZ',
                           'ET',
                           'FK',
                           'FO',
                           'FJ',
                           'FI',
                           'FR',
                           'GF',
                           'PF',
                           'TF',
                           'GA',
                           'GM',
                           'GE',
                           'DE',
                           'GH',
                           'GI',
                           'GR',
                           'GL',
                           'GD',
                           'GP',
                           'GU',
                           'GT',
                           'GG',
                           'GN',
                           'GW',
                           'GY',
                           'HT',
                           'HM',
                           'HN',
                           'HK',
                           'HU',
                           'IS',
                           'IN',
                           'ID',
                           'IR',
                           'IQ',
                           'IE',
                           'IM',
                           'IT',
                           'CI',
                           'JM',
                           'JP',
                           'JE',
                           'JO',
                           'KZ',
                           'KE',
                           'KI',
                           'KP',
                           'KR',
                           'KW',
                           'KG',
                           'LA',
                           'LV',
                           'LB',
                           'LS',
                           'LR',
                           'LY',
                           'LI',
                           'LT',
                           'LU',
                           'MO',
                           'MK',
                           'MG',
                           'MW',
                           'MY',
                           'MV',
                           'ML',
                           'MT',
                           'MH',
                           'MQ',
                           'MR',
                           'MU',
                           'YT',
                           'MX',
                           'FM',
                           'MD',
                           'MC',
                           'MN',
                           'ME',
                           'MS',
                           'MA',
                           'MZ',
                           'MM',
                           'NA',
                           'NR',
                           'NP',
                           'NL',
                           'NC',
                           'NZ',
                           'NI',
                           'NE',
                           'NG',
                           'NU',
                           'NF',
                           'MP',
                           'NO',
                           'OM',
                           'PK',
                           'PW',
                           'PS',
                           'PA',
                           'PG',
                           'PY',
                           'PE',
                           'PH',
                           'PN',
                           'PL',
                           'PT',
                           'PR',
                           'QA',
                           'RE',
                           'RO',
                           'RU',
                           'RW',
                           'BL',
                           'SH',
                           'KN',
                           'LC',
                           'MF',
                           'PM',
                           'VC',
                           'WS',
                           'SM',
                           'ST',
                           'SA',
                           'SN',
                           'RS',
                           'SC',
                           'SL',
                           'SG',
                           'SX',
                           'SK',
                           'SI',
                           'SB',
                           'SO',
                           'ZA',
                           'GS',
                           'SS',
                           'ES',
                           'LK',
                           'SD',
                           'SR',
                           'SJ',
                           'SE',
                           'CH',
                           'SY',
                           'TW',
                           'TJ',
                           'TZ',
                           'TH',
                           'TL',
                           'TG',
                           'TK',
                           'TO',
                           'TT',
                           'TN',
                           'TR',
                           'TM',
                           'TC',
                           'TV',
                           'UG',
                           'UA',
                           'AE',
                           'GB',
                           'US',
                           'UM',
                           'UY',
                           'UZ',
                           'VU',
                           'VA',
                           'VE',
                           'VN',
                           'VG',
                           'VI',
                           'WF',
                           'EH',
                           'YE',
                           'ZM',
                           'ZW'
                         ],
                         onInputChanged: (PhoneNumber number) {
                           this.number = number;
                           phoneNumber = number.phoneNumber.toString();
                         },
                         maxLength: 15,
                         onInputValidated: (bool value) {
                           print(value);
                         },
                         spaceBetweenSelectorAndTextField: 5,
                         inputDecoration:
                         InputDecoration(
                           focusedBorder:
                           UnderlineInputBorder(
                               borderSide: BorderSide(
                                   width: 2.0,
                                   color: Colors
                                       .red)),
                           border: InputBorder.none,
                           enabledBorder:
                           InputBorder.none,
                           // errorBorder: InputBorder.none,
                           disabledBorder:
                           InputBorder.none,
                           hintStyle: TextStyle(
                               color: Colors.grey[600],
                               fontSize: 15),
                           hintText: AppLocalizations.of(
                               context)
                               .translate(
                             "Phone Number",
                           ),
                         ),
                         ignoreBlank: false,
                         textStyle: TextStyle(
                           color: Colors.grey[600],
                         ),
                         autoValidateMode:
                         AutovalidateMode.onUserInteraction,
                         selectorTextStyle: TextStyle(
                           color: Colors.grey[600],
                         ),
                         // initialValue: number,
                         textFieldController:
                         TextEditingController(),
                       ),
                       )
                     ],
                   ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      borderColor: Colors.transparent,
                      isPassword:  true,
                      contentHorizontalPadding: 16,
                      borderRadius:30,
                      hintText:AppLocalizations.of(context)
                          .translate("Password")
                      , controller: _passwordController,),
                    SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      borderColor: Colors.transparent,
                      isPassword:  true,
                      contentHorizontalPadding: 16,
                      borderRadius:30,
                      validationFunc:(value){
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context).translate("this_field_required");
                        }
                        // if (RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        //   return 'This field cannot contain numbers or special characters';
                        // }
                        if(_passwordController.text != _passwordConfirmController.text ){
                          return 'The passwords do not match';
                        }
                        return null;
                      },
                      hintText:AppLocalizations.of(context)
                          .translate("Confirm Password"), controller: _passwordConfirmController,),
                    SizedBox(
                      height: 10,
                    ),
                    Directionality(
                        textDirection: TextDirection.ltr,
                        child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: sizeAware.width *0,
                                top: 2),
                            child: StatefulBuilder(
                              builder: (context, setState) =>
                                  CheckboxListTile(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide.none),
                                    title: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .translate(
                                            "Agree to the terms and conditions"),
                                      ),
                                    ),
                                    visualDensity:
                                    VisualDensity.comfortable,
                                    activeColor: primaryColor,
                                    value: checkBoxValue,
                                    onChanged: (isChecked) {
                                      print(isChecked);
                                      setState(() {
                                        checkBoxValue = isChecked!;
                                      });
                                    },
                                  ),
                            ))),
                           Padding(
                                                  padding: EdgeInsetsDirectional.only(
                                                      start: sizeAware.width * 0.04, top: 0),
                                                  child: Row(
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {
                                                            launchURL(
                                                                'https://sites.google.com/view/taknikatprivacypolicy/main_page');
                                                          },
                                                          child: Text('سياسة الخصوصية')),
                                                      TextButton(
                                                          onPressed: () {
                                                            launchURL(
                                                                'https://sites.google.com/view/taknikatusoeofterms/main_page');
                                                          },
                                                          child: Text('الشروط والأحكام')),
                                                    ],
                                                  ),
                                                ),
                    SizedBox(
                      height: 35,
                    ),
                    state.isLoading
                        ? Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 0.0,
                            top: sizeAware.height * 0.04),
                        child: loader())
                        :
                    InkWell(
                      onTap: () {
                        print(phoneNumber);
                        if (formKey.currentState!.validate()) {
                            if(phoneNumber.isNotEmpty){
                              if(checkBoxValue==true){
                                _bloc.add(SignUp((b) => b
                                  ..email = _emailController.text
                                  ..phoneNumber = phoneNumber.isNotEmpty?phoneNumber:number.phoneNumber.toString()
                                  ..password =
                                      _passwordController
                                          .text
                                  ..first_name =
                                      _firstNameController.text
                                  ..last_name =
                                      _lastNameController.text
                                ));
                              }else{
                                showToast(AppLocalizations.of(context).translate("Plz agree terms and conditions"));
                              }
                            }else{

                            }

                        }
                      },
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8)+EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text( AppLocalizations.of(context)
                                .translate("sign up"),style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            ),)
                      ),
                    )

                  ],
                ),
              )
            ],
          ),
        )
       );

    })

    );

  }
}
