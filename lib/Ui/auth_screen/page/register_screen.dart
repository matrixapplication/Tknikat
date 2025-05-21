import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/auth_screen/page/verification_code_page.dart';
import 'package:taknikat/core/widgets/custom_button.dart';

import '../../../core/app_localizations.dart';
import '../../../core/base_widget/base_toast.dart';
import '../../../core/custom_text_field.dart';
import '../../../core/widgets/inputs/custom_text_field_phone_code.dart';
import '../../../injectoin.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _bloc = sl<AuthBloc>();

  bool checkBoxValue = false;
  String? dialCodeText = '966';

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: _bloc,
      listener: (context, state) {
        print('statestate statestate statestate : ${state.toString()}');
        if(state.error!=null){
          showToast(state.error);
          if (state.error?.isNotEmpty ?? false) _bloc.add(ClearError());

        }

        if (state.successSignup) {
          Navigator.of(context).push(PageTransition(
            duration: Duration(milliseconds: 700),
            type: PageTransitionType.fade,
            child: VerificationCodePage(
              'signup',
              state.user.phoneNumber ?? _phoneController.text,
              state.user.email ?? _emailController.text,
            ),
          ));
          _clearFields();
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildTextField(_firstNameController, "First Name"),
              _buildTextField(_lastNameController, "Last Name"),
              _buildTextField(_emailController, "Email", keyboardType: TextInputType.emailAddress),
              _buildPhoneInputField(),
              _buildTextField(_passwordController, "Password",keyboardType:  TextInputType.text, isPassword: true),
              _buildTextField(_passwordConfirmController, "Confirm Password",keyboardType: TextInputType.text, isPassword: true,validationFunc: (value){
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context).translate("this_field_required");
                }

                if(_passwordController.text != _passwordConfirmController.text ){
                  return 'The passwords do not match';
                }
                return null;
              }),
               _buildCheckbox(),
              _buildSignUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, {TextInputType keyboardType = TextInputType.text, bool? isPassword = false,String? Function(String?)? validationFunc}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: CustomTextField(
        controller: controller,
        contentHorizontalPadding: 16,
        borderRadius:12,
        fillColor: Color(0xffF7F7F8),
        borderColor: Colors.transparent,
        hintText: AppLocalizations.of(context).translate(hintText),
        isPassword: isPassword,
        textInputType: keyboardType,
        validationFunc: validationFunc
      ),
    );
  }

  Widget _buildPhoneInputField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: CustomTextFieldPhoneCode(
        controller: _phoneController,
        hint: AppLocalizations.of(context).translate("Phone Number"),
        onCountryChanged: (country) {
          setState(() {
            dialCodeText = country.dialCode;
          });
        },
      ),
    );
  }

  Widget _buildCheckbox() {
    return
      StatefulBuilder(builder: (context, setState) {
        return CheckboxListTile(
          title: Text(AppLocalizations.of(context).translate("Agree to the terms and conditions")),
          value: checkBoxValue,
          onChanged: (bool? value) {
            setState(() {
              checkBoxValue = value ?? false;
            });
          },
        );
      });
  }

  Widget _buildSignUpButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: _bloc,
      builder: (context, state) {

        return CustomButton(
          loading: state.isLoading,
          title: AppLocalizations.of(context).translate("sign up"),
          onTap: () {
            if (_formKey.currentState!.validate()) {
              if (checkBoxValue) {
                _bloc.add(SignUp((b) => b
                  ..email = _emailController.text
                  ..phoneNumber = '+$dialCodeText${_phoneController.text}'
                  ..password = _passwordController.text
                  ..first_name = _firstNameController.text
                  ..last_name = _lastNameController.text
                ));
              } else {
                showToast(AppLocalizations.of(context).translate("Plz agree terms and conditions"));
              }
            }
          },
        );
      },
    );
  }

  void _clearFields() {
    _passwordController.clear();
    _passwordConfirmController.clear();
    _emailController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _phoneController.clear();
  }
}
