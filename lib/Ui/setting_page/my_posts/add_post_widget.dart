import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/create_post_bloc/create_post_bloc.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/image.dart';
import 'package:taknikat/injectoin.dart';

import '../../../core/widgets/images/attach_image_list.dart';
import '../../../core/widgets/texts/black_texts.dart';

class AddPostWidget extends StatefulWidget {
  final int postIndex;

  AddPostWidget({Key? key, required this.postIndex}) : super(key: key);

  @override
  State<AddPostWidget> createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget>
    with AutomaticKeepAliveClientMixin<AddPostWidget> {
  // List<File?> _images = List.filled(5, null, growable: false);
  List<File> _images = [];
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final isParent = widget.postIndex == 0;
    return BlocBuilder<CreatePostBloc, CreatePostState>(
      builder: (context, state) {
        final CreatePostBloc _bloc = context.read<CreatePostBloc>();
        return
         Padding(padding:16.paddingHorizontal,
         child:  Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             if (!isParent)
               Row(
                 children: [
                   TextButton(
                       onPressed: () {

                         context
                             .read<CreatePostBloc>()
                             .add(RemoveSubPost(widget.postIndex));

                       },
                       child: Text(
                         '${AppLocalizations.of(context)
                             .translate("post3")}' + ' ' + widget.postIndex.toString(),
                         style: TextStyle(
                             color: Theme.of(context).primaryColor,
                             fontSize: 16,
                             fontFamily: 'Tajawal'),
                       ))
                 ],
               ),
             // SizedBox(
             //   height: 10,
             // ),
             // Text(
             //     AppLocalizations.of(context)
             //         .translate("Add_images"),
             //     style: TextStyle(fontSize: 14)),
             // SizedBox(height: 10),
             Padding(
               padding: 0.paddingHorizontal,
               child:  AttachImageListView(
                   title: AppLocalizations.of(context).translate("Add_images"), height: 150.h,
                   selectedImages:_images,
                   onRemoveImage: (value){},
                   onRemoveSelectedImage:  (value){
                     _images.remove(value);
                     _bloc.add(EditSubPost(
                         index: widget.postIndex, images: _images));
                     setState(() {});
                   },
                   onAttachImage:  (value)async{
                     _images.addAll(value);
                     _bloc.add(EditSubPost(
                         index: widget.postIndex, images: _images));
                     setState(() {});
                   }),
             ),
             SizedBox(height: 15),
             BlackRegularText(label: 'what are you thinking?',fontSize: 16,),
             SizedBox(height: 10),
             Container(
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   boxShadow: [
                     BoxShadow(
                         color: Colors.black.withOpacity(0.05),
                         blurRadius: 7,
                         offset: Offset(4,5)
                     )
                   ]
               ),
               child: TextFormField(
                 minLines: 12,
                 maxLines: null,
                 validator: (value) {
                   if (value?.isEmpty ?? false) {
                     return AppLocalizations.of(context)
                         .translate('description required');
                   } else {
                     return null;
                   }
                 },
                 onChanged: (value) {
                   _bloc.add(EditSubPost(index: widget.postIndex, desc: value));
                 },
                 decoration: InputDecoration(
                   fillColor: Colors.white,
                   filled: true,
                   hintStyle: TextStyle(fontSize: 16, color: Color(0xFF898E92)),
                   hintText: ' ${AppLocalizations.of(context)
                       .translate("type")} ${appUser!.firstName} ؟',
                   border: OutlineInputBorder(
                     borderSide: BorderSide.none,
                     borderRadius: BorderRadius.circular(12),
                   ),
                 ),
               ),
             ),
             if (!isParent)
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   TextButton(
                       onPressed: () {
                         context
                             .read<CreatePostBloc>()
                             .add(RemoveSubPost(widget.postIndex));
                       },
                       child: Text(
                         AppLocalizations.of(context)
                             .translate("delete_post"),
                         style: TextStyle(
                             color: Theme.of(context).canvasColor,
                             fontSize: 16,
                             fontFamily: 'Tajawal'),
                       ))
                 ],
               ),
           ],
         ),
         );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  bool get wantKeepAlive => true;
}
