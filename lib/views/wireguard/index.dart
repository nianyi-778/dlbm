import 'dart:async';

import 'package:dlbm/views/wireguard/components/CountdownTimer.dart';
import 'package:dlbm/views/wireguard/components/Waterrepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icmp_ping/flutter_icmp_ping.dart';
import 'package:wireguard_flutter/wireguard_flutter.dart';
import 'package:flutter_vpn/flutter_vpn.dart';

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
  late DateTime? connectedDate;
  Map<VpnStage, String> vpnStageMap = {
    VpnStage.connecting: "正在连接", // 1
    VpnStage.connected: "已连接", // 1
    VpnStage.disconnecting: "正在断开连接",
    VpnStage.disconnected: "已断开连接",
    VpnStage.waitingConnection: "等待用户交互",
    VpnStage.authenticating: "向服务器进行身份验证",
    VpnStage.reconnect: "重新连接",
    VpnStage.noConnection: "尚未建立任何连接",
    VpnStage.preparing: "准备连接", // 1
    VpnStage.denied: "连接已被系统拒绝",
    VpnStage.exiting: "退出界面",
  };
  bool isInitialized = false;

  String getVpnStageText() {
    String text = vpnStageMap[vpnState] ?? "未知状态"; // 获取对应的文案，如果找不到对应的文案，则使用默认值
    return text;
  }

  @override
  void initState() {
    super.initState();

    wireguard.vpnStageSnapshot.listen((event) async {
      print("vpn 状态 $event");
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
    if (isInitialized == false) {
      try {
        await wireguard.initialize(interfaceName: name);
        isInitialized = true;
        debugPrint("initialize success");
      } catch (error, stack) {
        isInitialized = false;
        debugPrint("failed to initialize: $error\n$stack");
      }
    }
  }

  void googlePing() async {
    try {
      final ping = Ping(
        'google.com',
        count: 3,
        timeout: 1,
        interval: 1,
        ipv6: false,
        ttl: 40,
      );
      ping.stream.listen((event) {
        print(event);
      });
    } catch (e) {
      print('error $e');
    }
  }

  void startVpn() async {
    bool newState = await FlutterVpn.prepared;
    if (newState == false) {
      newState = await FlutterVpn.prepare();
      // 用户主动拒绝
      if (newState == false) {
        // switch 状态要改false
        setState(() {
          _isSwitched = false;
        });
        return;
      }
    }

    try {
      await initialize();
      await wireguard.startVpn(
        serverAddress: '188.114.96.7:7152',
        wgQuickConfig: conf,
        providerBundleIdentifier: 'com.dlbm.wireguardvpn.WGExtension',
      );
      googlePing();
      setState(() {
        connectedDate = DateTime.now();
      });
    } catch (error, stack) {
      debugPrint("failed to start $error\n$stack");
    }
  }

  void disconnect() async {
    try {
      await wireguard.stopVpn();
      connectedDate = null;
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                  width: 330,
                  height: 330,
                  child: WaterRipple(
                    color: Colors.green,
                    duration: Duration(milliseconds: 2000),
                  )),
              const SizedBox(height: 20),
              Transform.scale(
                  scale: 2.0,
                  child: Switch(
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
                    activeColor: Color.fromARGB(255, 47, 161, 53),
                    inactiveThumbColor: Colors.black45,
                    inactiveTrackColor: Colors.black26,
                    trackOutlineColor:
                        MaterialStateProperty.all(Colors.transparent),
                  )),
              const SizedBox(height: 20),
              Text(
                getVpnStageText(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red),
              ),
              const SizedBox(height: 20),
              _isSwitched
                  ? CountdownTimer(startTime: connectedDate as DateTime)
                  : Container(),
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
