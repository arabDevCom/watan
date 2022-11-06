import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';
import '../cubit/add_project_cubit.dart';

class PaymentPlanesWidget extends StatefulWidget {
  const PaymentPlanesWidget({Key? key}) : super(key: key);

  @override
  State<PaymentPlanesWidget> createState() => _PaymentPlanesWidgetState();
}

class _PaymentPlanesWidgetState extends State<PaymentPlanesWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          ListTileAllDetailsWidget(
            image: ImageAssets.priceIcon,
            text: "Payment Planes",
            iconColor: AppColors.primary,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: CustomTextField(
                  image: "null",
                  title: "Plan Title",
                  controller:
                      context.read<AddProjectCubit>().paymentTitleController,
                  textInputType: TextInputType.text,
                  validatorMessage: "Please Inter Plan Title",
                ),
              ),
              Expanded(
                flex: 3,
                child: CustomTextField(
                  image: "null",
                  title: "Percent",
                  textInputType: TextInputType.number,
                  controller:
                      context.read<AddProjectCubit>().paymentPresentController,
                  validatorMessage: "Please Inter The Percent Number",
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                  side: BorderSide(width: 2.0, color: AppColors.primary),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      context.read<AddProjectCubit>().addPaymentPlans();
                    });
                    print("Done");
                  }
                },
                child: Icon(
                  Icons.add,
                  color: AppColors.primary,
                ),
              )
            ],
          ),
          context.read<AddProjectCubit>().paymentPlanPresent.isEmpty
              ? const SizedBox()
              : Column(
                  children: [
                    ...List.generate(
                      context.read<AddProjectCubit>().paymentPlanPresent.length,
                      (index) => Column(
                        children: [
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                  "${context.read<AddProjectCubit>().paymentPlanPresent[index]} %"),
                              const SizedBox(
                                width: 80,
                              ),
                              Text(context
                                  .read<AddProjectCubit>()
                                  .paymentPlanTitle[index]),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    context
                                        .read<AddProjectCubit>()
                                        .removePaymentPlans(index);
                                  });
                                },
                                child: Icon(
                                  Icons.remove_circle,
                                  color: AppColors.error,
                                ),
                              ),
                              const SizedBox(width: 12),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
