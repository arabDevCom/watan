import 'package:elwatn/features/packages/presentation/widgets/package_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/is_language_methods.dart';
import '../../data/models/package_data_model.dart';
import '../../domain/entities/package_domain_model.dart';
import '../cubit/package_cubit.dart';

class BodyPackageWidget extends StatefulWidget {
  const BodyPackageWidget({Key? key, required this.package}) : super(key: key);
  final Package package;

  @override
  State<BodyPackageWidget> createState() => _BodyPackageWidgetState();
}

class _BodyPackageWidgetState extends State<BodyPackageWidget> {
  int itemChoose = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: widget.package.data!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                itemChoose = index;
                context.read<PackageCubit>().onePackage = widget.package.data![index];
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              elevation: 2,
              child: Container(
                width: 150,
                height: 150,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: itemChoose == index
                          ? AppColors.primary
                          : AppColors.buttonBackground,
                      width: 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: IsLanguage.isEnLanguage(context)
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: Radio<PackageDatumModel>(
                        value: widget.package.data![index],
                        groupValue: context.read<PackageCubit>().onePackage,
                        onChanged: (PackageDatumModel? value) {
                          setState(() {
                            context.read<PackageCubit>().onePackage = value;
                            itemChoose = index;
                          });
                        },
                        activeColor: AppColors.primary,
                      ),
                    ),
                    Text("\$ ${widget.package.data![index].value}"),
                    Text(widget.package.data![index].type)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
