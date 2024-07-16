import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/setting_page/get_countries_user/get_country_users_cubit.dart';
import 'package:taknikat/Ui/setting_page/get_countries_user/widget/get_country_widget.dart';
import '../../../core/show_profile.dart';
import '../../../injectoin.dart';

class GetCountriesUserScreen extends StatelessWidget {
  final String type;
  final String id;
  GetCountriesUserScreen({required this.id, required this.type});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
          create: (context) => GetCountryUsersCubit(sl())..getCountryUser(id,type),
          child: BlocConsumer<GetCountryUsersCubit, GetCountryUsersState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit =context.read<GetCountryUsersCubit>();
              if (cubit.userCountryModel!=null) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 10.0,
                        mainAxisExtent: 300,
                      ),
                      itemCount: state.userCountryModel!.userCountryModelData!
                          .length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: ()async{
                            await showProfile(
                                state.userCountryModel!.userCountryModelData![index].id, context);
                          },
                          child: CustomUserCountry(
                            userModel: state.userCountryModel!.userCountryModelData![index],),
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
