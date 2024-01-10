// import 'package:mvvm/DATA/Response/status.dart';
import 'package:mvvm/MODEL/DATA/Response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? messege;
  ApiResponse(this.status,this.data,this.messege);
  ApiResponse.loading(): status =Status.Loading;

  ApiResponse.complete(): status =Status.Completed;

  ApiResponse.error(): status =Status.Error;

  @override
  String toString(){
    return "Status: $status\n Message: $messege \n Data:$data";
  }

}