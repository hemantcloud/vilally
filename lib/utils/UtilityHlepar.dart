import 'package:fluttertoast/fluttertoast.dart';

class UtilityHlepar {
  getToast(msg) {
    Fluttertoast.showToast(
      msg: msg.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      // fontSize: 16.0
    );
  }
}
