import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:mvvm/DATA/Network/BaseApiServices.dart';
import 'package:mvvm/UTILS/Routes/routes_name.dart';

import '../MODEL/DATA/Network/NetworkApiService.dart';
import 'add_screen.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    fetchdata();
    super.initState();
  }
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController subDescriptionController= TextEditingController();


  List<dynamic> data = [];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'You have got \n${data.length} task today',
                style: TextStyle(color: Colors.white),
              ),

              CircleAvatar()
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Container(
              width: 400,
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Search Task here',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white10,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // FloatingActionButton(onPressed: () {
            //   fetchdata();
            // }),

            Row(
              children: [
                Text(
                  'Todays Task',
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    fetchdata();

                  },

                  child: Text('View All'),)
              ],
            ),

            Container(
              color: Colors.white12,
              height: 550,
              child: GridView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final datas = data[index];
                    var title = datas['owner_name'];
                    var description = datas['pet_name'];
                    var subDescription = datas['pet_name'];
                    final id =datas['id'];
                    return Container(
                        height: 200,
                        child: Card
                          (
                          surfaceTintColor: Colors.black,
                          color: Colors.black,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text('ID:'+id.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'Title:  ' + title,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  // Spacer(),
                                  Text(
                                    'Description:  ' + description,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  // Spacer(),
                                  Text(
                                    'Sub_descript:  ' + subDescription,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      String date='2021-01-9';

                                      TextEditingController updateTitleController = TextEditingController(text: titleController.text);
                                      TextEditingController updateDescriptionController = TextEditingController(text: descriptionController.text);
                                      TextEditingController updateSubDescriptionController= TextEditingController( text: updateDescriptionController.text );
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: const Text("Edit"),
                                          content: Column(
                                            children: [
                                              Text('title'),
                                              TextField(
                                                controller: updateTitleController,
                                              ),
                                              Text('Description'),
                                              TextField(
                                                controller: updateDescriptionController,
                                              ),
                                              Text('subDescription'),
                                              TextField(
                                                controller: updateSubDescriptionController,
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  upData(
                                                      updateTitleController.text,
                                                      updateDescriptionController.text,
                                                      updateSubDescriptionController.text,
                                                      date,
                                                      id
                                                  );
                                                  Navigator.pop(context, true);
                                                  fetchdata();
                                                },
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      color: Colors.blue,
                                                      shape: BoxShape.circle),
                                                  padding: const EdgeInsets.all(14),
                                                  child: const Text("okay"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),

                                  IconButton(
                                      onPressed: () {
                                        deleteData(id);
                                        fetchdata();
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ));
                  }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
              ),),
            ),
            ElevatedButton(
              onPressed: () {

                Navigator.pushNamed(context,RoutesName.addscreen);
              },
              child: Icon(Icons.add),
            ),
          ]),
        ));
  }

  void fetchdata() async {
    const url = 'https://fyp-api.aakashacharya.com.np/api/v1/appointment/all';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    print('data fetch');
    setState(() {
      data = json['data'];
    });
  }
}
