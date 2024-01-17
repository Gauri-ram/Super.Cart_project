import 'package:flutter/material.dart';
import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:supercart_new/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:supercart_new/widgets/app_bar/custom_app_bar.dart';
import 'package:supercart_new/widgets/custom_bottom_app_bar.dart';
import 'package:supercart_new/widgets/custom_elevated_button.dart';
import 'package:flutter/services.dart';
import 'package:supercart_new/core/app_export.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    double getResponsiveWidth(double percentage) {
      return screenWidth * percentage / 100;
    }

    double getResponsiveHeight(double percentage) {
      return screenHeight * percentage / 100;
    }

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildFive(context, screenWidth, screenHeight),
              SizedBox(height: getResponsiveHeight(5)),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getResponsiveWidth(7),
                      vertical: getResponsiveHeight(0.5),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name  ",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: TextFormField(
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.name,
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: getResponsiveHeight(3)),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email  ",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: TextFormField(
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: getResponsiveHeight(7.5)),
                        CustomElevatedButton(
                          height: screenHeight * 0.12,
                          width: screenWidth * 0.7,
                          text: "Save",
                          margin: EdgeInsets.only(
                            left: screenWidth * 0.1,
                            right: screenWidth * 0.1,
                            bottom: screenHeight * 0.05,
                          ),
                          buttonStyle: CustomButtonStyles.outlinePrimaryTL16,
                          buttonTextStyle: theme.textTheme.titleLarge!,
                          onPressed: () {
                            Get.toNamed(AppRoutes.mainPageonePage);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFive(
      BuildContext context, double screenWidth, double screenHeight) {
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    double getResponsiveWidth(double percentage) {
      return screenWidth * percentage / 100;
    }

    double getResponsiveHeight(double percentage) {
      return screenHeight * percentage / 100;
    }

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: getResponsiveHeight(3)),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
        color: appTheme.lightGreen900,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: getResponsiveHeight(1.5)),
          CustomAppBar(
            leading: AppbarLeadingIconbutton(
              margin: EdgeInsets.only(
                  left: getResponsiveWidth(1),
                  top: getResponsiveHeight(0.7),
                  bottom: getResponsiveHeight(1.2)),
            ),
            centerTitle: true,
            title: AppbarSubtitleOne(text: "Edit Profile"),
          ),
          SizedBox(height: getResponsiveHeight(3)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(10)),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse6,
                  height: getResponsiveHeight(17),
                  radius: BorderRadius.circular(getResponsiveWidth(9)),
                  margin: EdgeInsets.only(left: getResponsiveWidth(2)),
                  onTap: () {
                    onTapTwo(context);
                  },
                ),
                SizedBox(height: getResponsiveHeight(1.7)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.otpPageScreen);
  }

  onTapTxtCustomerCare(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.infoContactUsPageScreen);
  }
}
