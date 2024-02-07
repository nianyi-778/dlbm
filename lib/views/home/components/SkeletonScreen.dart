import 'package:flutter/material.dart';

class SkeletonAvatar extends StatelessWidget {
  final double width;
  final double height;

  SkeletonAvatar({this.width = 40, this.height = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300], // 骨架屏颜色
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }
}

class SkeletonLine extends StatelessWidget {
  final double width;
  final double height;

  SkeletonLine({this.height = 12, this.width = 12});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[300], // 骨架屏颜色
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class SkeletonShopping extends StatelessWidget {
  const SkeletonShopping({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SkeletonAvatar(
                    width: 80,
                    height: 80,
                  ),
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
                  SkeletonLine(
                    width: 80,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  SkeletonLine(
                    width: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SkeletonLine(
              width: 60,
            ),
            SkeletonLine(
              width: 40,
            ),
          ],
        )
      ],
    );
  }
}
