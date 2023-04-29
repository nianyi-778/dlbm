import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CupertinoSwiper extends StatefulWidget {
  final List<String> images;

  const CupertinoSwiper({super.key, required this.images});

  @override
  _CupertinoSwiperState createState() => _CupertinoSwiperState();
}

class _CupertinoSwiperState extends State<CupertinoSwiper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Swiper(
            itemCount: widget.images.length,
            viewportFraction: 0.8,
            scale: 0.9,
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    widget.images[index],
                    fit: BoxFit.fill,
                  ));
            },
            autoplay: true,
          ),
        ),
      ],
    );
  }
}
