import 'package:dlbm/utils/request.dart';
import 'package:flutter/material.dart';
import 'package:dlbm/views/home/components/ShoppingItem.dart';
import 'package:dlbm/views/home/components/SkeletonScreen.dart';
// SkeletonShopping
import 'package:flutter/material.dart';

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
}

class Shopping extends StatefulWidget {
  const Shopping({Key? key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  List<ShoppingItemType> shoppingList = [];
  bool _isLoading = true;
  AxiosClient client = AxiosClient();
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    loadJsonData();
    setState(() {
      _isLoading = false;
    });
    refreshKey.currentState?.show();
  }

  Future<void> _refreshData() async {
    await loadJsonData();
  }

  Future<void> loadJsonData() async {
    Map<String, dynamic> response = await client.request(
      method: 'get',
      url:
          'https://dt-easyv-test.oss-cn-hangzhou.aliyuncs.com/tmp/taobao_mock.json',
      queryParameters: {'param1': 'value1', 'param2': 'value2'},
    );

    List<ShoppingItemType> parseShoppingItemList(jsonMap) {
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
      shoppingList = parseShoppingItemList(response);
    });
    print('shoppingList');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //去除状态栏下的一条阴影
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ), // 隐
      body: _isLoading
          ? ListView(children: [
              Stack(children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  margin: const EdgeInsets.only(top: 15, bottom: 5),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return const SkeletonShopping();
                    },
                    itemCount: 7,
                  ),
                ),
              ])
            ])
          : RefreshIndicator(
              key: refreshKey,
              onRefresh: _refreshData, // 绑定刷新回调方法
              child: ListView(children: [
                Stack(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    margin: const EdgeInsets.only(top: 15, bottom: 5),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        String title = shoppingList[index].itemBasicInfo.title;
                        int volume = shoppingList[index].itemBasicInfo.volume;
                        String pict_url =
                            shoppingList[index].itemBasicInfo.pictUrl;
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            color: Colors.transparent,
                            child: ShoppingItem(
                                title: title,
                                volume: volume,
                                pict_url: pict_url),
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