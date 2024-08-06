import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taknikat/Ui/setting_page/get_countries_user/get_country_users_cubit.dart';
import 'package:taknikat/Ui/setting_page/get_countries_user/widget/get_country_widget.dart';
import '../../../core/base_widget/constent.dart';
import '../../../core/constent.dart';
import '../../../core/show_profile.dart';
import '../../../injectoin.dart';

class GetCountriesUserScreen extends StatelessWidget {
  final String type;
  final String id;
  GetCountriesUserScreen({required this.id, required this.type});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                // _scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),),
          title: Container(
            margin: EdgeInsets.all(13),
            width: sizeAware.width * 0.282051282051282,
            child: SvgPicture.asset(
              "assets/images/logo-white.svg",
              color: Colors.white,
              height: sizeAware.height * 0.050090047393365,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: primaryColor,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size(sizeAware.width, 20),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Container(
                      color:
                      // ? Colors.transparent
                      Colors.white,
                    )),
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    color: primaryColor,
                    child: Column(
                      children: [
                        Container(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocProvider(
          create: (context) => GetCountryUsersCubit(sl())..getCountryUser(id,type),
          child: BlocConsumer<GetCountryUsersCubit, GetCountryUsersState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit =context.read<GetCountryUsersCubit>();
              if (cubit.userCountryModel!=null) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: GridView.builder(
                      padding:EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 2.0,
                        mainAxisExtent: 300,
                      ),
                      itemCount: state.userCountryModel!.userCountryModelData!
                          .length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:  EdgeInsets.only(top: 8.0),
                          child: InkWell(
                            onTap: ()async{
                              await showProfile(
                                  state.userCountryModel!.userCountryModelData![index].id, context);
                            },
                            child: CustomUserCountry(
                              userModel: state.userCountryModel!.userCountryModelData![index],),
                          ),
                        );
                      }),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
