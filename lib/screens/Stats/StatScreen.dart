import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Statscreen extends StatelessWidget {
  const Statscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          children: [
            Text("Transactions",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,

              child: BarChart(

              ),
            ),
          ],

        ),
      ),
    );
  }
}
