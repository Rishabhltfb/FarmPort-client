import 'package:farmport_app/ui/utils/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

void customToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: FarmPortColors.kGreyColor,
    textColor: FarmPortColors.kWhiteColor,
  );
}
