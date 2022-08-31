import 'package:flutter/material.dart';
import 'package:intern_task/controllers/enquiry_details_controller.dart';

import 'package:intern_task/models/fruit_info_model.dart';
import 'package:intern_task/utils/dimensions.dart';
import 'package:intern_task/utils/util.dart';
import 'package:intern_task/widgets/fruit_seller_widget.dart';
import 'package:intern_task/widgets/message_widget.dart';
import 'package:provider/provider.dart';

class EnquiryDetails extends StatefulWidget {
  EnquiryDetails({
    Key? key,
    required this.fruitInfo,
  }) : super(key: key);
  final FruitInfo fruitInfo;
  @override
  State<EnquiryDetails> createState() => _EnquiryDetailsState();
}

class _EnquiryDetailsState extends State<EnquiryDetails> {
  String _textVal = "";
  final TextEditingController _textEditingController = TextEditingController();
  late EnquiryDetailsController eqc;

  @override
  void initState() {
    super.initState();
    eqc = Provider.of<EnquiryDetailsController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.fruitInfo.seller ?? "",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Consumer<EnquiryDetailsController>(
        builder: (context, data, child) {
          return Container(
            height: getSize(context).height,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Lot Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                FruitSellerWidget(
                  fruitInfo: widget.fruitInfo,
                ),
                SizedBox(
                  height: 10,
                ),
                MessageWidget(
                  sender: false,
                  mesage:
                      "Hello Buyer we have ${widget.fruitInfo.product} ready to ship",
                ),
                MessageWidget(
                  sender: false,
                  mesage: "Do let me know",
                ),
                ListView.builder(
                  itemCount: data.messages.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MessageWidget(
                      sender: data.messages[index].sender ?? false,
                      mesage: data.messages[index].message ?? "",
                    );
                  },
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        decoration: new InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: hexToColor("dddddd"),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: hexToColor("dddddd"),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Message',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _textVal = val;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          eqc.addMessage(_textVal, true);
                          _textEditingController.text = "";
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
