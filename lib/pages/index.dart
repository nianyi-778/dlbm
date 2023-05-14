import 'package:flutter/material.dart';
import 'package:dlbm/components/CustomBottomNavigationBar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  onTap(index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(onTap: onTap),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is the detail page.',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
