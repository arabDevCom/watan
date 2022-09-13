import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ManageNetworkImage extends StatelessWidget {
  const ManageNetworkImage(
      {Key? key, required this.imageUrl, this.height = 0, this.width = 0,  this.borderRadius=12})
      : super(key: key);

  final String imageUrl;
  final double height;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        imageUrl,
        height: height != 0 ? height : null,
        width: width != 0 ? width : null,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        fit: BoxFit.fill,
      ),
    );
  }
}
