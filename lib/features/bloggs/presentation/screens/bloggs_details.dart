import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/network_image.dart';
import '../../domain/entities/bloggs_domain_model.dart';

class BloggsDetailsScreen extends StatelessWidget {
  const BloggsDetailsScreen({Key? key, required this.bloggsDatum})
      : super(key: key);
  final BloggsDatum bloggsDatum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          IsLanguage.isEnLanguage(context)
              ? bloggsDatum.nameEn!
              : IsLanguage.isArLanguage(context)
                  ? bloggsDatum.nameAr!
                  : bloggsDatum.nameKu!,
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        actions: [Image.asset(ImageAssets.logoIcon)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ManageNetworkImage(
                  imageUrl: bloggsDatum.image!, borderRadius: 25),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: IsLanguage.isEnLanguage(context)?Alignment.centerLeft:Alignment.centerRight,
                  child: Text(
                      IsLanguage.isEnLanguage(context)
                          ? bloggsDatum.nameEn!
                          : IsLanguage.isArLanguage(context)
                          ? bloggsDatum.nameAr!
                          : bloggsDatum.nameKu!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                width: MediaQuery.of(context).size.width,
                child: Text(
                    IsLanguage.isEnLanguage(context)
                        ? bloggsDatum.descriptionEn!
                        : IsLanguage.isArLanguage(context)
                        ? bloggsDatum.descriptionAr!
                        : bloggsDatum.descriptionKu!,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
