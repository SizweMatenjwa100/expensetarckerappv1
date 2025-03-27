import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        items: [


          BottomNavigationBarItem(
            backgroundColor: Colors.white,
              icon: Icon(CupertinoIcons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
              icon: Icon(CupertinoIcons.graph_circle),
            label: 'Stats'
          ),
        ],
      ),
    );
  }
}
