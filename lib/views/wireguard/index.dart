import 'dart:async';

import 'package:dlbm/utils/utils.dart';
import 'package:dlbm/views/wireguard/components/WaterRipple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wireguard_flutter/wireguard_flutter.dart';

class MyWireguard extends StatefulWidget {
  const MyWireguard({super.key});

  @override
  State<MyWireguard> createState() => _MyAppState();
}

class _MyAppState extends State<MyWireguard> {
  final wireguard = WireGuardFlutter.instance;

  late String name;
  bool _isSwitched = false;
  VpnStage vpnState = VpnStage.noConnection;

  Map<VpnStage, String> vpnStageMap = {
    VpnStage.connecting: "接口正在连接",
    VpnStage.connected: "接口已连接",
    VpnStage.disconnecting: "接口正在断开连接",
    VpnStage.disconnected: "接口已断开连接",
    VpnStage.waitingConnection: "等待用户交互",
    VpnStage.authenticating: "向服务器进行身份验证",
    VpnStage.reconnect: "重新连接接口",
    VpnStage.noConnection: "尚未建立任何连接",
    VpnStage.preparing: "准备连接",
    VpnStage.denied: "连接已被系统拒绝",
    VpnStage.exiting: "退出界面",
  };

  String getVpnStageText() {
    String text = vpnStageMap[vpnState] ?? "未知状态"; // 获取对应的文案，如果找不到对应的文案，则使用默认值
    return text;
  }

  @override
  void initState() {
    super.initState();
    wireguard.vpnStageSnapshot.listen((event) async {
      debugPrint("status changed $event");
      if (mounted) {
        setState(() {
          vpnState = event;
        });
      }
    });
    name = 'dlbm_vpn';
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

  // Future<void> getStatus() async {
  //   debugPrint("getting stage");
  //   final stage = await wireguard.stage();
  //   debugPrint("stage: $stage");

  //   if (mounted) {
  //     ToastCenter('stage: $stage');
  //   }
  // }

  void startVpn() async {
    try {
      await initialize();
      // await wireguard.startVpn(
      //   serverAddress: '188.114.96.7:7152',
      //   wgQuickConfig: conf,
      //   providerBundleIdentifier: 'com.dlbm.wireguardvpn.WGExtension',
      // );
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
              const SizedBox(height: 200, width: 200, child: WaterRipple()),
              const SizedBox(height: 20),
              Transform.scale(
                  scale: 2.0, // 设置缩放比例，可以根据需要进行调整
                  child: Switch(
                    value: _isSwitched,
                    onChanged: (value) {
                      if (value == true) {
                        startVpn();
                      } else {
                        disconnect();
                      }
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                    activeColor: CupertinoColors.activeBlue,
                    inactiveThumbColor: Colors.black45,
                    inactiveTrackColor: Colors.black26,
                    trackOutlineColor:
                        MaterialStateProperty.all(Colors.transparent),
                  )),
              const SizedBox(height: 20),
              Text(getVpnStageText()),
              const SizedBox(height: 220),
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
