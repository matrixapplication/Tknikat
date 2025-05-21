import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taknikat/Ui/AllCategories_page/bloc/all_categories_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_services/bloc/my_services_state.dart';
import 'package:taknikat/Ui/setting_page/my_services/text_widget.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/main_title.dart';
import 'package:taknikat/core/multi_image_picker.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/core/widgets/custom_loading_spinner.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/service_model/service_model.dart';

import '../../../core/assets_image/app_images.dart';
import '../../../core/custom_text_field.dart';
import '../../../core/utils/contact_helper.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/icon_widget.dart';
import '../../../core/widgets/images/attach_image_list.dart';
import '../../../core/widgets/texts/black_texts.dart';
import 'bloc/my_services_bloc.dart';
import 'bloc/my_services_event.dart';
List<String> kDeleteImages = [];

class EditServiceScreen extends StatefulWidget {
  final ServiceModel service;

  EditServiceScreen(this.service);

  @override
  _EditServiceScreenState createState() => _EditServiceScreenState();
}

class _EditServiceScreenState extends State<EditServiceScreen> {
  var _title = TextEditingController();
  var _description = TextEditingController();
  var _price = TextEditingController();
  bool _titleValidator = false;
  bool _descriptionValidator = false;
  bool _priceValidator = false;
  final _bloc = sl<MyServicesBloc>();
  File? _image;
  List<File> images = <File>[];
  int? categoryId;
  List<String> oldImages = [];
  String? oldImageFeatured;
 bool _isLoading = false;
  @override
  void initState() {
    kDeleteImages.clear();
    super.initState();
    _bloc.add(ClearState());
    _title.text = widget.service.name ?? '';
    _description.text = widget.service.description ?? '';
    _price.text = widget.service.price.toString();
    categoryId = widget.service.categoryId;
    oldImages = widget.service.images?.map((e) => e).toList() ?? [];
    oldImageFeatured=widget.service.featuredImage;


  }
  // convertImageToFile() async {
  //   _isLoading = true;
  //  try{
  //    setState(() {});
  //    await ContactHelper().getImageFileFromUrl(getImagePath(widget.service.featuredImage.toString())).then((value) {
  //      setState(() {
  //        _image = value;
  //      });
  //    });
  //    await ContactHelper().getImageFilesFromUrls(widget.service.images?.map((e) => getImagePath(e.toString()??'')).toList()??[]).then((value) {
  //      setState(() {
  //        _isLoading = false;
  //        images = value;
  //      });
  //    });
  //  }catch(e){
  //    _isLoading = false;
  //    setState(() {});
  //
  // }finally {
  //    _isLoading = false;
  //
  //    setState(() {});
  //  }
  // }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, MyServicesState state) {
          showToast(state.error);
          if (state.editSuccess) {
            Future.delayed(Duration.zero, () {
              AwesomeDialog(
                  context: context,
                  btnOkText: AppLocalizations.of(context).translate("Ok"),
                  btnOkColor: primaryColor,
                  dialogType: DialogType.success,
                  title:
                      AppLocalizations.of(context).translate("Service action"),
                  desc: AppLocalizations.of(context)
                      .translate("service updated successfully"),
                  btnOkOnPress: () {},
                  onDismissCallback: (type) {
                    Navigator.pop(context);
                    _bloc.add(ClearState());
                  })
                ..show();
            });
          }
          if (state.error?.isNotEmpty ?? false) _bloc.add(ClearState());
          return
            Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [

                SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),

