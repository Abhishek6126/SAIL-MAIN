import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/app_export.dart';

class MillScreen extends StatefulWidget {
  const MillScreen({Key? key}) : super(key: key);

  @override
  State<MillScreen> createState() => _MillScreenState();
}

class _MillScreenState extends State<MillScreen> {
  List<dynamic> _tableData = [];

  @override
  void initState() {
    super.initState();
    fetchTableData();
  }

  Future<void> fetchTableData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.43.202:3000/MILL_DATA'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          _tableData = jsonData;
        });
      } else {
        print('Failed to fetch table data. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred while fetching table data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: getPadding(
                left: 13,
                top: 61,
                right: 13,
                bottom: 41,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: getMargin(
                      bottom: 5,
                    ),
                    padding: getPadding(
                      left: 17,
                      top: 4,
                      right: 17,
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
                            90,
                          ),
                          margin: getMargin(
                            left: 6,
                            top: 2,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "MILLS\n",
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
                                  text: "DATA",
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
                        CustomImageView(
                          imagePath: ImageConstant.img98591,
                          height: getVerticalSize(
                            79,
                          ),
                          width: getHorizontalSize(
                            83,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              22,
                            ),
                          ),
                          margin: getMargin(
                            top: 8,
                            bottom: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _tableData.length,
                    itemBuilder: (context, index) {
                      final MILL_NAME = _tableData[index][0];
                      final PRODUCTION = _tableData[index][1];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              MILL_NAME,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Production: $PRODUCTION',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
