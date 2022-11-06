import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:flutter/material.dart';

import '../../data/models/package_data_model.dart';
import '../../domain/entities/package_domain_model.dart';

class PackageItemWidget extends StatefulWidget {
  const PackageItemWidget({Key? key, required this.package}) : super(key: key);
  final PackageDatumModel package;

  @override
  State<PackageItemWidget> createState() => _PackageItemWidgetState();
}

class _PackageItemWidgetState extends State<PackageItemWidget> {
  @override
  void initState() {
    super.initState();
  }

  PackageDatumModel? onePackage;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      elevation: 2,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary, width: 1),
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: IsLanguage.isEnLanguage(context)
                  ? Alignment.topLeft
                  : Alignment.topRight,
              child: Radio<PackageDatumModel>(
                value: widget.package,
                groupValue: onePackage,
                onChanged: (PackageDatumModel? value) {
                  setState(() {
                    onePackage = value;
                    print(value!.value);
                    print(onePackage!.value);
                  });
                },
                activeColor: AppColors.primary,
              ),
            ),
            Text("\$ ${widget.package.value}"),
            Text("${widget.package.numberOfDays} Day")
          ],
        ),
      ),
    );
  }
}
