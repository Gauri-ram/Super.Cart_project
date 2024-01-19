import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/provider/auth_provider.dart';
import 'package:supercart_new/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:supercart_new/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:supercart_new/widgets/app_bar/custom_app_bar.dart';
import 'package:supercart_new/widgets/custom_bottom_app_bar.dart';
import 'package:supercart_new/widgets/custom_elevated_button.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  _ProfilePageScreenState createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  double screenWidth = mediaQueryData.size.width;
  double screenHeight = mediaQueryData.size.height;

  double getResponsiveWidth(double percentage) {
    return screenWidth * percentage / 100;
  }

  double getResponsiveHeight(double percentage) {
    return screenHeight * percentage / 100;
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildFive(context),
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
                        // GestureDetector(
                        //   onTap: () {
                        //     onTapTwo(context);
                        //   },
                        //   child: Container(
                        //     margin: EdgeInsets.only(
                        //         left: getResponsiveWidth(0.5),
                        //         right: getResponsiveWidth(0.5)),
                        //     padding: EdgeInsets.symmetric(
                        //       horizontal: getResponsiveWidth(4),
                        //       vertical: getResponsiveHeight(1.5),
                        //     ),
                        //     decoration: AppDecoration.outlineBlack.copyWith(
                        //       borderRadius: BorderRadiusStyle.roundedBorder30,
                        //       color: appTheme.lightGreen900,
                        //     ),
                        //     child: Row(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         CustomImageView(
                        //           imagePath: ImageConstant.imgThumbsUp,
                        //           height: getResponsiveHeight(6),
                        //           width: getResponsiveWidth(7),
                        //           margin: EdgeInsets.only(
                        //               top: getResponsiveHeight(2),
                        //               bottom: getResponsiveHeight(0.5)),
                        //         ),
                        //         GestureDetector(
                        //           onTap: () {
                        //             onTapTxtPrevOrder(context);
                        //           },
                        //           child: Padding(
                        //             padding: EdgeInsets.only(
                        //                 left: getResponsiveWidth(1),
                        //                 bottom: getResponsiveHeight(1.5)),
                        //             child: Text(
                        //               "  Orders",
                        //               style: theme.textTheme.titleLarge,
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: getResponsiveHeight(3)),
                        Container(
                          margin: EdgeInsets.only(
                              left: getResponsiveWidth(0.5),
                              right: getResponsiveWidth(0.5)),
                          padding: EdgeInsets.symmetric(
                            horizontal: getResponsiveWidth(4),
                            vertical: getResponsiveHeight(1.5),
                          ),
                          decoration: AppDecoration.outlineBlack.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder30,
                            color: appTheme.lightGreen900,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgCall,
                                height: getResponsiveHeight(4),
                                width: getResponsiveWidth(5),
                                margin: EdgeInsets.only(
                                    top: getResponsiveHeight(1),
                                    bottom: getResponsiveHeight(1.5)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  onTapTxtCustomerCare(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: getResponsiveWidth(1),
                                      bottom: getResponsiveHeight(1.5)),
                                  child: Text(
                                    "  Customer Care",
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: getResponsiveHeight(5)),
                        CustomElevatedButton(
                          height: screenHeight * 0.07,
                          width: screenWidth * 0.7,
                          text: "LOGOUT",
                          margin: EdgeInsets.only(
                            left: screenWidth * 0.1,
                            right: screenWidth * 0.1,
                            bottom: screenHeight * 0.05,
                          ),
                          buttonStyle: CustomButtonStyles.outlinePrimaryTL16,
                          buttonTextStyle: theme.textTheme.titleLarge!,
                          onPressed: () {
                            // Get.toNamed(AppRoutes.mainPageonePage);
                            ap.userSignOut().then((value) =>
                                Get.toNamed(AppRoutes.welcomePageScreen));
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

  Widget _buildFive(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

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
          SizedBox(height: getResponsiveHeight(1)),
          CustomAppBar(
            leading: AppbarLeadingIconbutton(
              margin: EdgeInsets.only(
                  left: getResponsiveWidth(1),
                  top: getResponsiveHeight(0.7),
                  bottom: getResponsiveHeight(1.2)),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.mainPageonePage);
              },
            ),
            centerTitle: true,
            title: AppbarSubtitleOne(text: "Profile"),
          ),
          SizedBox(height: getResponsiveHeight(1)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(10)),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green.shade900,
                  backgroundImage: NetworkImage(ap.userModel.profilePic),
                  radius: 50,
                ),
                SizedBox(
                  height: getResponsiveHeight(1),
                ),
                Text(
                  ap.userModel.name,
                  style: TextStyle(
                    color: Colors.white, // Set the text color
                    fontSize: 14, // Set the font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ap.userModel.email,
                  style: TextStyle(
                    color: Colors.white, // Set the text color
                    fontSize: 14, // Set the font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ap.userModel.phoneNumber,
                  style: TextStyle(
                    color: Colors.white, // Set the text color
                    fontSize: 14, // Set the font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getResponsiveHeight(4)),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(right: getResponsiveWidth(1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomElevatedButton(
                          text: "Edit Profile",
                          margin: EdgeInsets.symmetric(),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoutes.editProfileScreen);
                          },
                          width: screenWidth * 0.6,
                          height: screenHeight * 0.06,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.previousOrderScreen);
  }

  onTapTxtCustomerCare(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.infoContactUsPageScreen);
  }

  onTapTxtPrevOrder(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.previousOrderScreen);
  }
}
