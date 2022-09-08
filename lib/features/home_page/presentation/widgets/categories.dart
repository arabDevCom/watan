import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
              25,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    child: Column(
                      children: [
                        Icon(
                          Icons.account_balance_outlined,
                          size: 25,
                        ),
                        Text(
                          "Category $index",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}
