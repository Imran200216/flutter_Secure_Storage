import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FssProvider extends ChangeNotifier {
  /// text field controller
  TextEditingController dataController = TextEditingController();

  /// flutter storage
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  /// write data
  writeDataSecure(String key, String value) async {
    await storage.write(key: key, value: value).then((value) {
      Fluttertoast.showToast(
          msg: "Data Saved",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    });
    notifyListeners();
  }

  /// read data
  readDataSecure(String key) async {
    String value = await storage.read(key: key) ?? "No Data Found!";
    Fluttertoast.showToast(
      msg: "Data Read!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    print("/////////////////////////////////////////////////");
    print("Data read from secure storage: $value");
    notifyListeners();
  }

  /// delete data
  deleteDataSecure(String key) async {
    await storage.delete(key: key).then((value) {
      print("/////////////////////////////////////////////////");
      Fluttertoast.showToast(
          msg: "Data Deleted!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
    notifyListeners();
  }
}
