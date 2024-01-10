import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/UTILS/Routes/routes_name.dart';
import 'package:provider/provider.dart';
import 'package:mvvm/UTILS/utils.dart';

class AuthViewMOde with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signUploading = false;
  bool get signUploading => _signUploading;
  setsignUpLoading(bool value) {
    _signUploading = value;
    notifyListeners();
  }

  //
  // Future<void> loginApi(dynamic data, BuildContext context) async {
  //   setLoading(true);
  //   _myRepo.loginApi(data).then((value) {
  //     setLoading(false);
  //     utils.flushBarErrorMessage('login successfully', context);
  //     Navigator.pushNamed(context, RoutesName.home);
  //     if (kDebugMode) {
  //       print(value.toString());
  //     }
  //   }).onError((error, stackTrace) {
  //     setLoading(false);
  //     utils.flushBarErrorMessage(error.toString(), context);
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //   });
  // }
  // Future<void> signUpApi(dynamic data, BuildContext context) async {
  //   setsignUpLoading(true);
  //   _myRepo.loginApi(data).then((value) {
  //     setsignUpLoading(false);
  //     utils.flushBarErrorMessage('SignUp successfully', context);
  //     Navigator.pushNamed(context, RoutesName.home);
  //     if (kDebugMode) {
  //       print(value.toString());
  //     }
  //   }).onError((error, stackTrace) {
  //     setsignUpLoading(false);
  //     utils.flushBarErrorMessage(error.toString(), context);
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //   });
  // }
}
