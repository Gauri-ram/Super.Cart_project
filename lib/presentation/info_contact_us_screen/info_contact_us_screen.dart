import 'package:flutter/material.dart';
import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:supercart_new/widgets/app_bar/appbar_subtitle.dart';
import 'package:supercart_new/widgets/app_bar/custom_app_bar.dart';

class InfoContactUsScreen extends StatelessWidget {
  const InfoContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context, screenWidth, screenHeight),
        body: Container(
          width: screenWidth,
          color: appTheme.lightGreen900,
          child: SingleChildScrollView(
            child: SizedBox(
              height: screenHeight * 0.823,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse1,
                    height: screenHeight * 0.823,
                    width: screenWidth,
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.119, // 49.h
                        top: screenHeight * 0.112, // 93.v
                        right: screenWidth * 0.119,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: screenWidth * 0.631, // 259.h
                            margin: EdgeInsets.only(
                                left: screenWidth * 0.061,
                                right: screenWidth * 0.065),
                            child: Text(
                              "Feel free to reach out anytime, and we'll get back to you promptly.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodyMediumLight,
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

  PreferredSizeWidget _buildAppBar(
      BuildContext context, double screenWidth, double screenHeight) {
    return CustomAppBar(
      height: screenHeight * 0.084,
      leadingWidth: screenWidth * 0.063,
      leading: AppbarLeadingIconbutton(
        margin: EdgeInsets.only(
          left: screenWidth * 0.087,
          top: screenHeight * 0.013,
          bottom: screenHeight * 0.014,
        ),
        onTap: () {
          onTapArrowDown(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "Contact Us",
        // style: TextStyle(
        //   color: Colors.white,
        // ),
      ),
    );
  }

  Widget _buildUserInfo(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.774, // 313.h
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.066,
          vertical: screenHeight * 0.041), // 26.h, 33.v
      decoration: AppDecoration.fillBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Info", style: theme.textTheme.titleLarge),
          SizedBox(height: screenHeight * 0.039), // 39.v
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.119), // 49.h
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEnvelopeOpenText,
                  height: screenHeight * 0.025, // 25.adaptSize
                  width: screenHeight * 0.025,
                  margin: EdgeInsets.only(bottom: screenHeight * 0.006), // 6.v
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.049), // 20.h
                  child:
                      Text("yo@suprcrt.me", style: theme.textTheme.titleLarge),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.036), // 36.v
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgPhone,
                height: screenHeight * 0.025,
                width: screenHeight * 0.025,
                margin: EdgeInsets.only(
                    top: screenHeight * 0.004,
                    bottom: screenHeight * 0.001), // 4.v, 1.v
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.049), // 20.h
                child: Text("8825079711", style: theme.textTheme.titleLarge),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.04), // 40.v
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.005), // 2.h
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGrid,
                  height: screenHeight * 0.025, // 25.v
                  width: screenWidth * 0.024, // 24.h
                  margin: EdgeInsets.only(
                      top: screenHeight * 0.001,
                      bottom: screenHeight * 0.004), // 1.v, 4.v
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.047), // 18.h
                  child: Text("Bangalore", style: theme.textTheme.titleLarge),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.031), // 31.v
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
                padding: EdgeInsets.only(left: screenWidth * 0.043), // 17.h
                child: Text("9:00 - 23:00", style: theme.textTheme.titleLarge),
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
