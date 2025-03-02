import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/vendor_page/bloc/vendor_state.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/share_card.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/style/custom_loader.dart';

import '../../../core/assets_image/app_images.dart';
import '../../../injectoin.dart';
import '../../auth_screen/page/otp/widgets/auth_header_widget.dart';
import '../bloc/vendor_bloc.dart';

class VendorSharesTab extends StatelessWidget {
  VendorBloc bloc;

  VendorSharesTab(this.bloc);

  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      //   title: baseText(getLangLocalization('Shares'), color: Colors.white),
      //   elevation: 0,
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          // ClipPath(
          //   clipper: CustomClipPath(),
          //   child: Container(
          //     color: primaryColor,
          //     height: 30,
          //   ),
          // ),
          Expanded(
            child: BlocBuilder(
                bloc: bloc,
                builder: (BuildContext context, VendorState state) {
                  return Stack(
                    children: [
                      SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),

                      Container(
                        height: sizeAware.height,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 45.h,
                            ),
                            AuthHeaderWidget(title:
                            getLangLocalization('Shares'),hasLogo: false,),
                            20.height,
                            state.shares != null && state.shares.isNotEmpty
                                ? Expanded(
                                    child: GridView.builder(
                                      itemCount: state.shares.length,
                                      padding: EdgeInsets.all(22),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.8,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 12,
                                      ),
                                      itemBuilder: (context, index) {
                                        final item = state.shares[index];
                                        return ShareItem(item);
                                      },
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      state.isLoading
                          ? Center(child: loader(context: context))
                          : state.shares != null && state.shares.isEmpty
                              ? Container(
                                  width: sizeAware.width,
                                  height: sizeAware.height * 0.8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: SvgPicture.asset(
                                          "assets/images/empty_content.svg",
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: Text(
                                          getLangLocalization('no shares'),
                                          style: TextStyle(),
                                        ),
                                      )
                                    ],
                                  ))
                              : Container()
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
