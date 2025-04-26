import 'dart:math';
import 'package:expense_repository/expense_repository.dart';
import 'package:expensetarckerappv1/screens/Stats/StatScreen.dart';
import 'package:expensetarckerappv1/screens/add_expense/views/add_expense.dart';
import 'package:expensetarckerappv1/screens/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:expensetarckerappv1/screens/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:expensetarckerappv1/screens/blocs/get_category_bloc/get_category_bloc.dart';
import 'package:expensetarckerappv1/screens/home/blocs/get_expenses_bloc.dart';
import 'package:expensetarckerappv1/screens/home/views/mainscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late Color selectedItem = Colors.blue;
  late Color unselectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExpensesBloc, GetExpensesState>(
  builder: (context, state) {
    if(state is GetExpensesSuccess) {
      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 3,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  CupertinoIcons.home,
                  color: index == 0 ? selectedItem : unselectedItem,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  CupertinoIcons.graph_circle,
                  color: index == 1 ? selectedItem : unselectedItem,
                ),
                label: 'Stats',
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) =>
                              CreateCategoryBloc(FirebaseExpenseRepo()),
                        ),
                        BlocProvider(
                          create: (context) =>
                          GetCategoryBloc(FirebaseExpenseRepo())
                            ..add(GetCategories()),
                        ),
                        BlocProvider(
                            create: (context) =>
                                CreateExpenseBloc(FirebaseExpenseRepo())),
                      ],
                      child: AddExpense(),
                    ),
              ),
            );
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Theme
                      .of(context)
                      .colorScheme
                      .primary,
                  Theme
                      .of(context)
                      .colorScheme
                      .secondary,
                  Theme
                      .of(context)
                      .colorScheme
                      .tertiary,
                ],
                transform: GradientRotation(pi / 4),
              ),
            ),
            child: Icon(CupertinoIcons.add, color: Colors.white),
          ),
        ),
        body: index == 0 ? Mainscreen(state.expenses) : Statscreen(),
      );
    }
    else{
      return Scaffold(
        body:Center(
          child: CircularProgressIndicator(),
        )
      );

    }
  },
);
  }
}
