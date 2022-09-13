import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/network_image.dart';
import '../../domain/entities/categories_domain_model.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key, required this.categoriesDatum})
      : super(key: key);
  final List<CategoriesDatum> categoriesDatum;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            categoriesDatum.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Column(
                children: [
                  categoriesDatum[index].image!.substring(
                              categoriesDatum[index].image!.length - 3) ==
                          "svg"
                      ? SvgPicture.network(
                          categoriesDatum[index].image!,
                          height: 32,
                          width: 32,
                        )
                      : ManageNetworkImage(
                          imageUrl: categoriesDatum[index].image!,
                          height: 38,
                          width: 38,
                        ),
                  Text(
                    categoriesDatum[index].nameEn!,
                    style: const TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
