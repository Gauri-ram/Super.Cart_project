import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supercart_new/core/app_export.dart';
import 'package:supercart_new/model/user_model.dart';
import 'package:supercart_new/presentation/main_pageone_page/main_pageone_page.dart';
import 'package:supercart_new/provider/auth_provider.dart';
import 'package:supercart_new/utils/utils.dart';
import 'package:supercart_new/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:supercart_new/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:supercart_new/widgets/app_bar/custom_app_bar.dart';
// import 'package:supercart_new/widgets/custom_bottom_app_bar.dart';
import 'package:supercart_new/widgets/custom_elevated_button.dart';
// import 'package:flutter/services.dart';
// import 'package:supercart_new/core/app_export.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  // for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

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

    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : Column(
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
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: nameController,
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
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: emailController,
                                        textInputAction: TextInputAction.done,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                  buttonStyle:
                                      CustomButtonStyles.outlinePrimaryTL16,
                                  buttonTextStyle: theme.textTheme.titleLarge!,
                                  onPressed: () => storeData()),
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
                InkWell(
                    onTap: () => selectImage(),
                    child: image == null
                        ? const CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 50,
                            child: Icon(
                              Icons.account_circle,
                              size: 50,
                              color: Colors.white,
                            ))
                        : CircleAvatar(
                            backgroundImage: FileImage(image!),
                            radius: 50,
                          )),
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

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        profilePic: "",
        createdAt: "",
        phoneNumber: "",
        uid: "");
    if (image != null) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          // Once the data is saved we need to store data locally also
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPageonePage()),
                          (route) => false),
                    ),
              );
        },
      );
    } else {
      showSnackBar(context, "Please upload your profile photo");
    }
  }
}
