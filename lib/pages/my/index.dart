import 'package:flutter/material.dart';
import 'package:dlbm/pages/my/components/Header.dart';
import 'package:dlbm/pages/my/components/CardList.dart';

class MyApp extends StatefulWidget {
  // const HomePage({super.key, required this.title});
  const MyApp({super.key});

  // final String title;

  @override
  State<MyApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    print('mount...');
  }

  @override
  void dispose() {
    print('unmount');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
          margin: const EdgeInsets.fromLTRB(15, 45, 15, 15),
          width: double.infinity,
          color: Colors.transparent,
          child: const SafeArea(
            child: Column(
              children: [MyHeader(), CardList()],
            ),
          ),
        ));
  }
}



/**
 
 Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 45, 15, 15),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: const SafeArea(
                    child: Column(
                      children: [MyHeader(), CardList()],
                    ),
                  ),
                ),
              ],
            ))
          ],
        )

 * */ 