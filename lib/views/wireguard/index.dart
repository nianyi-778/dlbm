import 'dart:async';

import 'package:dlbm/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wireguard_flutter/wireguard_flutter.dart';

class MyWireguard extends StatefulWidget {
  const MyWireguard({super.key});

  @override
  State<MyWireguard> createState() => _MyAppState();
}

enum VpnStage {
  preparing,
  connecting,
  connected,
  disconnected,
  initial,
}

class _MyAppState extends State<MyWireguard> {
  final wireguard = WireGuardFlutter.instance;

  late String name;
  bool _isSwitched = false;
  VpnStage vpnState = VpnStage.initial;

  Map<VpnStage, String> vpnStatusMap = {
    VpnStage.preparing: '准备连接VPN',
    VpnStage.connecting: '正在连接VPN',
    VpnStage.connected: 'VPN已成功连接',
    VpnStage.disconnected: 'VPN已断开连接',
    VpnStage.initial: '正在初始化...',
  };

  String getStatusDescription(VpnStage status) {
    return vpnStatusMap[status] ?? '未知状态';
  }

  @override
  void initState() {
    super.initState();
    wireguard.vpnStageSnapshot.listen((event) {
      debugPrint("status changed $event");
      if (mounted) {
        setState(() {
          event as VpnStage;
        });
        ToastCenter('status changed: $event');
      }
    });
    name = 'dlbm_vpn';
    // 延迟执行操作
    Future.delayed(Duration(seconds: 2), () {
      initialize();
    });
  }

  void dispose() {
    print('vpn unmount');
    super.dispose();
    disconnect();
  }

  Future<void> initialize() async {
    try {
      await wireguard.initialize(interfaceName: name);
      debugPrint("initialize success");
    } catch (error, stack) {
      debugPrint("failed to initialize: $error\n$stack");
    }
  }

  void startVpn() async {
    try {
      await wireguard.startVpn(
        serverAddress: '188.114.96.7:7152',
        wgQuickConfig: conf,
        providerBundleIdentifier: 'com.dlbm.wireguardvpn.WGExtension',
      );
    } catch (error, stack) {
      debugPrint("failed to start $error\n$stack");
    }
  }

  void disconnect() async {
    try {
      await wireguard.stopVpn();
    } catch (e, str) {
      debugPrint('Failed to disconnect $e\n$str');
    }
  }

  void getStatus() async {
    debugPrint("getting stage");
    final stage = await wireguard.stage();
    debugPrint("stage: $stage");

    if (mounted) {
      ToastCenter('stage: $stage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0, //去除状态栏下的一条阴影
          title: const Text(
            'VPN',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ), //
        body: SafeArea(
            child: Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Transform.scale(
                  scale: 2.0, // 设置缩放比例，可以根据需要进行调整
                  child: CupertinoSwitch(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                      });
                      if (value == true) {
                        startVpn();
                      } else {
                        disconnect();
                      }
                    },
                    activeColor: CupertinoColors.activeBlue,
                    trackColor: Colors.black.withOpacity(.5),
                  )),
              const SizedBox(height: 20),
              Text(getStatusDescription(vpnState))
            ],
          ),
        )));
  }
}

const String conf = '''[Interface]
PrivateKey = SAc+6wOCyBkB/oxDztmHx0K/vAU9ZtiFzO0RwUDOhVo=
Address = 172.16.0.2/32,
DNS = 1.1.1.1
MTU = 1280

[Peer]
PublicKey = bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=
AllowedIPs = 0.0.0.0/0, ::/0
PersistentKeepalive = 0
Endpoint = 188.114.96.7:7152''';
