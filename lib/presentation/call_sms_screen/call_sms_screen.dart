import '../call_sms_screen/widgets/callsms_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:sail_test/core/app_export.dart';
import 'package:sail_test/widgets/app_bar/custom_app_bar.dart';

class CallSmsScreen extends StatefulWidget {
  const CallSmsScreen({Key? key}) : super(key: key);

  @override
  _CallSmsScreenState createState() => _CallSmsScreenState();
}

class _CallSmsScreenState extends State<CallSmsScreen> {
  double appBarHeight = 160; // Initial height of the app bar

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ColorConstant.gray10001,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background2.png', // Replace with your actual image path
                fit: BoxFit.cover,
              ),
            ),
        // body: 
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.1),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(), // Add the BouncingScrollPhysics
              child: Column(
                children: [
                  SizedBox(
                      height: getVerticalSize(140)), // Spacer for the app bar
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalSize(22),
                        vertical: getVerticalSize(16)),
                    child: ListView.separated(
                      physics:
                          NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: getVerticalSize(12));
                      },
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        String name = '';
                        String position = '';
                        String phoneNumber = '';

                        // Set different texts based on the index
                        if (index == 0) {
                          name = 'John Doe';
                          position = 'Manager';
                          phoneNumber = '1234567890';
                        } else if (index == 1) {
                          name = 'Jane Smith';
                          position = 'Supervisor';
                          phoneNumber = '23232';
                        } else if (index == 2) {
                          name = 'Michael Johnson';
                          position = 'Engineer';
                          phoneNumber = '232323';
                        } else if (index == 3) {
                          name = 'Emily Brown';
                          position = 'Analyst';
                          phoneNumber = '1234890';
                        } else if (index == 4) {
                          name = 'David Wilson';
                          position = 'Coordinator';
                          phoneNumber = '123643637890';
                        } else if (index == 5) {
                          name = 'Sarah Davis';
                          position = 'Assistant';
                          phoneNumber = '1212367890';
                        }

                        return CallsmsItemWidget(
                            name: name, position: position, phoneNumber: phoneNumber,);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: PreferredSize(
                preferredSize: Size.fromHeight(
                    getVerticalSize(140)), // Increase the preferred size
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    // Update the app bar height based on the scroll position
                    if (scrollNotification is ScrollUpdateNotification) {
                      setState(() {
                        // Reduce the app bar height as the user scrolls
                        appBarHeight = 160 - scrollNotification.metrics.pixels;
                        if (appBarHeight < 80) {
                          appBarHeight = 80; // Minimum height for the app bar
                        }
                      });
                    }
                    return true;
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: getVerticalSize(20),
                        bottom:
                            getVerticalSize(16)), // Add top and bottom padding
                    child: CustomAppBar(
                      height: appBarHeight,
                      centerTitle: false, // Align the title to the left
                      title: Row(
                        // Use a Row to align the text and image horizontally
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 0,
                                bottom: 60), // Add top and bottom padding
                            child: Container(
                              width: getHorizontalSize(162),
                              margin: getMargin(left: 34, bottom: 2),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "CALL/SMS\n",
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(28),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "PEERS",
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
                          ),
                          Spacer(), // Add a spacer to push the image to the right
                          CustomImageView(
                            imagePath: ImageConstant.imgCall178x78,
                            height: getSize(78),
                            width: getSize(68),
                            radius:
                                BorderRadius.circular(getHorizontalSize(22)),
                            margin: getMargin(
                                left: 50,
                                top: 3,
                                bottom: 61,
                                right: 30), // Adjust the margin
                          ),
                        ],
                      ),
                      styleType: Style.bgShadowBlack9003f,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
          ],
      ),
      ),
    );
  }
}
