import 'package:dlbm/components/NetworkImageWithPlaceholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

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
                child: NetworkImageWithSkeleton(
                  imageUrl: widget.images[index],
                ),
                // child: Image.network(
                //   widget.images[index],
                //   fit: BoxFit.fill,
                // )
              );
              // NetworkImageWithSkeleton(
              //   imageUrl: widget.images[index],
              //   width: 200,
              //   height: 200,
              // ));
            },
            autoplay: true,
            pagination: new SwiperPagination(),
          ),
        ),
      ],
    );
  }
}
