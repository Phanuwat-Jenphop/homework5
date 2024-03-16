import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

class ShowAPI extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ShowAPI> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse("YOUR_API_ENDPOINT"));
    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('API List Example'),
        ),
        body: _data.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_data[index]['title']),
                    subtitle: Text(_data[index]['subtitle']),
                    // You can add more fields as per your API response
                  );
                },
              ),
      ),
    );
  }
}
