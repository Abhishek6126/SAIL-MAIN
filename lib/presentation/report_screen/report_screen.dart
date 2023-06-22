import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sail_test/core/app_export.dart';
import 'package:sail_test/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  TextEditingController locationController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController groupsixteenController = TextEditingController();
  File? pickedImage;


  Future<void> _openCamera() async {
    final imagePicker = ImagePicker();
    final pickedImageFile =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImageFile != null) {
      setState(() {
        pickedImage = File(pickedImageFile.path);
      });
    }
  }
  Future<void> _uploadImage() async {
    if (pickedImage == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please select an image.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      return;
    }

    final url = 'http://192.168.43.202:3000/upload';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', pickedImage!.path));
    request.fields['description'] = groupsixteenController.text;
    request.fields['location'] = locationController.text;
    request.fields['time'] = timeController.text;

    var response = await request.send();

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Image uploaded successfully.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to upload image.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return GestureDetector(
      onTap: () {
        // Unfocus any active text fields when tapping outside
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        // backgroundColor: ColorConstant.gray10001,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background1.png', // Replace with your actual image path
                fit: BoxFit.cover,
              ),
            ),
            //body:
            SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 46,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.fromLTRB(14, 7, 14, 7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: getHorizontalSize(162),
                            margin:
                                EdgeInsets.only(left: 9, top: 5, bottom: 2),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "GRIEVANCE\n",
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(28),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "REPORT",
                                    style: TextStyle(
                                      color: ColorConstant.blue50001,
                                      fontSize: getFontSize(28),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            width: getHorizontalSize(81),
                            height: getVerticalSize(83),
                            margin: EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: CustomImageView(
                              imagePath: ImageConstant.img2448914383x81,
                              radius: BorderRadius.circular(
                                  getHorizontalSize(22)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      margin: EdgeInsets.fromLTRB(19, 0, 17, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ColorConstant.blue50,
                        ),
                        child: CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: locationController,
                          initialValue: "",
                          hintText: "Location",
                          margin: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      margin: EdgeInsets.fromLTRB(19, 7, 17, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ColorConstant.blue50,
                        ),
                        child: CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: timeController,
                          initialValue: "",
                          hintText: "Time of event",
                          margin: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      margin: EdgeInsets.fromLTRB(19, 7, 17, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: CustomTextFormField(
                        focusNode: FocusNode(),
                        autofocus: true,
                        controller: groupsixteenController,
                        initialValue: "",
                        hintText: "Describe briefly",
                        margin: EdgeInsets.zero,
                        padding: TextFormFieldPadding.PaddingT27,
                        textInputAction: TextInputAction.done,
                        maxLines: 4,
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(261),
                      margin: EdgeInsets.fromLTRB(35, 12, 35, 0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "\nClick ",
                              style: TextStyle(
                                color: ColorConstant.indigo500,
                                fontSize: getFontSize(24),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: "below image to capture image of event (optional)",
                              style: TextStyle(
                                color: ColorConstant.gray80001,
                                fontSize: getFontSize(24),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: getVerticalSize(200),
                      width: getHorizontalSize(170),
                      margin: EdgeInsets.only(top: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: _openCamera,
                        child: CustomImageView(
                          imagePath: pickedImage != null
                              ? pickedImage!.path
                              : ImageConstant.imgUploadimage1,
                          radius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 10),
                    InkWell(
                      onTap: _uploadImage,
                      child: Container(
                        width: getHorizontalSize(296),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        padding: EdgeInsets.symmetric(vertical: 6),
                        decoration: AppDecoration.txtFillBlue900.copyWith(
                          borderRadius: BorderRadiusStyle.txtRoundedBorder25,
                        ),
                        child: Center(
                          child: Text(
                            "SUBMIT",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: AppStyle.txtPoppinsBold31,
                          ),
                        ),
                      ),
                    ),

                    // ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomImageView extends StatelessWidget {
  final String? imagePath;
  final BorderRadius? radius;

  const CustomImageView({
    Key? key,
    this.imagePath,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imagePath != null && imagePath!.startsWith('assets')) {
      // Image is an asset
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: Image.asset(
          imagePath!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    } else {
      // Image is a file
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: Image.file(
          File(imagePath!),
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
  }
} //end
