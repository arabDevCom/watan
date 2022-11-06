import 'package:elwatn/config/routes/app_routes.dart';
import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/utils/convert_numbers_method.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../../core/widgets/network_image.dart';
import '../../domain/entities/bloggs_domain_model.dart';
import '../screens/bloggs_details.dart';

class BloggsItem extends StatelessWidget {
  const BloggsItem({Key? key, this.isTitle = true, required this.bloggsDatum})
      : super(key: key);
  final bool isTitle;
  final BloggsDatum bloggsDatum;

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inDays / 30).round();
  }

  @override
  Widget build(BuildContext context) {
    DateTime p = bloggsDatum.createdAt!;

    final apiDate = DateTime(p.year, p.month, p.day);
    final dateNow = DateTime.now();
    final difference = daysBetween(apiDate, dateNow);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BloggsDetailsScreen(
                bloggsDatum: bloggsDatum,
              ),
            ),
          );
        },
        child: SizedBox(
          height: 210,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Expanded(
                  child: ManageNetworkImage(
                      imageUrl: bloggsDatum.image!, borderRadius: 25),
                ),
                isTitle ? const SizedBox(height: 5) : const SizedBox(height: 0),
                isTitle
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              IsLanguage.isEnLanguage(context)
                                  ? bloggsDatum.nameEn!
                                  : (IsLanguage.isArLanguage(context)
                                      ? bloggsDatum.nameAr!
                                      : bloggsDatum.nameKu!),
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              "${IsLanguage.isEnLanguage(context) ? difference.toString() : replaceToArabicNumber(difference.toString())}   ${translateText(AppStrings.monthText, context)}",
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.grayLite),
                            )
                          ],
                        ),
                      )
                    : const SizedBox(height: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
