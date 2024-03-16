import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:homework5/models/demo.dart';
import 'package:homework5/models/showdt.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _NotificationState();
}

class _NotificationState extends State<Movies> {
  // key  ,  value
  // late List<Map<String, dynamic>>? _data;  // declare variable is null, but be not null
  List<Anime>? _anime;
  late Showdata showdata;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            var dio = Dio(BaseOptions(responseType: ResponseType.plain));
            var response =
                await dio.get('https://api.sampleapis.com/movies/animation');
            print('Status code: ${response.statusCode}');
            response.headers.forEach((title, values) {
              print('$title: $values');
            });
            print(response.data.toString());

            // print(data.length);  // จำนวนรายการ
            // print(data[0]['name']);
            setState(() {
              var list = jsonDecode(response.data.toString());

              _anime = list.map<Anime>((item) => Anime.fromJson(item)).toList();
            });
          },
          child: Text('Animations'),
        ),
        Expanded(
          child: _anime == null
              ? SizedBox.shrink()
              // : calldt(),
              : ListView.builder(
                  itemCount: _anime!.length,
                  itemBuilder: (context, index) {
                    var anime = _anime![index];

                    return ListTile(
                      title: Text(anime.title ?? ''),
                      subtitle: Text(anime.imdbId ?? ''),
                      trailing: anime.posterURL == ''
                          ? null
                          : Image.network(
                              anime.posterURL ?? '',
                              errorBuilder: (context, error, stackTrace) {
                                // if error, show icon error
                                return Icon(Icons.error,
                                    color: Color.fromARGB(255, 54, 136, 244));
                              },
                            ),
                      onTap: () {
                        print('You click ${anime.title}');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 500,
                                  height: 600,
                                  // color: Color.fromARGB(255, 156, 159, 159),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 181, 241, 241),
                                    border:
                                    Border.all(width: 4.0, color: Color.fromARGB(255, 58, 147, 243)), // ขอบนอก=ความหนาขอบนอก
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(anime.title ?? '',
                                        style: TextStyle(
                                          fontSize: 35.0,
                                          color: Color.fromARGB(170, 2, 80, 80)
                                        ),
                                      ),
                                      SizedBox(),
                                      Image.network(
                                        anime.posterURL ?? '',
                                        errorBuilder:
                                          (context, error, stackTrace) {
                                        // if error, show icon error
                                            return Icon(
                                              Icons.error,
                                              color: Color.fromARGB(255, 54, 136, 244),
                                            );
                                          },
                                          fit: BoxFit.fill,
                                      ),
                                      SizedBox(),
                                      Text("IMBD ID: " +  anime.imdbId.toString() ?? '',
                                         style: TextStyle(
                                          fontSize: 25.0,
                                          color: Color.fromARGB(255, 16, 108, 108)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
