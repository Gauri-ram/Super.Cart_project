import 'package:flutter/material.dart';
import 'package:supercart_new/core/app_export.dart';
// import 'package:supercart_new/widgets/custom_icon_button.dart';

class AppbarLeadingIconbutton extends StatelessWidget {
  AppbarLeadingIconbutton({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(key: key);

  String? imagePath;
  EdgeInsetsGeometry? margin;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = mediaQueryData.size.width;
    // double screenHeight = mediaQueryData.size.height;

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.mainPageonePage);
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: (screenWidth / 15 > 48) ? 48 : screenWidth / 15,
        ),
      ),
    );
  }
}
