import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sail_test/core/app_export.dart';

class LandingPageItemWidget extends StatelessWidget {
  LandingPageItemWidget({
    Key? key,
    required this.onTap,
    required this.imagePath,
    required this.cardText,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String imagePath;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: AppDecoration.outlineBlack9003f1.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder25,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(),
              child: CustomImageView(
                imagePath: imagePath,
                margin: EdgeInsets.fromLTRB(1, 15, 1, 15),
                height: getVerticalSize(149),
                width: getHorizontalSize(130),
                radius: BorderRadius.circular(getHorizontalSize(22)),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 3),
            Text(
              cardText,
              maxLines: 2, // Set a maximum number of lines for the text
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppStyle.txtPoppinsBold27,
            ),
          ],
        ),
      ),
    );
  }
}

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorConstant.gray10001,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundlanding.png', // Replace with your actual image path
              fit: BoxFit.cover,
            ),
          ),
          //body:
          Container(
            padding: EdgeInsets.fromLTRB(14, MediaQuery.of(context).padding.top + 25, 14, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 1),
                  padding: EdgeInsets.fromLTRB(12, 15, 12, 15),
                  decoration: AppDecoration.outlineBlack9003f.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder32,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: getHorizontalSize(147),
                        margin: EdgeInsets.only(left: 7),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "WELCOME\n",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(29),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: "USER",
                                style: TextStyle(
                                  color: ColorConstant.blue50002,
                                  fontSize: getFontSize(29),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgEllipse1,
                        height: getVerticalSize(101),
                        width: getHorizontalSize(71),
                        radius: BorderRadius.circular(getHorizontalSize(33)),
                        margin: EdgeInsets.only(top: 5, bottom: 4),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1),
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    primary: false,
                    physics: BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: getHorizontalSize(11),
                    mainAxisSpacing: getHorizontalSize(11),
                    staggeredTileBuilder: (index) {
                      return StaggeredTile.fit(1);
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      VoidCallback? onTap;
                      String imagePath = '';
                      String cardText = '';

                      if (index == 0) {
                        onTap = () => onTapColumnqrcodeone(context);
                        imagePath = ImageConstant.imgQrcode1;
                        cardText = "QR\nScanner";
                      } else if (index == 1) {
                        onTap = () => onTapColumnmilldata(context);
                        imagePath = ImageConstant.img98591;
                        cardText = "Mills\nReport";
                      } else if (index == 2) {
                        onTap = () => onTapColumnreport(context);
                        imagePath = ImageConstant.img2448914383x81;
                        cardText = "Grievance Report";
                      } else if (index == 3) {
                        onTap = () => onTapColumncallsms(context);
                        imagePath = ImageConstant.imgCall1;
                        cardText = "Call/SMS Peers";
                      }

                      return LandingPageItemWidget(
                        onTap: onTap,
                        imagePath: imagePath,
                        cardText: cardText,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapColumnqrcodeone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.qrCodeScreen);
  }

  onTapColumnmilldata(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.millsScreen);
  }

  onTapColumnreport(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.reportScreen);
  }

  onTapColumncallsms(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.callSmsScreen);
  }
}
