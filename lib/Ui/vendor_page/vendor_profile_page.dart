import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/vendor_page/vendor_events/vendor_events_list.dart';
import 'package:taknikat/Ui/vendor_page/vendor_info.dart';
import 'package:taknikat/Ui/vendor_page/vendor_products/vendor_products_list.dart';
import 'package:taknikat/Ui/vendor_page/vendor_projects/vendor_projects_list.dart';
import 'package:taknikat/Ui/vendor_page/vendor_services/vendor_services_list.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/user_model/user_model.dart';

import 'bloc/vendor_bloc.dart';
import 'bloc/vendor_event.dart';
import 'bloc/vendor_state.dart';
import 'vendor_posts/bloc/vendor_posts_bloc.dart';
import 'vendor_posts/bloc/vendor_posts_event.dart';
import 'vendor_posts/vendor_post_list.dart';

class VendorProfilePage extends StatefulWidget {
  UserModel vendor;

  VendorProfilePage(this.vendor);

  @override
  _VendorProfilePageState createState() => _VendorProfilePageState();
}

class _VendorProfilePageState extends State<VendorProfilePage> {
  final _bloc = sl<VendorBloc>();
  final _postsBloc = sl<VendorPostBloc>();

  final ScrollController _listController = ScrollController();

  initState() {
    super.initState();

    _listController.addListener(() {
      if (_listController.position.atEdge) {
        if (_listController.position.pixels ==
            _listController.position.maxScrollExtent) {
          if (_postsBloc.state.initialized) {
            _postsBloc.add(GetNextVendorPosts((b) => b..id = widget.vendor.id));
          }
        }
      }
    });
    _bloc.add(GetVendorData((b) => b..vendor.replace(widget.vendor)));
    _bloc.add(GetVendorEvents((b) => b..id = widget.vendor.id!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, VendorState state) {
          showToast(state.error);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: baseText(
                  widget.vendor.firstName!.trim() +
                      " " +
                      widget.vendor.lastName!.trim(),
                  color: Colors.white),
              elevation: 0,
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    color: primaryColor,
                    height: 30,
                  ),
                ),
                FutureBuilder<bool>(
                  future: _bloc.getBlockingSettings(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data ?? true)
                        return IconButton(
                            padding: EdgeInsets.all(22.0),
                            onPressed: () {
                              AwesomeDialog(
                                context: context,
                                customHeader: Container(
                                  child: Icon(
                                    Icons.block,
                                    size: 60,
                                    color: Colors.red,
                                  ),
                                ),
                                btnCancelText: 'الغاء',
                                btnOkText: 'موافق',
                                btnOkColor: primaryColor,
                                dialogType: DialogType.warning,
                                animType: AnimType.bottomSlide,
                                title: 'حظر المستخدم',
                                desc: ' هل انت متأكد من انك تريد حظر المستخدم؟',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              )..show();
                            },
                            icon: Icon(
                              Icons.block,
                              color: Colors.red,
                            ));
                    }
                    return SizedBox();
                  },
                ),
                Expanded(
                  child: Container(
                    height: sizeAware.height,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      controller: _listController,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                VendorPersonalInfoPage(widget.vendor, _bloc),
                                VendorProductsList(_bloc),
                                VendorServicesList(_bloc),
                                VendorProjectsList(_bloc),
                                VendorEventsList(_bloc),
                                Text(
                                  'المنشورات',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                              ],
                            ),
                          ),
                          VendorPostsList(widget.vendor, _postsBloc),
                          SizedBox(height: 20)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }
}
