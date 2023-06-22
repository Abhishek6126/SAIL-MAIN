import '../../core/app_export.dart';
import '../call_sms_screen/widgets/callsms_item_widget.dart';
import 'package:flutter/material.dart';

class CallSmsScreen extends StatefulWidget {
  const CallSmsScreen({Key? key}) : super(key: key);

  @override
  _CallSmsScreenState createState() => _CallSmsScreenState();
}

class _CallSmsScreenState extends State<CallSmsScreen> {
  double appBarHeight = 260; // Initial height of the app bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background1.png', // Replace with your actual image path
              fit: BoxFit.cover,
            ),
          ),
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
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: getVerticalSize(140)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalSize(22),
                        vertical: getVerticalSize(16),
                      ),
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: getVerticalSize(12));
                        },
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          String name = '';
                          String position = '';
                          String phoneNumber = '';

                          if (index == 0) {
                            name = 'Arun Kotnis';
                            position = 'General Manager';
                            phoneNumber = '9407982428';
                          } else if (index == 1) {
                            name = 'Akshat Pandey';
                            position = 'Intern';
                            phoneNumber = '23232';
                          } else if (index == 2) {
                            name = 'Abhishek Pandey';
                            position = 'Intern';
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
                            name: name,
                            position: position,
                            phoneNumber: phoneNumber,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 43,
                left: 13,
                right: 13,
                child: PreferredSize(
                  preferredSize: Size.fromHeight(getVerticalSize(140)),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification) {
                        setState(() {
                          appBarHeight =
                              160 - scrollNotification.metrics.pixels;
                          if (appBarHeight < 80) {
                            appBarHeight = 80;
                          }
                        });
                      }
                      return true;
                    },
                    child: Container(
                      padding: getPadding(
                        left: 18,
                        top: 4,
                        right: 18,
                        bottom: 4,
                      ),
                      decoration: AppDecoration.outlineBlack9003f.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder32,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: getHorizontalSize(
                              154,
                            ),
                            margin: getMargin(
                              left: 5,
                              top: 5,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "CALL/SMS\n",
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        32,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "PEERS",
                                    style: TextStyle(
                                      color: ColorConstant.blue50001,
                                      fontSize: getFontSize(
                                        32,
                                      ),
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgCall178x78,
                              height: getVerticalSize(
                                95,
                              ),
                              width: getHorizontalSize(
                                81,
                              ),
                              radius: BorderRadius.circular(
                                getHorizontalSize(
                                  22,
                                ),
                              ),
                              margin: getMargin(
                                top: 5,
                                bottom: 6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
