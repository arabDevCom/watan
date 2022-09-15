import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/register_cubit.dart';

class WelcomeChoose extends StatefulWidget {
  const WelcomeChoose({Key? key}) : super(key: key);

  @override
  State<WelcomeChoose> createState() => _WelcomeChooseState();
}

class _WelcomeChooseState extends State<WelcomeChoose> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit,RegisterState>(
      builder: (BuildContext context, state) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  context.read<RegisterCubit>().changeUser(true, true);
                },
                child: SizedBox(
                  width: null,
                  height: 145,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: (context.read<RegisterCubit>().choose1 == true &&
                            context.read<RegisterCubit>().choose2 == true)
                            ? AppColors.primary
                            : AppColors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "User",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "He can buy, rent and offer his unit for sale or rent",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(ImageAssets.userRegisterImage),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              InkWell(
                onTap: () {
                  context.read<RegisterCubit>().changeUser(true, false);
                },
                child: SizedBox(
                  width: null,
                  height: 145,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: (context.read<RegisterCubit>().choose1 == true &&
                            context.read<RegisterCubit>().choose2 == false)
                            ? AppColors.primary
                            : AppColors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Estate Office",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Can sell and rent more than one unit",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(ImageAssets.projectRegisterImage),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              InkWell(
                onTap: () {
                  context.read<RegisterCubit>().changeUser(false, true);
                },
                child: SizedBox(
                  width: null,
                  height: 145,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: (context.read<RegisterCubit>().choose2 == true &&
                            context.read<RegisterCubit>().choose1 == false)
                            ? AppColors.primary
                            : AppColors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Company",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Can sell and rent more than one unit",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(ImageAssets.companyRegisterImage),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
