import 'package:flutter/cupertino.dart';
import 'package:intern_task/models/message_model.dart';

class EnquiryDetailsController extends ChangeNotifier {
  List<MessageModel> messages = [];

  addMessage(String msg, bool sender) {
    messages.add(MessageModel(message: msg, sender: sender));
    notifyListeners();
  }
}
