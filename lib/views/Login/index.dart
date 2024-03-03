import 'package:dlbm/views/Login/pwaLogin.dart';
import 'package:dlbm/views/Login/wechatLogin.dart';
import 'package:flutter/material.dart';

enum PageState {
  wechart,
  password,
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LoginPage> {
  List<PageState> _pageStates = [PageState.wechart];

  void _updatePageState(PageState state) {
    setState(() {
      if (_pageStates.contains(state)) {
        _pageStates.remove(state);
      } else {
        _pageStates.add(state);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _pageStates.contains(PageState.wechart)
                    ? WechatLogin(updatePageState: _updatePageState)
                    : null,
                transitionBuilder: (child, animation) {
                  return CupertinoPageTransition(
                    primaryRouteAnimation: animation,
                    child: child,
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _pageStates.contains(PageState.password)
                    ? PwaLoginPage(updatePageState: _updatePageState)
                    : null,
                transitionBuilder: (child, animation) {
                  return CupertinoPageTransition(
                    primaryRouteAnimation: animation,
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CupertinoPageTransition extends StatelessWidget {
  final Animation<double> primaryRouteAnimation;
  final Widget child;

  const CupertinoPageTransition({
    Key? key,
    required this.primaryRouteAnimation,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(primaryRouteAnimation),
      child: child,
    );
  }
}
