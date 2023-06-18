import '../../core/app_export.dart';
import '../call_sms_screen/widgets/callsms_item_widget.dart';
import 'package:flutter/material.dart';
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
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background2.png', // Replace with your actual image path
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
                  top: 0,
                  left: 0,
                  right: 0,
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
                        padding: EdgeInsets.only(
                          top: getVerticalSize(20),
                          bottom: getVerticalSize(16),
                        ),
                        child: CustomAppBar(
                          height: appBarHeight,
                          centerTitle: false,
                          title: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 0,
                                  bottom: 60,
                                ),
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
                              Spacer(),
                              CustomImageView(
                                imagePath: ImageConstant.imgCall178x78,
                                height: getSize(78),
                                width: getSize(68),
                                radius: BorderRadius.circular(
                                    getHorizontalSize(22)),
                                margin: getMargin(
                                    left: 50, top: 3, bottom: 61, right: 30),
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
