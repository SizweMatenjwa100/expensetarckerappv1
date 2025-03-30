import 'dart:math';

import 'package:expensetarckerappv1/screens/home/views/mainscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      /*appBar: AppBar(
        elevation: 0,
      ),*/
      bottomNavigationBar: ClipRRect(
      borderRadius:BorderRadius.vertical(
        top:Radius.circular(30)
      ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
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
              label: 'Stats',

            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
          onPressed: (){},
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors:[
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
              transform:  GradientRotation(pi/4),

            ),

          ),
          child: Icon(CupertinoIcons.add, color:Colors.white),
        ),
      ),
      body: Mainscreen(),
    );
  }
}
