import 'package:flutter/material.dart';
import 'package:mvvm/UTILS/utils.dart';

import '../MODEL/DATA/Network/NetworkApiService.dart';
import '../RES/components/round_button.dart';
class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController subDescriptionController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
backgroundColor: Colors.black,
        title: Text('Add Data'),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text('Title:',style: TextStyle(color:Colors.white),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                      borderRadius: BorderRadius.circular(10)
                    ) ,
                  child: TextField(
                    controller: titleController,style: TextStyle(color: Colors.white),
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        gapPadding: 8,
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),

                  ),
                ),
                Text('Description:',style: TextStyle(color:Colors.white),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: descriptionController,style: TextStyle(color: Colors.white),

                  ),
                ),
                Text('SubDescription:',style: TextStyle(color:Colors.white),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller:subDescriptionController,style: TextStyle(color: Colors.white),

                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${selectedDate.toLocal()}'.split(' ')[0],
                        style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Select Date'),
                      ),
                    ],
                  ),
                ),
                RoundedButton(onPressed: (){
                  String title = titleController.text;
                  String description = descriptionController.text;
                  String subDescription = subDescriptionController.text;
                   String date=selectedDate.toString();
                   if(title.isEmpty&&description.isEmpty&&subDescription.isEmpty){

                     utils.flushBarErrorMessage('Should Fill All The Fields', context);
                   }
                   else if(title.length<=3){

                     utils.flushBarErrorMessage('Title should be less than 6 characters', context);
                   }
                   else if(description.length>5){
                     utils.snakBar('Description should be Les than 5 Characters', context);
                   }
                   else{
                  addData(title, description, subDescription,date);
                  Navigator.pop(context);
                  }
                }, title: 'Add',
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
