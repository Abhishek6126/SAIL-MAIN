import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TableDataPage extends StatefulWidget {
  const TableDataPage({Key? key}) : super(key: key);

  @override
  State<TableDataPage> createState() => _TableDataPageState();
}

class _TableDataPageState extends State<TableDataPage> {
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
      appBar: AppBar(
        title: const Text('Table Data'),
      ),
      body: ListView.builder(
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
     );
     }
}