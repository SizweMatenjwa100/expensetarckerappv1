import 'package:expense_repository/expense_repository.dart';
import 'package:expensetarckerappv1/screens/home/blocs/get_expenses_bloc.dart';
import 'package:expensetarckerappv1/screens/home/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker ',
      home: const HomeScreen(),
    );
  }
}
