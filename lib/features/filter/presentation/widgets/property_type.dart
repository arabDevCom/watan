import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/features/filter/presentation/widgets/property_choose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PropertyTypeWidget extends StatefulWidget {
  const PropertyTypeWidget({Key? key}) : super(key: key);

  @override
  State<PropertyTypeWidget> createState() => _PropertyTypeWidgetState();
}

class _PropertyTypeWidgetState extends State<PropertyTypeWidget> {
  List<String> list = [
    'Residential',
    'Plot',
    'Commercial',
  ];

  List<List<String>> titles = [
    ["Apartment", "Villa"],
    ["Apartment1", "Villa1"],
    ["Apartment2", "Villa2"],
  ];

  List<List<String>> images = [
    [(ImageAssets.apartmentIcon), (ImageAssets.villaIcon)],
    [(ImageAssets.apartmentIcon), (ImageAssets.villaIcon)],
    [(ImageAssets.apartmentIcon), (ImageAssets.villaIcon)],
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          SvgPicture.asset(ImageAssets.propertyTypeIcon,width: 20,height: 20,),
          const SizedBox(width: 10),
          const Text("Property Type",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
        ],),
        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              list.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selected = index;
                  });
                },
                child: selected == index
                    ? Container(
                        width: 100,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: AppColors.primary, width: 2),
                        ),
                        child: Center(
                            child: Text(
                          list[index],
                          style:
                              TextStyle(fontSize: 12, color: AppColors.primary),
                        )),
                      )
                    : Container(
                        width: 100,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.gray),
                        ),
                        child: Center(
                            child: Text(
                          list[index],
                          style: const TextStyle(fontSize: 12),
                        )),
                      ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        PropertyChooseWidget(
          listTitle: titles[selected],
          listImage: images[selected],
        )
      ],
    );
  }
}
