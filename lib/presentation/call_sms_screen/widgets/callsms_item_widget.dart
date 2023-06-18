import 'package:flutter/material.dart';
import 'package:sail_test/core/app_export.dart';
import 'package:url_launcher/url_launcher.dart';

class CallsmsItemWidget extends StatelessWidget {
  final String name;
  final String position;
  final String phoneNumber;

  const CallsmsItemWidget({
    Key? key,
    required this.name,
    required this.position,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(all: 8),
      decoration: AppDecoration.outlineBlack9003f3.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder22,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: getHorizontalSize(151),
            child: Padding(
              padding: EdgeInsets.only(top: 19, left: 20), // Add top padding
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$name\n",
                      style: TextStyle(
                        color: ColorConstant.blue50001,
                        fontSize: getFontSize(22),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: "$position\n",
                      style: TextStyle(
                        color: ColorConstant.black900,
                        fontSize: getFontSize(21),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(
              width:
                  getHorizontalSize(30)), // Add spacing between text and icons
          GestureDetector(
            onTap: ()
                // Handle call icon click here
                async {
              Uri phoneno = Uri.parse('tel:$phoneNumber');
              if (await launchUrl(phoneno)) {
                //dialer opened
              } else {
                //dailer is not opened
              } // Replace PHONE_NUMBER with the desired phone number
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgCallicon1,
              height: getVerticalSize(62),
              width: getHorizontalSize(50),
              radius: BorderRadius.circular(getHorizontalSize(11)),
              margin: getMargin(top: 27, bottom: 14),
            ),
          ),
          SizedBox(width: getHorizontalSize(12)), // Add spacing between icons
          GestureDetector(
            onTap: () async {
              Uri phoneno = Uri.parse('sms:$phoneNumber');
              if (await launchUrl(phoneno)) {
                //dialer opened
              } else {
                //dailer is not opened
              }
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgSms1,
              height: getSize(62),
              width: getSize(62),
              margin: getMargin(top: 27, bottom: 14, right: 1),
            ),
          ),
        ],
      ),
    );
  }
}
