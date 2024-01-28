import 'package:flutter/material.dart';
import 'package:supercart_new/core/app_export.dart';

// ignore: must_be_immutable
class ProductlistItemWidget extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final VoidCallback onDelete;

  const ProductlistItemWidget({
    required this.itemName,
    required this.itemPrice, // Add item name parameter
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth / 375.0;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5 * scaleFactor,
        vertical: 6 * scaleFactor,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(barcodeID),
          CustomImageView(
            imagePath: ImageConstant.imgImage1,
            height: 58 * scaleFactor,
            width: 58 * scaleFactor,
            radius: BorderRadius.circular(20 * scaleFactor),
          ),
          Container(
            width: 97 * scaleFactor,
            margin: EdgeInsets.only(
              left: 13 * scaleFactor,
              top: 9 * scaleFactor,
              bottom: 17 * scaleFactor,
            ),
            child: Text(
              "$itemName",
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(
            flex: 53,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 13 * scaleFactor,
              bottom: 28 * scaleFactor,
            ),
            child: Text(
              "x1",
              style: theme.textTheme.labelMedium,
            ),
          ),
          Spacer(
            flex: 46,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 14 * scaleFactor,
              bottom: 25 * scaleFactor,
            ),
            child: Text(
              '₹ $itemPrice',
              style: theme.textTheme.labelLarge,
            ),
          ),
          Spacer(
            flex: 46,
          ),
          InkWell(
            onTap: onDelete,
            child: Container(
              padding: EdgeInsets.all(10 * scaleFactor),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgBin,
                height: 18 * scaleFactor,
                width: 18 * scaleFactor,
                radius: BorderRadius.circular(9 * scaleFactor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
