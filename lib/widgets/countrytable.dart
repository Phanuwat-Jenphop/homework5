
// import 'package:homework5/time_table.dart';
import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:homework5/models/demo.dart';

class Countrytable extends StatefulWidget {
  const Countrytable({super.key});

  @override
  State<Countrytable> createState() => _CountryState();
}

class _CountryState extends State<Countrytable> {
              // key  ,  value    
  // late List<Map<String, dynamic>>? _data;  // declare variable is null, but be not null
  List<Country>? _countries;

  

  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            var dio = Dio(BaseOptions(responseType: ResponseType.plain));
            var response =
                await dio.get('https://api.sampleapis.com/countries/countries');
            print('Status code: ${response.statusCode}');
            response.headers.forEach((name, values) {
              print('$name: $values');
            });
            print(response.data.toString());

            // print(data.length);  // จำนวนรายการ
            // print(data[0]['name']);
            setState(() {
              var list = jsonDecode(response.data.toString());

              _countries = list.map<Country>(
                (item) => Country.fromJson(item)
              ).toList();

            });
          },
          child: Text('Test API'),
        ),
        Expanded(
          child: _countries == null
              ? SizedBox.shrink()
              : ListView.builder(
                  itemCount: _countries!.length,
                  itemBuilder: (context, index) {
                    var country = _countries![index];

                    return ListTile(
                      title: Text(country.name ?? ''),
                      subtitle: Text(country.capital ?? ''),
                      trailing: country.flag == ''
                          ? null
                          : Image.network(
                            country.flag ?? '',
                            errorBuilder: (context, error, stackTrace) {   // if error, show icon error
                                return Icon(Icons.error, color: Color.fromARGB(255, 54, 136, 244));
                              },
                          ),
                      onTap: () {
                        print('You click ${country.name}');
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
