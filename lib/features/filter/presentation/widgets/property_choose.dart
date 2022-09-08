import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';

class PropertyChooseWidget extends StatefulWidget {
  const PropertyChooseWidget(
      {Key? key, required this.listTitle, required this.listImage})
      : super(key: key);
  final List<String> listTitle;
  final List<String> listImage;

  @override
  State<PropertyChooseWidget> createState() => _PropertyChooseWidgetState();
}

class _PropertyChooseWidgetState extends State<PropertyChooseWidget> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            widget.listTitle.length,
            (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selected = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: selected == index
                      ? Container(
                          width: 160,
                          height: 80,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: AppColors.primary, width: 2),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                  child: SvgPicture.asset(
                                      widget.listImage[index])),
                              Expanded(
                                child: Text(
                                  widget.listTitle[index],
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.primary),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: 160,
                          height: 80,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.gray),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                  child: SvgPicture.asset(
                                      widget.listImage[index])),
                              Expanded(
                                child: Text(
                                  widget.listTitle[index],
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                )),
          ),
        ],
      ),
    );
  }
}
