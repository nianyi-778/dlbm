import 'package:dlbm/components/NetworkImageWithPlaceholder.dart';
import 'package:dlbm/utils/utils.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class ShoppingItem extends StatefulWidget {
  final String title;
  final String pict_url;
  final int volume;

  const ShoppingItem(
      {super.key,
      required this.title,
      required this.pict_url,
      required this.volume});

  @override
  _HomePageShoppingState createState() =>
      _HomePageShoppingState(volume: volume, title: title, pict_url: pict_url);
}

class _HomePageShoppingState extends State<ShoppingItem> {
  final String title;
  final String pict_url;
  final int volume;

  _HomePageShoppingState(
      {required this.title, required this.pict_url, required this.volume});

  void _launchURL() async {
    // final Uri launch = Uri.parse('taobao://');
    // bool isInstall = await canLaunchUrl(launch);
    // if (isInstall) {
    //   ToastCenter('正在跳转，请稍等...');
    //   await launchUrl(launch);
    // } else {
    //   ToastCenter('未安装,请先下载');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: NetworkImageWithSkeleton(
                            imageUrl: 'https:$pict_url',
                          ),
                        )),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(250, 100, 25, 1),
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: const Text(
                              '券 20元',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(250, 100, 25, 1),
                              ),
                            )),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(250, 100, 25, 1),
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: const Text(
                              '包邮',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(250, 100, 25, 1),
                              ),
                            ))
                      ],
                    ),
                    const Text(
                      '￥69.90',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 10,
                          color: Color.fromRGBO(167, 160, 160, 1)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: '券后',
                      style: TextStyle(
                          height: 1.0,
                          fontSize: 10,
                          color: Color.fromRGBO(250, 100, 25, 1)),
                    ),
                    TextSpan(
                      text: '￥',
                      style: TextStyle(
                          height: 1.0,
                          fontSize: 10,
                          color: Color.fromRGBO(250, 100, 25, 1)),
                    ),
                    TextSpan(
                      text: '49',
                      style: TextStyle(
                          height: 1.0,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(250, 100, 25, 1)),
                    ),
                    TextSpan(
                      text: '.90',
                      style: TextStyle(
                          height: 1.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromRGBO(250, 100, 25, 1)),
                    ),
                  ],
                ),
              ),
              Text(
                '月销量： $volume',
                style: const TextStyle(
                    fontSize: 10, color: Color.fromRGBO(167, 160, 160, 1)),
              )
            ],
          )
        ],
      ),
    );
  }
}
