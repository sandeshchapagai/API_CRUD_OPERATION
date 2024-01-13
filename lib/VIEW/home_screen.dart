import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

              CircleAvatar(child: Icon(Icons.watch_later,color: Colors.black,),)
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
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
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
                    var subDescription = datas['apt_notes'];
                    var date=datas['apt_date'];
                    final id =datas['id'];
                    return  Card(
                      surfaceTintColor: Colors.black,
                          color: Colors.black,
                          child: ListView(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SizedBox(height: 15,),
                              Text(date.substring(0, 10),textAlign:TextAlign.right,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize:10),),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Text('ID:\t\t\t',
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                        ),
                                        Text(id.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Title:\t\t\t',
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                           title,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    // Spacer(),
                                    Row(
                                      children: [
                                        Text('Description:\t\t\t',
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                           description,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    // Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          'Sub_descript:  ',
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                           subDescription,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          surfaceTintColor: Colors.black,
                                          backgroundColor: Colors.white,
                                          title: Center(child: const Text("Edit")),
                                          content: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('title'),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                        borderRadius: BorderRadius.circular(10)
                                                    ) ,
                                                    child: TextField(
                                                      controller: updateTitleController,
                                                      decoration:InputDecoration(
                                                          border: OutlineInputBorder(
                                                              gapPadding: 8,
                                                              borderRadius: BorderRadius.circular(10)
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Description'),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                        borderRadius: BorderRadius.circular(10)
                                                    ) ,
                                                    child: TextField(
                                                      controller: updateDescriptionController,
                                                      decoration:InputDecoration(
                                                          border: OutlineInputBorder(
                                                              gapPadding: 8,
                                                              borderRadius: BorderRadius.circular(10)
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('subDescription'),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                        borderRadius: BorderRadius.circular(10)
                                                    ) ,
                                                    child: TextField(
                                                      controller: updateSubDescriptionController,
                                                      decoration:InputDecoration(
                                                          border: OutlineInputBorder(
                                                              gapPadding: 8,
                                                              borderRadius: BorderRadius.circular(10)
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                                                child: Center(
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                        color: Colors.blue,
                                                        shape: BoxShape.circle),
                                                    padding: const EdgeInsets.all(14),
                                                    child: const Text("okay",style: TextStyle(color: Colors.white),),
                                                  ),
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
                        );
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
