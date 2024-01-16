import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dlbm/pages/home/components/ShoppingItem.dart';
import 'package:flutter/services.dart';

class ItemBasicInfo {
  String title;
  int volume;
  String pictUrl;

  ItemBasicInfo(this.title, this.volume, this.pictUrl);

  factory ItemBasicInfo.fromJson(Map<String, dynamic> json) {
    return ItemBasicInfo(
      json['title'] as String,
      json['volume'] as int,
      json['pict_url'] as String,
    );
  }

  @override
  String toString() {
    return 'ItemBasicInfo(title: $title, volume: $volume, pictUrl: $pictUrl)';
  }
}

class ShoppingItemType {
  String itemId;
  ItemBasicInfo itemBasicInfo;

  ShoppingItemType(this.itemId, this.itemBasicInfo);

  factory ShoppingItemType.fromJson(Map<String, dynamic> json) {
    return ShoppingItemType(
      json['item_id'] as String,
      ItemBasicInfo.fromJson(json['item_basic_info'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return 'ShoppingItemType(itemId: $itemId, itemBasicInfo: $itemBasicInfo)';
  }
}

class Shopping extends StatefulWidget {
  const Shopping({Key? key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  List<ShoppingItemType> shoppingList = [];
  @override
  void initState() {
    super.initState();
    print("shopping..");
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/taobao_mock.json');

    List<ShoppingItemType> parseShoppingItemList(String jsonString) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      assert(jsonMap.containsKey('data'));
      assert(jsonMap['data'].containsKey('result_list'));
      assert(jsonMap['data']['result_list'].containsKey('map_data'));

      List<ShoppingItemType?> jsonList = List<Map<String, dynamic>>.from(
              jsonMap['data']['result_list']['map_data'])
          .map((json) {
        try {
          return ShoppingItemType.fromJson(json as Map<String, dynamic>);
        } catch (e) {
          print('Failed to convert JSON object: $json');
        }
        return null;
      }).toList();

      return jsonList.whereType<ShoppingItemType>().toList();
    }

    setState(() {
      shoppingList = parseShoppingItemList(jsonString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0, //去除状态栏下的一条阴影
        title: const Text(
          '优惠券',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(children: [
          Stack(children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              margin: const EdgeInsets.only(top: 15, bottom: 5),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  String title = shoppingList[index].itemBasicInfo.title;
                  int volume = shoppingList[index].itemBasicInfo.volume;
                  String pict_url = shoppingList[index].itemBasicInfo.pictUrl;
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      color: Colors.transparent,
                      child: ShoppingItem(
                          title: title, volume: volume, pict_url: pict_url),
                    ),
                  );
                },
                itemCount: shoppingList.length,
              ),
            ),
          ])
        ]),
      ),
    );
  }
}
