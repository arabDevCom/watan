import 'package:elwatn/core/widgets/show_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/title_scroll_navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/snackbar_method.dart';
import '../../../../core/widgets/scound_main_item.dart';
import '../../../login/domain/entities/login_domain_model.dart';
import '../cubit/my_ads_cubit.dart';
import 'package:elwatn/core/widgets/error_widget.dart' as error_widget;

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({
    Key? key,
    required this.loginModel,
    required this.kindOfClass,
  }) : super(key: key);

  final LoginModel loginModel;
  final String kindOfClass;

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyAdsCubit>().getStoreUser().then(
          (value) => context.read<MyAdsCubit>().getMyProfileAds(
                value.data!.accessToken!,
                widget.kindOfClass,
              ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          widget.kindOfClass == 'myAds' ? "My Ads" : "My Solid",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        actions: [Image.asset(ImageAssets.logoIcon)],
      ),
      body: BlocBuilder<MyAdsCubit, MyAdsState>(
        builder: (context, state) {
          if (state is MyAdsDeletedSuccessfully) {
            Future.delayed(const Duration(seconds: 2), () {
              snackBar(
                "Delete Successfully",
                context,
                color: AppColors.success,
              );
            });
          }
          if (state is MyAdsChangeStatusSuccessfully) {
            Future.delayed(const Duration(seconds: 2), () {
              snackBar(
                "Moved To your Solid Successfully",
                context,
                color: AppColors.success,
              );
            });
          }
          if (state is MyAdsLoading) {
            return const ShowLoadingIndicator();
          } else if (state is MyAdsError) {
            return error_widget.ErrorWidget(
              onPressed: () => context.read<MyAdsCubit>().getMyProfileAds(
                  widget.loginModel.data!.accessToken!, widget.kindOfClass),
            );
          } else {
            return TitleScrollNavigation(
              showIdentifier: false,
              barStyle: TitleNavigationBarStyle(
                style: const TextStyle(fontWeight: FontWeight.bold),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 6,
                  vertical: 12,
                ),
                spaceBetween: MediaQuery.of(context).size.width / 3,
                activeColor: AppColors.primary,
                background: AppColors.buttonBackground,
              ),
              titles: const [
                "For Sale",
                "For Rent",
              ],
              pages: [
                RefreshIndicator(
                  onRefresh: () async {
                    context.read<MyAdsCubit>().getMyProfileAds(
                        widget.loginModel.data!.accessToken!,
                        widget.kindOfClass);
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                          context.read<MyAdsCubit>().forSaleList.length,
                          (index) => SecondMainItemWidget(
                            mainItemModel:
                                context.read<MyAdsCubit>().forSaleList[index],
                            isMyAdds:
                                widget.kindOfClass == 'myAds' ? true : false,
                          ),
                        ),
                        Container(
                          height: 800,
                        )
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(
                        context.read<MyAdsCubit>().forRentList.length,
                        (index) => SecondMainItemWidget(
                          mainItemModel:
                              context.read<MyAdsCubit>().forRentList[index],
                          isMyAdds:
                              widget.kindOfClass == 'myAds' ? true : false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
