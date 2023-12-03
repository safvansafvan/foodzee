import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodzee/controller/const.dart';

showMsgToast({required String msg}) {
  Fluttertoast.showToast(
      msg: msg,
      fontSize: 16,
      timeInSecForIosWeb: 3,
      backgroundColor: kgrey,
      gravity: ToastGravity.SNACKBAR);
}
