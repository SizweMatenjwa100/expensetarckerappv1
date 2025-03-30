import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(

                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children:[
                        Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow.shade700
                        ),
                      ),
                        Icon(Icons.person, color: Theme.of(context).colorScheme.outline,)
                     ],
                    ),
                    SizedBox(width: 8 ,),
                    Column(
                      children: [
                        Text("Welcome!",
                          style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.outline
                        ),
                        ),
                        Text("John Doe",style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.settings))
              ],
            ),
            SizedBox(height: 20,),
            Container(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width /2,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.tertiary,
                ],
                  transform:  GradientRotation(pi /4),
                ),
              ),
              child: Column(
                children: [
                  Text("Total Balance"),
                  Text("\$ 4800.00"),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,

                      ),
                    ],
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
