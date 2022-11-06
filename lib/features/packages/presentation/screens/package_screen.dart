import 'package:elwatn/core/utils/snackbar_method.dart';
import 'package:elwatn/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elwatn/core/widgets/error_widget.dart' as error_widget;
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/show_loading_indicator.dart';
import '../../../login/data/models/login_data_model.dart';
import '../../../profile/presentation/widgets/header_profile.dart';
import '../cubit/package_cubit.dart';
import '../widgets/body_package_widget.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({Key? key, required this.loginDataModel})
      : super(key: key);
  final LoginDataModel loginDataModel;

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {

@override
  void dispose() {
    // context.read<PackageCubit>().disposePage();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Packages",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: BlocConsumer<PackageCubit, PackageState>(
        listener: (context, state){},
        builder: (context, state) {
          if(state is AddPackageLoaded){
            return  WebView(
              initialUrl: state.addPackageModel.data,
              allowsInlineMediaPlayback: true,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (webViewController) {
              },
              onPageFinished: (text) async {
                print("Url");
                print(text);
              },
            );
          }else if (state is PackageLoading) {
            return const ShowLoadingIndicator();
          } else if (state is PackageLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<PackageCubit>().getPackageList();
              },
              child: Column(
                children: [
                  HeaderProfileWidget(
                      loginDataModel: widget.loginDataModel, isPackage: true),
                  Container(
                    width: double.infinity,
                    color: AppColors.primary,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time Left",
                            style: TextStyle(color: AppColors.white),
                          ),
                          Text(
                            widget.loginDataModel.data!.user!.packagesBalance!
                                .toString(),
                            style: TextStyle(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BodyPackageWidget(
                      package: state.package,
                    ),
                  ),
                  CustomButton(
                    text: "Pay",
                    color: AppColors.primary,
                    onClick: () {
                      if (context.read<PackageCubit>().onePackage == null) {
                        snackBar(
                          "Plases Select Your Package",
                          context,
                          color: AppColors.error,
                        );
                      } else {
                        buildAlertDialog(context, context.read<PackageCubit>());
                      }
                    },
                    paddingHorizontal: 50,
                  )
                ],
              ),
            );
          } else {
            return error_widget.ErrorWidget(
              onPressed: () => context.read<PackageCubit>().getPackageList(),
            );
          }
        },
      ),
    );
  }

  buildAlertDialog(context, PackageCubit packageCubit) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Choose Your Payment',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Container(
                  height: 1,
                  color: AppColors.gray,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                InkWell(
                  onTap: () {
                    // packageCubit.addPackage(
                    //   widget.loginDataModel.data!.user!.id!,
                    //   widget.loginDataModel.data!.accessToken!,
                    //   "zain_cash",
                    // );
                    Navigator.pop(context);
                    Future.delayed(Duration(seconds: 1), () {
                      snackBar("Not Done Yet", context,
                          color: AppColors.primary);
                    });
                  },
                  child: Text(
                    'Zain Cash',
                    style: TextStyle(fontSize: 18.0, color: AppColors.black),
                  ),
                ),
                const SizedBox(
                  height: 22.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Future.delayed(Duration(seconds: 1), () {
                      snackBar("Not Done Yet", context,
                          color: AppColors.primary);
                    });
                  },
                  child: Text(
                    'Asia Howalla',
                    style: TextStyle(fontSize: 18.0, color: AppColors.black),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Container(
                  height: 1,
                  color: AppColors.gray,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18.0, color: AppColors.primary),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
