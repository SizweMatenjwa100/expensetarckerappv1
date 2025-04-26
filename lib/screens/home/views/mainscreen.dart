import 'dart:math';
import 'package:expense_repository/expense_repository.dart';
import 'package:expensetarckerappv1/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatelessWidget {
  final List<Expense> expenses;
  const Mainscreen(this.expenses,{super.key});

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
                            fontSize: 16,
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
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color:Colors.grey.shade300,
                    offset: Offset(5, 5),

                  ),
                ],
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.tertiary,
                ],
                  transform:  GradientRotation(pi /4),
                ),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Balance", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
                  SizedBox(height: 12,),
                  Text("\R 4800.00",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              color: Colors.white30,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Icon(CupertinoIcons.arrow_down,size: 12,color: Colors.greenAccent,)
                          ) ,

                        ),
                        SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Income",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white)),
                            Text("\R 2.500.00",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(width: 80),
                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: const BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Icon(CupertinoIcons.arrow_up,size: 12,color: Colors.red,)
                              ) ,

                            ),
                            SizedBox(width: 8,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Expenses",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white)),
                                Text("\R 900",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                              ],
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),

                ],
              ),

            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transactions", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Theme.of(context).colorScheme.onSurface),
                ),

                GestureDetector(
                  onTap: (){},
                  child:
                Text
                  ("View All", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Theme.of(context).colorScheme.outline)
                  ,),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                  itemBuilder: (context, int i){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(12),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color:transactionData[i]['color'],
                                        shape: BoxShape.circle
                                    
                                      ),
                                    
                                    ),
                                      transactionData[i]['icon'],
                                    ],
                                  ),
                                  SizedBox(width: 12,),
                                  Text(transactionData[i]['name'],style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color:Theme.of(context).colorScheme.onSurface),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(transactionData[i]['totalAmount'],style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color:Theme.of(context).colorScheme.onSurface),
                                  ),
                                  Text("Today",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color:Theme.of(context).colorScheme.outline),
                                  ),
                                ],
                              ) ,
                        ],
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
