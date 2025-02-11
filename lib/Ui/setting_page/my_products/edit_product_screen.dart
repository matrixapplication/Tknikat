import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taknikat/Ui/AllCategories_page/bloc/all_categories_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_products/text_widget.dart';
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
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/product_model/product_model.dart';

import '../../../core/assets_image/app_images.dart';
import '../../../core/custom_text_field.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/icon_widget.dart';
import '../../../core/widgets/images/attach_image_list.dart';
import '../../../core/widgets/texts/black_texts.dart';
import 'bloc/my_products_bloc.dart';
import 'bloc/my_products_event.dart';
import 'bloc/my_products_state.dart';

class EditProductScreen extends StatefulWidget {
  final ProductModel product;

  EditProductScreen(this.product);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  var _title = TextEditingController();
  var _description = TextEditingController();
  var _price = TextEditingController();
  bool _titleValidator = false;
  bool _descriptionValidator = false;
  bool _priceValidator = false;
  int? categoryId;
  bool isNew = false;

  final _bloc = sl<MyProductsBloc>();
  File? _image;
  List<File> images = <File>[];

  @override
  void initState() {
    super.initState();
    _bloc.add(ClearState());
    _title.text = widget.product.name ?? '';
    _description.text = widget.product.description ?? '';
    _price.text = widget.product.price.toString();
    categoryId = widget.product.categoryId;
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, MyProductsState state) {
          showToast(state.error);
          if (state.editSuccess) {
            Future.delayed(Duration.zero, () {
              AwesomeDialog(
                  context: context,
                  btnOkText: AppLocalizations.of(context).translate("Ok"),
                  btnOkColor: primaryColor,
                  dialogType: DialogType.success,
                  title:
                      AppLocalizations.of(context).translate("Product action"),
                  desc: AppLocalizations.of(context)
                      .translate("Product updated successfully"),
                  btnOkOnPress: () {},
                  onDismissCallback: (type) {
                    Navigator.pop(context);
                    _bloc.add(ClearState());
                  })
                ..show();
            });
          }
          if (state.error?.isNotEmpty ?? false) _bloc.add(ClearState());

          return Scaffold(
            resizeToAvoidBottomInset: false, // this avoids the overflow error

            // appBar: AppBar(
            //   elevation: 0,
            //   backgroundColor: primaryColor,
            //   title: baseText(
            //       AppLocalizations.of(context).translate("Edit Product"),
            //       color: Colors.white),
            // ),
            body:   Stack(
              children: [
                SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
                                BlackMediumText(label:  AppLocalizations.of(context).translate("Edit Product"),),
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
                                setState(() {
                                  _image = File(pickedFile.path);
                                });
                              }
                            } catch (e) {}
                          },
                          child: Container(
                            height: sizeAware.height * 0.338095238095238,
                            width: sizeAware.width,

                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xffF2F9FD),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: _image != null
                                  ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(_image!))),
                              )
                                  : widget.product.featuredImage
                                  ?.trim()
                                  .isEmpty ??
                                  true
                                  ?  Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppImages.addImage5),
                                  8.height,
                                  BlackRegularText(label: 'Add Image',fontWeight: FontWeight.w300,fontSize: 13,)
                                ],
                              )
                                  : Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            getImagePath(widget
                                                .product
                                                .featuredImage!)))),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: 10.paddingVert+0.paddingHorizontal,
                          child:  AttachImageListView(
                              title: AppLocalizations.of(context).translate("Add_images"), height: 150.h,
                              selectedImages:images,
                              onRemoveImage: (value){},
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
                                  title: AppLocalizations.of(context).translate("Product name"),
                                  hintText: AppLocalizations.of(context).translate("Product name"),
                                  controller: _title),
                              16.height,
                              CustomTextField(
                                  fillColor: Color(0xffF7F7F8),
                                  borderColor: Colors.transparent,
                                  title: AppLocalizations.of(context).translate("Product Description"),
                                  hintText: AppLocalizations.of(context).translate("Product Description"),
                                  controller: _description),
                              16.height,
                              CustomTextField(
                                  textInputType:TextInputType.number ,
                                  fillColor: Color(0xffF7F7F8),
                                  borderColor: Colors.transparent,
                                  title: AppLocalizations.of(context).translate("Product price"),
                                  hintText: AppLocalizations.of(context).translate("Product price"),
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
                                  color: Color(0xffF7F7F8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButton<int>(
                                  value: categoryId,
                                  items: sl<AllCategoriesBloc>()
                                      .state
                                      .productsCategories
                                      .isEmpty
                                      ? []
                                      : sl<AllCategoriesBloc>()
                                      .state
                                      .productsCategories
                                      .map(
                                        (e) => DropdownMenuItem<int>(
                                      value: e.id,
                                      child: Padding(
                                        padding:
                                        const EdgeInsetsDirectional
                                            .only(start: 8.0),
                                        child: Text(
                                          e.name??'',
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
                                      categoryId = selected!;
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
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isNew = !isNew;
                              });
                            },
                            child: Row(children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color:
                                  isNew ? primaryColor : Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: 1.0,
                                      color: isNew
                                          ? Colors.white
                                          : primaryColor),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                      AppLocalizations.of(context)
                                          .translate("New Product"),
                                      style: TextStyle())),
                            ]),
                          ),
                        ),

                        SizedBox(height: 40),
                        CustomButton(
                          onTap: (){

                            if (_formKey.currentState!.validate() ){
                              _bloc.add(EditProduct((b) {
                                b
                                  ..id = widget.product.id
                                  ..title = _title.text
                                  ..description = _description.text
                                  ..price = _price.text
                                  ..categoryId = categoryId
                                  ..status = isNew ? 1 : 0;
                                if (_image != null) b..image = _image;
                                if (images != null) b..images = images;
                              }));
                            }

                          },
                          title:AppLocalizations.of(context).translate("Publish the product"),
                        ),

                        SizedBox(height: 40),

                      ],
                    ),
                  ),
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