                SingleChildScrollView(
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        40.height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: (appUser?.avatar == null
                                      ? AssetImage("assets/images/profile.png")
                                      : CachedNetworkImageProvider(
                                      getImagePath(appUser?.avatar??'')))
                                  as ImageProvider),
                            ),
                            Expanded(child: Column(
                              children: [
                                30.height,
                                BlackMediumText(label: AppLocalizations.of(context).translate("Edit Service"),),
                              ],
                            ),),
                            IconWidget(
                              width: 40.w,
                              height: 40.h,
                              onTap: (){
                                context.pop();
                              },
                              widget:Padding(
                                padding:8.paddingAll,
                                child:  SvgPicture.asset(AppImages.add5,height: 24,width: 24,),
                              ),
                            ),
                          ],
                        ),
                        20.height,
                        Container(
                          alignment: AlignmentDirectional.topStart,
                          child: MainTitle(
                            AppLocalizations.of(context).translate("Add_images"),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        10.height,
                        GestureDetector(
                          onTap: () async {
                            try {
                              final pickedFile = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                _image = File(pickedFile.path);
                                setState(() {});
                              }
                            } catch (e) {}
                          },
                          child:
                          Container(
                            height: sizeAware.height * 0.338095238095238,
                            width: sizeAware.width,
                            margin: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                                margin: EdgeInsets.all(0),
                                child: _image != null
                                    ? Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: FileImage(_image!))),
                                )
                                    :
                                widget.service.featuredImage!=null?
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child:  Container(

                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(getImagePath(widget.service.featuredImage.toString()),))),
                                  ),
                                ):
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xffF2F9FD)
                                  ),
                                  padding: 16.paddingAll,
                                  child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AppImages.addImage5),
                                      8.height,
                                      BlackRegularText(label: 'Add Image',fontWeight: FontWeight.w300,fontSize: 13,)
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: 10.paddingVert+0.paddingHorizontal,
                          child:  AttachImageListView(
                              imagesNetwork: oldImages?.map((e) => e).toList()??[],
                              title: AppLocalizations.of(context).translate("Add_images"), height: 150.h,
                              selectedImages:images,
                              onRemoveImage: (value){
                                print('onRemoveImage $value');
                                oldImages.removeWhere((element) => element == value);
                                kDeleteImages.add(value);

                                setState(() {});
                              },
                              onRemoveSelectedImage:  (value){
                                images.remove(value);
                                setState(() {});
                              },
                              onAttachImage:  (value)async{
                                images.addAll(value);
                                setState(() {});
                              }),
                        ),

                        Form(
                          key:_formKey,
                          child:Column(
                            children: [
                              CustomTextField(
                                  fillColor: Color(0xffF7F7F8),
                                  borderColor: Colors.transparent,
                                  title: AppLocalizations.of(context).translate("Service title"),
                                  hintText: AppLocalizations.of(context).translate("Service title"),
                                  controller: _title),
                              16.height,
                              CustomTextField(
                                  fillColor: Color(0xffF7F7F8),
                                  borderColor: Colors.transparent,
                                  title: AppLocalizations.of(context).translate("Service description"),
                                  hintText: AppLocalizations.of(context).translate("Service description"),
                                  controller: _description),
                              16.height,
                              CustomTextField(
                                  textInputType:TextInputType.number ,
                                  fillColor: Color(0xffF7F7F8),
                                  borderColor: Colors.transparent,
                                  title: AppLocalizations.of(context).translate("Service price"),
                                  hintText: AppLocalizations.of(context).translate("Service price"),
                                  controller: _price),
                              16.height,

                            ],
                          ),
                        ),
                        BlackRegularText(label: AppLocalizations.of(context).translate("main section"),fontSize: 16,),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: [
                              _priceValidator
                                  ? Row(
                                children: [
                                  Text(
                                      AppLocalizations.of(context)
                                          .translate(
                                          "main section"),
                                      style: TextStyle()),
                                  Text(
                                    "*",
                                    style: TextStyle(
                                        color: Colors.red),
                                  )
                                ],
                              )
                                  : Container(),
                              Container(
                                alignment: Alignment.center,
                                height: sizeAware.height * 0.056992,
                                decoration: BoxDecoration(
                                  color:  Color(0xffF7F7F8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButton<int>(
                                  value: categoryId,
                                  items: sl<AllCategoriesBloc>()
                                      .state
                                      .servicesCategories
                                      .isEmpty
                                      ? []
                                      : sl<AllCategoriesBloc>()
                                      .state
                                      .servicesCategories
                                      .map(
                                        (e) => DropdownMenuItem<int>(
                                      value: e.id,
                                      child: Padding(
                                        padding:
                                        const EdgeInsetsDirectional
                                            .only(start: 8.0),
                                        child: Text(
                                          e.name!,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                      .toList(),
                                  onChanged: (selected) {
                                    setState(() {
                                      categoryId = selected;
                                    });
                                  },
                                  isExpanded: true,
                                  underline: Container(),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: primaryColor,
                                  ),
                                  hint: Row(
                                    children: [
                                      SizedBox(width: 4),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                            AppLocalizations.of(context)
                                                .translate(
                                                "main section"),
                                            style: TextStyle()),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 40.h),
                        CustomButton(
                          onTap: (){
                            if (_formKey.currentState!.validate() ){
                              _bloc.add(EditService((b) {
                                b
                                  ..id = widget.service.id
                                  ..title = _title.text
                                  ..categoryId = categoryId
                                  ..description = _description.text
                                  ..price = _price.text;
                                if (kDeleteImages.isNotEmpty) b..deleteImages = kDeleteImages;
                                if (_image != null) b..image = _image;
                                if (images != null) b..images = images;
                              }));
                            }
                          },
                          title:AppLocalizations.of(context).translate("Edit Service"),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
                    if(_isLoading==true) Center(
                        child: loader(context: context),
                      ),

                state.isLoading
                    ? Center(
                  child: loader(context: context),
                )
                    : Container()
              ],
            ),
          );
        });
  }
}
