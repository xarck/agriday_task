import 'package:flutter/material.dart';
import 'package:intern_task/controllers/market_controller.dart';
import 'package:intern_task/enums/sorting_enums.dart';
import 'package:intern_task/models/fruit_info_model.dart';
import 'package:intern_task/utils/dimensions.dart';
import 'package:intern_task/utils/util.dart';
import 'package:intern_task/views/enquiry_details_view.dart';
import 'package:intern_task/widgets/fruit_seller_widget.dart';
import 'package:provider/provider.dart';

class MarketView extends StatefulWidget {
  MarketView({Key? key}) : super(key: key);

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  final TextEditingController _textEditingController = TextEditingController();
  late MarketController mc;
  @override
  void initState() {
    super.initState();
    mc = Provider.of<MarketController>(context, listen: false);
    mc.readJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buy",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        shadowColor: Colors.transparent,
      ),
      body: Consumer<MarketController>(
        builder: (context, data, child) {
          return SingleChildScrollView(
            child: Container(
              height: getSize(context).height,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.all(2),
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: hexToColor("dddddd"),
                                  width: 1.0,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: hexToColor("dddddd"),
                                  width: 1.0,
                                ),
                              ),
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            onChanged: (val) {
                              mc.searchingFruit(val);
                            },
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 200,
                                      padding: EdgeInsets.all(30),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  Text("Name"),
                                                  Spacer(),
                                                  IconButton(
                                                    onPressed: () {
                                                      mc.sortFruitList(
                                                        true,
                                                        true,
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Icons.arrow_upward,
                                                      color: data.currentSort !=
                                                              SortingWays
                                                                  .ASCNAME
                                                          ? Colors.black
                                                          : Colors.green,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      mc.sortFruitList(
                                                        false,
                                                        true,
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Icons.arrow_downward,
                                                      color: data.currentSort !=
                                                              SortingWays
                                                                  .DESCNAME
                                                          ? Colors.black
                                                          : Colors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.black,
                                              height: 1,
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              child: Row(
                                                children: [
                                                  Text("Price"),
                                                  Spacer(),
                                                  IconButton(
                                                    onPressed: () {
                                                      mc.sortFruitList(
                                                        true,
                                                        false,
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Icons.arrow_upward,
                                                      color: data.currentSort !=
                                                              SortingWays
                                                                  .ASCPRICE
                                                          ? Colors.black
                                                          : Colors.green,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      mc.sortFruitList(
                                                        false,
                                                        false,
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Icons.arrow_downward,
                                                      color: data.currentSort !=
                                                              SortingWays
                                                                  .DESCPRICE
                                                          ? Colors.black
                                                          : Colors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.sort,
                                color: Colors.black,
                              ),
                            ),
                            Text("Sort")
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: data.fruitNames.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          width: 80,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/image ${index + 1}.png'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  data.fruitNames[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  data.fruitInfo.length == 0
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : data.searchTerm.length != 0
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: data.searchFruits.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  FruitInfo currentInfo =
                                      data.searchFruits[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EnquiryDetails(
                                            fruitInfo: currentInfo,
                                          ),
                                        ),
                                      );
                                    },
                                    child: FruitSellerWidget(
                                      fruitInfo: currentInfo,
                                    ),
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: data.fruitInfo.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  FruitInfo currentInfo = data.fruitInfo[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EnquiryDetails(
                                              fruitInfo: currentInfo),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: FruitSellerWidget(
                                        fruitInfo: currentInfo,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
