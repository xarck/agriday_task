class MessageModel {
  String? message;
  bool? sender;

  MessageModel({this.message, this.sender});

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sender = json['sender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['sender'] = this.sender;
    return data;
  }
}
