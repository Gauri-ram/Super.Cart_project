import 'package:flutter/material.dart';
import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:supercart_new/widgets/app_bar/appbar_subtitle.dart';
import 'package:supercart_new/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:supercart_new/widgets/app_bar/custom_app_bar.dart';

class InfoContactUsScreen extends StatelessWidget {
  const InfoContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        // appBar: _buildAppBar(context, screenWidth, screenHeight),

        body: Container(
          width: screenWidth,
          color: appTheme.lightGreen900,
          child: Container(
            child: SizedBox(
              height: screenHeight,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // SizedBox(height: screenHeight * 0.2),
                  CustomAppBar(
                    leading: AppbarLeadingIconbutton(
                      margin: EdgeInsets.only(
                          left: screenWidth * 0.01,
                          top: screenHeight * 0.007,
                          bottom: screenHeight * 0.012),
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRoutes.profilePageScreen);
                      },
                    ),
                    centerTitle: true,
                    title: AppbarSubtitleOne(text: "Contact Us"),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.1,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: screenHeight * 0.1,
                            width: screenWidth * 0.6, // 259.h
                            margin: EdgeInsets.only(
                                left: screenWidth * 0.061,
                                right: screenWidth * 0.065),
                            child: Text(
                              "Feel free to reach out anytime, and we'll get back to you promptly.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.labelMediumGray200,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.073), // 73.v
                          _buildUserInfo(screenWidth, screenHeight)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.774, // 313.h
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06,
          vertical: screenHeight * 0.04), // 26.h, 33.v
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Information",
              style: TextStyle(
                  color: appTheme.lightGreen900,
                  fontWeight: FontWeight.w600,
                  fontSize: screenHeight * 0.035)),
          SizedBox(height: screenHeight * 0.04),
          Padding(
            padding: EdgeInsets.only(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEnvelopeOpenText,
                  height: screenHeight * 0.025,
                  width: screenHeight * 0.025,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05), // 20.h
                  child: Text("supercart@gmail.com",
                      style: TextStyle(
                          color: appTheme.lightGreen900,
                          fontWeight: FontWeight.w600,
                          fontSize: screenHeight * 0.023)),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.04), // 36.v
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgPhone,
                height: screenHeight * 0.025,
                width: screenHeight * 0.025,
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05), // 20.h
                child: Text("8825079711",
                    style: TextStyle(
                        color: appTheme.lightGreen900,
                        fontWeight: FontWeight.w600,
                        fontSize: screenHeight * 0.023)),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.04), // 40.v
          Padding(
            padding: EdgeInsets.only(), // 2.h
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGrid,
                  height: screenHeight * 0.025, // 25.v
                  width: screenWidth * 0.025, // 24.h // 1.v, 4.v
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05), // 18.h
                  child: Text("Bangalore",
                      style: TextStyle(
                          color: appTheme.lightGreen900,
                          fontWeight: FontWeight.w600,
                          fontSize: screenHeight * 0.023)),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.04), // 31.v
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgClock,
                height: screenHeight * 0.024, // 24.v
                width: screenWidth * 0.027, // 27.h
                margin: EdgeInsets.only(
                    top: screenHeight * 0.004,
                    bottom: screenHeight * 0.001), // 4.v, 1.v
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05), // 17.h
                child: Text("9:00 - 23:00",
                    style: TextStyle(
                        color: appTheme.lightGreen900,
                        fontWeight: FontWeight.w600,
                        fontSize: screenHeight * 0.023)),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.017), // 17.v
        ],
      ),
    );
  }

  onTapArrowDown(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profilePageScreen);
  }
}
