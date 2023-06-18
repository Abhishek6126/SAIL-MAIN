import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sail_test/core/app_export.dart';
import 'package:sail_test/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    cacheAssets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Replace with your actual image path
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(42),
              vertical: getVerticalSize(2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 2.0), // Adjust the padding as needed
                      child: Container(
                        padding: EdgeInsets.all(27.0), // Adjust the padding within the container as needed
                        child: FittedBox(
                          fit: BoxFit.scaleDown, // Adjust the fit property to scale down the image
                          alignment: Alignment.bottomCenter, // Adjust the alignment to bottom
                          child: CustomImageView(
                            imagePath: ImageConstant.imgSaillogo1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "MES APP",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtPoppinsExtraBold35,
                  ),
                  Text(
                  "LOGIN",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtPoppinsBold48,
                  ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(16)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: getVerticalSize(5),
                              right: getHorizontalSize(2),
                            ),
                            padding: EdgeInsets.fromLTRB(
                              getHorizontalSize(16),
                              getVerticalSize(15),
                              getHorizontalSize(16),
                              getVerticalSize(15),
                            ),
                            decoration: AppDecoration.fillBlue50.copyWith(
                              borderRadius:
                                  BorderRadiusStyle.roundedBorder25,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgPngtreevector,
                                  height: getVerticalSize(30),
                                  width: getHorizontalSize(23),
                                  margin: EdgeInsets.only(
                                      bottom: getVerticalSize(4)),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: getHorizontalSize(11),
                                        bottom: getVerticalSize(2)),
                                    child: TextField(
                                      decoration: InputDecoration.collapsed(
                                        hintText: "Username",
                                        hintStyle: AppStyle.txtPoppinsSemiBold16
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: getVerticalSize(10),
                              right: getHorizontalSize(2),
                            ),
                            padding: EdgeInsets.fromLTRB(
                              getHorizontalSize(6),
                              getVerticalSize(15),
                              getHorizontalSize(16),
                              getVerticalSize(15),
                            ),
                            decoration: AppDecoration.fillBlue50.copyWith(
                              borderRadius:
                                  BorderRadiusStyle.roundedBorder25,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgKeyicon266001,
                                  height: getVerticalSize(30),
                                  width: getHorizontalSize(43),
                                  margin: EdgeInsets.only(
                                      bottom: getVerticalSize(4)),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: getVerticalSize(2)),
                                    child: TextField(
                                      obscureText: !_isPasswordVisible,
                                      decoration: InputDecoration.collapsed(
                                        hintText: "Password",
                                        hintStyle: AppStyle.txtPoppinsSemiBold16
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isPasswordVisible =
                                          !_isPasswordVisible;
                                    });
                                  },
                                  child: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomButton(
                            height: getVerticalSize(72),
                            text: "LOGIN",
                            margin: EdgeInsets.only(
                              top: getVerticalSize(24),
                            ),
                            onTap: () {
                              onTapLogin(context);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: getVerticalSize(28),
                              bottom: getVerticalSize(5),
                            ),
                            child: Text(
                              "Forgot Password?",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsBold18.copyWith(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
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

  void cacheAssets() async {
    await precacheImage(
      AssetImage('assets/images/background.png'), // Replace with your actual image path
      context,
    );
    await precacheImage(
      AssetImage(ImageConstant.imgSaillogo1),
      context,
    );
    await precacheImage(
      AssetImage(ImageConstant.imgPngtreevector),
      context,
    );
    await precacheImage(
      AssetImage(ImageConstant.imgKeyicon266001),
      context,
    );
  }

  void onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.landingPageScreen);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      title: 'sail_test',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginScreen,
      routes: AppRoutes.routes,
    );
  }
}
