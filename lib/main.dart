import 'package:expensetarckerappv1/app_view.dart';
import 'package:expensetarckerappv1/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart' show Bloc;

import 'SimpleBlocObserver.dart';
import 'package:expense_repository/expense_repository.dart'; // ADD THIS
import 'package:expensetarckerappv1/screens/home/blocs/get_expenses_bloc.dart'; // ADD THIS

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetExpensesBloc(FirebaseExpenseRepo())..add(GetExpenses()),  // PROVIDE BLOC HERE
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.grey.shade100,
            primary: Color(0xFF00B2E7),
            secondary: Color(0xFFE064F7),
            tertiary: Color(0xFF8D6C),
            outline: Colors.grey,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
