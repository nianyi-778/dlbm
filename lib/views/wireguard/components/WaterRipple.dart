import 'package:dlbm/views/wireguard/components/WaterRipplePainter.dart';
import 'package:flutter/material.dart';

class WaterRipple extends StatefulWidget {
  final int count;
  final Color color;

  const WaterRipple(
      {Key? key, this.count = 3, this.color = const Color(0xFF0080ff)})
      : super(key: key);

  @override
  _WaterRippleState createState() => _WaterRippleState();
}

class _WaterRippleState extends State<WaterRipple>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: WaterRipplePainter(_controller.value,
              count: widget.count, color: widget.color),
        );
      },
    );
  }
}
