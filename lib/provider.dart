import 'package:flutter/material.dart';

enum Response { success, fail }

class DynamicFormProvider with ChangeNotifier {
  final textEditList = [TextEditingController()];
  var message = Response.success;
  bool isPress = false;

  addForm() {
    final controller = TextEditingController();
    if (textEditList.length > 3) {
      message = Response.fail;
    } else {
      textEditList.add(controller);
      message = Response.success;
      notifyListeners();
    }
  }

  onPress(){
    isPress = !isPress;
    notifyListeners();
  }
}

ScaffoldFeatureController snackBarWidget(BuildContext context, message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}
