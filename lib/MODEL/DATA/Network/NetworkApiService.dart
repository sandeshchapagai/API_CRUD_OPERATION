import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../app_exeptions.dart';


  @override
  dynamic returnResponse(http.Response response) {
    switch (response) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 500:
      case 404:
        throw UnauthorizedException(response.body.toString());

      default:
        throw FetchDataException(
            'Error ' + 'with status code' + response.statusCode.toString());
    }
  }

  void addData(String title, String subtitle,String description, String date) async {
    const apikey = "https://fyp-api.aakashacharya.com.np/api/v1/appointment/create";
    Map<String, dynamic> dataToSend = {
      "owner_name": title,
      "pet_name": subtitle,
      "apt_date": date,
      "apt_notes": description
    };
    final response = await http.post(
      Uri.parse(apikey),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(dataToSend),
    );
    if (response.statusCode == 201) {
      print('Data added successfully');
    } else {
      print('Failed to add data. Error: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }

  void upData(String title, String subtitle, String description, String date,
      int id) async {
    String apiEndpoint = "https://fyp-api.aakashacharya.com.np/api/v1/appointment/update/$id";
    Map<String, dynamic> dataToSend = {
      'owner_name': title,
      'pet_name': subtitle,
      'apt_notes': description,
      'apt_date': date
    };

    final response = await http.patch(
      Uri.parse(apiEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(dataToSend),
    );

    if (response.statusCode == 200) {
      print('Data updated successfully');

      // You may want to fetch users again after updating data
    } else {
      print('Failed to update data. Error: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }

  void deleteData(int id) async {
    String apiEndpoint = "https://fyp-api.aakashacharya.com.np/api/v1/appointment/delete/$id";

    final response = await http.delete(
      Uri.parse(apiEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print('Data deleted successfully');
    } else {
      print('Failed to delete data. Error: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }
