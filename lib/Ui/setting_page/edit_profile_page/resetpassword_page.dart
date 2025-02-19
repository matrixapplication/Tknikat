import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taknikat/Ui/auth_screen/widget/text_card.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/appBar.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/core/widgets/custom_button.dart';
import 'package:taknikat/core/widgets/inputs/custom_text_field_password.dart';
import 'package:taknikat/injectoin.dart';

import '../../../core/assets_image/app_images.dart';
import '../../../core/custom_text_field.dart';
import '../../auth_screen/page/otp/widgets/auth_header_widget.dart';
import 'bloc/edit_profile_bloc.dart';
import 'bloc/edit_profile_event.dart';
import 'bloc/edit_profile_state.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isSwitched = true;
  bool stateAnimation = false;
  bool stateAnimationLanguage = false;
  String? dropdownLanguage, dropdownMony;
  var _passwordnewController = TextEditingController();
  var _passwordController = TextEditingController();
  var _passwordconfirmController = TextEditingController();
  late EditProfileBloc _bloc ;

  @override
  void initState() {
    _bloc = sl<EditProfileBloc>();
    super.initState();
  }
  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc,EditProfileState>(
        bloc: _bloc,
        builder: (BuildContext context, EditProfileState state) {
          showToast(state.error);
          if (state.success && Navigator.canPop(context))
            Future.delayed(Duration.zero, () => Navigator.pop(context));
          if (state.error?.isNotEmpty ?? false) _bloc.add(ClearState());
          return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),

                   SingleChildScrollView(
                    child:  Column(
                      children: [
                        40.height,
                        AuthHeaderWidget(
                          title: AppLocalizations.of(context).translate("Change Password"),
                        ),
                        40.height,

                        Form(
                          key: _formKey,
                            child: Container(
                              margin: 16.paddingHorizontal,
                          child: Column(
                            children: [
                              CustomTextField(

                                  fillColor: Color(0xffF7F7F8).withOpacity(0.8),
                                  borderColor: Colors.grey,
                                  isPassword:  true,
                                  contentHorizontalPadding: 16,
                                  borderRadius:8,
                                  hasShadow: false,
                                  prefixIcon: Icon(Icons.lock),
                                  hintText:AppLocalizations.of(context).translate("Old Password"),
                                  title: AppLocalizations.of(context).translate("Old Password"),
                                  controller: _passwordController),
                              20.height,
                              CustomTextField(

                                  fillColor: Color(0xffF7F7F8).withOpacity(0.8),
                                  borderColor: Colors.grey,
                                  isPassword:  true,
                                  contentHorizontalPadding: 16,
                                  borderRadius:8,
                                  hasShadow: false,
                                  prefixIcon: Icon(Icons.lock),
                                  hintText:AppLocalizations.of(context).translate("New Password"),
                                  title: AppLocalizations.of(context).translate("New Password"),
                                  controller: _passwordnewController),
                              10.height,
                              CustomTextField(
                                  fillColor: Color(0xffF7F7F8).withOpacity(0.8),
                                  borderColor: Colors.grey,
                                  isPassword:  true,
                                  contentHorizontalPadding: 16,
                                  borderRadius:8,
                                  hasShadow: false,
                                  validationFunc: (value){
                                    if (value == null || value.isEmpty) {
                                      return AppLocalizations.of(context).translate("this_field_required");
                                    }
                                    if(_passwordnewController.text != _passwordconfirmController.text ){
                                      return 'The passwords do not match';
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icon(Icons.lock),
                                  hintText:AppLocalizations.of(context).translate("Confirm Password"),
                                  title: AppLocalizations.of(context).translate("Confirm Password"),
                                  controller: _passwordconfirmController),
                              40.height,
                              CustomButton(
                                loading: state.isLoading,
                                title: AppLocalizations.of(context).translate('Save Changes'),
                                onTap: (){
                                  if (_formKey.currentState!.validate() ){
                                    _bloc.add(ResetPassword((b) => b
                                      ..old_password = _passwordController.text
                                      ..password = _passwordnewController.text
                                      ..password_confirmation = _passwordconfirmController.text));
                                  }

                              },)
                            ],
                          ),


                        )),

                        SizedBox(
                          height: sizeAware.height * 0.02,
                        )
                      ],
                    )
                  ),


                ],
              ));
        });
  }
}
