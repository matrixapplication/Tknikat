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
import 'package:taknikat/core/image.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/event_model/event_model.dart';

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

  @override
  void initState() {
    ///init description and images
    _rulesController.text = widget.eventModel.description!;
    _nameController.text = widget.eventModel.name!;
    startDate = DateTime.parse(widget.eventModel.startDate!);
    endDate = DateTime.parse(widget.eventModel.endDate!);

    if (widget.eventModel.image != null)
      image = getImagePath(widget.eventModel.image!);

    super.initState();
  }

  selectStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate!,
      firstDate: DateTime(2000),
      currentDate: startDate!,
      locale: appLanguage == 'ar' ? Locale('ar') : Locale('en'),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != startDate!)
      setState(() {
        startDate = picked;
      });
  }

  selectEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate!,
      firstDate: startDate!,
      currentDate: endDate!,
      locale: appLanguage == 'ar' ? Locale('ar') : Locale('en'),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != endDate!)
      setState(() {
        endDate = picked;
      });
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
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: baseText('تعديل فعالية', color: Colors.white),
              elevation: 0,
              centerTitle: true,
              leading: BackButton(color: Colors.white),
            ),
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 12.0),
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          SizedBox(height: 15),
                          Text('اسم الفعالية', style: TextStyle(fontSize: 14)),
                          SizedBox(height: 10),
                          TextFormField(
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return 'اسم الفعالية مطلوب';
                              } else {
                                return null;
                              }
                            },
                            controller: _nameController,
                            onChanged: (value) {
                              print(_nameController.text);
                            },
                            decoration: InputDecoration(
                              fillColor: Color(0xFFF1F1F1),
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('تاريخ بدا الفعالية',
                                      style: TextStyle(fontSize: 14)),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: selectStartDate,
                                    child: Container(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              20,
                                      padding: EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF1F1F1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                          getDateOnly(startDate.toString())),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('تاريخ انتهاء الفعالية',
                                      style: TextStyle(fontSize: 14)),
                                  SizedBox(height: 10),
                                  InkWell(
                                    onTap: selectEndDate,
                                    child: Container(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              20,
                                      padding: EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF1F1F1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child:
                                          Text(getDateOnly(endDate.toString())),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text('الشروط والضوابط',
                              style: TextStyle(fontSize: 14)),
                          SizedBox(height: 10),
                          TextFormField(
                            minLines: 8,
                            maxLines: null,
                            controller: _rulesController,
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return 'وصف الفعالية مطلوب';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              fillColor: Color(0xFFF1F1F1),
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
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
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate())
                                    return;

                                  if (image == null) {
                                    showToast('الصورة مطلوبة');
                                    return;
                                  }
                                  print(
                                      ' ${widget.eventModel.id}, ${_rulesController.text}, $startDate, $endDate!,$image! ,${_nameController.text},');
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
                                },
                                child: Text('تعديل الفعالية')),
                          ),
                        ],
                      ),
                      if (state.isLoading)
                        Center(
                          child: loader(context: context),
                        )
                    ],
                  ),
                ),
              ),
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
