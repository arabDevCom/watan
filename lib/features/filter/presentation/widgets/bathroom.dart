import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';

class ListNumbersWidget extends StatefulWidget {
   const ListNumbersWidget({Key? key, required this.title, required this.image}) : super(key: key);
   final String title;
   final String image;
  @override
  State<ListNumbersWidget> createState() => _ListNumbersWidgetState();
}

class _ListNumbersWidgetState extends State<ListNumbersWidget> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              widget.image,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 10),
             Text(
              widget.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(height: 12,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                10,
                    (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = index;
                    });
                  },
                  child: selected == index
                      ? Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      width: 50,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                        Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: Center(
                          child: Text(
                             (index+1).toString(),
                            style:
                            TextStyle(fontSize: 12, color: AppColors.primary),
                          )),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      width: 50,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.gray),
                      ),
                      child: Center(
                          child: Text(
                            (index+1).toString(),
                            style: const TextStyle(fontSize: 12),
                          )),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
