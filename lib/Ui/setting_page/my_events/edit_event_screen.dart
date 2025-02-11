import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/my_events_event.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/my_events_state.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/image.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/event_model/event_model.dart';

import '../../../core/app_localizations.dart';
import '../../../core/assets_image/app_images.dart';
import '../../../core/custom_text_field.dart';
import '../../../core/main_title.dart';
import '../../../core/utils/date/date_converter.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/icon_widget.dart';
import '../../../core/widgets/inputs/custom_text_field_area.dart';
import '../../../core/widgets/inputs/custom_text_field_date.dart';
import '../../../core/widgets/texts/black_texts.dart';
import 'bloc/my_events_bloc.dart';

class EditEventScreen extends StatefulWidget {
  final EventModel eventModel;

  const EditEventScreen({Key? key, required this.eventModel}) : super(key: key);

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  ///To hold server and local picked image both
  String? image;
  DateTime? endDate;
  DateTime? startDate;

  final _rulesController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _startDate = TextEditingController();
  TextEditingController _numberOfInputController = TextEditingController();
  TextEditingController _endDate = TextEditingController();
  @override
  void initState() {
    ///init description and images
    _rulesController.text = widget.eventModel.description!;
    _nameController.text = widget.eventModel.name!;
    startDate = DateTime.parse(widget.eventModel.startDate!);
    endDate = DateTime.parse(widget.eventModel.endDate!);
    _numberOfInputController.text=widget.eventModel.activationsCount?.toString()??'0';
    if(endDate!=null)
    _endDate.text =DateConverter.slotDate(endDate!);
    if(startDate!=null)
      _startDate.text =DateConverter.slotDate(startDate!);
    if (widget.eventModel.image != null)
      image = getImagePath(widget.eventModel.image!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<MyEventsBloc>(),
      child: BlocConsumer<MyEventsBloc, MyEventsState>(
        listener: (context, state) {
          if (state.editSuccess) {
            Navigator.pop(context);
            showToast('تمت العملية بنجاح');
          }
          if (state.error?.isNotEmpty ?? false) {
            showToast(state.error.toString());
          }
        },
        builder: (context, state) {
          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: primaryColor,
            //   title: baseText('تعديل فعالية', color: Colors.white),
            //   elevation: 0,
            //   centerTitle: true,
            //   leading: BackButton(color: Colors.white),
            // ),
            body:    Stack(
              children: [
                SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
                Container(
                  padding: 16.paddingHorizontal,
                  child: Column(
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
                              BlackMediumText(label: AppLocalizations.of(context).translate("Add_event"),),
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
                      Expanded(child:
                       ListView(
                        children: [
                          SizedBox(height: 15),
                          Container(
                            alignment: AlignmentDirectional.topStart,
                            child: MainTitle(
                              AppLocalizations.of(context).translate("Add_image"),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          10.height,
                          InkWell(
                            onTap: () async {
                              try {
                                image = (await pickImage())?.path;

                                setState(() {});
                              } catch (e) {}
                            },
                            child: Stack(
                              children: [
                                Container(
                                    height: 175,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(15, 52, 157, 216),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        if (image == null) {
                                          return _pickImageWidget();
                                        }

                                        if (image!.startsWith('http')) {
                                          return _networkImageWidget(image!);
                                        }
                                        return Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: FileImage(
                                                File(image!),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )),
                                if (image != null)
                                  Positioned.directional(
                                    end: 10,
                                    textDirection: Directionality.of(context),
                                    top: 10,
                                    child: IconButton(
                                        onPressed: () {
                                          image = null;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: primaryColor,
                                        )),
                                  )
                              ],
                            ),
                          ),
                          Form(
                            key:_formKey,
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                    fillColor: Color(0xffF7F7F8),
                                    borderColor: Colors.transparent,
                                    title: AppLocalizations.of(context).translate("event_name"),
                                    hintText: AppLocalizations.of(context).translate("event_name"),
                                    controller: _nameController),
                                16.height,

                                Row(
                                  children: [
                                    Expanded(child: CustomTextFieldDate(
                                        background: Color(0xffF7F7F8),
                                        title: AppLocalizations.of(context).translate("date_start_event"),
                                        borderColor: Colors.transparent,
                                        controller: _startDate),),
                                    10.width,
                                    Expanded(child: CustomTextFieldDate(
                                        borderColor: Colors.transparent,
                                        background: Color(0xffF7F7F8),
                                        title: AppLocalizations.of(context).translate("date_end_event"),
                                        controller: _endDate),),
                                  ],
                                ),
                                16.height,
                                CustomTextField(
                                    enabled: false,
                                    textInputType:TextInputType.number ,
                                    fillColor: Color(0xffF7F7F8),
                                    borderColor: Colors.transparent,
                                    validationFunc: (value){
                                      if (value?.isEmpty ?? false) {
                                        return AppLocalizations.of(context)
                                            .translate("number_set_req");
                                      } else {
                                        return null;
                                      }
                                    },
                                    title: AppLocalizations.of(context).translate("number_set"),
                                    hintText: AppLocalizations.of(context).translate("number_set"),
                                    controller: _numberOfInputController),
                                16.height,
                                BlackRegularText(label:  AppLocalizations.of(context).translate("terms_conditions"),fontSize: 16,),
                                8.height,
                                CustomTextFieldArea(
                                  background: Color(0xffF7F7F8),
                                  borderColor: Colors.transparent,
                                  controller: _rulesController,
                                  hint:  AppLocalizations.of(context)
                                      .translate("terms_conditions"),
                                )
                              ],
                            ),
                          ),

                          30.height,
                          CustomButton(
                              title: 'تعديل الفعالية',
                              onTap: (){
                                if (_formKey.currentState!.validate()){
                                  if (image == null) {

                                    showToast(
                                      AppLocalizations.of(context)
                                          .translate("image_req"),
                                    );
                                    return;
                                  }
                                  context.read<MyEventsBloc>().add(EditEvent(
                                        (b) => b
                                      ..param = EditEventParam(
                                        id: widget.eventModel.id,
                                        desc: _rulesController.text,
                                        startDate: startDate!,
                                        endDate: endDate!,
                                        image: File(image!),
                                        name: _nameController.text,
                                      ),
                                  ));
                                }
                              }),
                          30.height,

                        ],
                      ),),
                      if (state.isLoading)
                        Center(
                          child: loader(context: context),
                        )
                    ],
                  ),
                )

              ],
            ),
          );
        },
      ),
    );
  }

  _pickImageWidget() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/addButton.svg"),
          SizedBox(height: 15),
          Text(
            'اضافة صورة',
            style: TextStyle(fontSize: 12, color: primaryColor),
          ),
        ],
      );

  _networkImageWidget(String image) => CachedNetworkImage(
        placeholderFadeInDuration: Duration(seconds: 1),
        errorWidget: (context, url, error) => Container(
          alignment: Alignment.center,
          color: othercolor,
          child: FittedBox(
            child: Icon(Icons.error),
          ),
        ),
        placeholder: (_, __) => ImagePlaceholder.rectangular(),
        imageUrl: image,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundImage: imageProvider,
          radius: 28,
        ),
      );
}
