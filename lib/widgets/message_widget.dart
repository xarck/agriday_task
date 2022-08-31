import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
    required this.sender,
    required this.mesage,
  }) : super(key: key);
  final bool sender;
  final String mesage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 3),
        decoration: BoxDecoration(
          color: sender ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Text(
          mesage,
          style: TextStyle(
            color: sender ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
