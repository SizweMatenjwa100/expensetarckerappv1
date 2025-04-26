import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'expense_repo.dart';
import 'entities/entities.dart';
import 'models/category.dart';


class FirebaseExpenseRepo implements ExpenseRepository {
  final categoryCollection = FirebaseFirestore.instance.collection('categories');
  final expsenseCollection = FirebaseFirestore.instance.collection('expenses');

  @override
  Future<void> createCategory(Category category) async {
    try {
      await categoryCollection
          .doc(category.categoryID)
          .set(category.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  @override
  Future<List<Category>> getCategory() async {
    try {
      return await categoryCollection
          .get()
          .then((value) => value.docs.map((e) =>
          Category.fromEntity(CategoryEntity.fromDocument(e.data()))
      ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  @override
  Future<void> createExpense(Expense expense) async {
    try {
      await expsenseCollection
          .doc(expense.expenseID)
          .set(expense.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  Future<List<Expense>> getExpense() async {
    try {
      return await expsenseCollection
          .get()
          .then((value) => value.docs.map((e) =>
          Expense.fromEntity(ExpenseEntity.fromDocument(e.data()))
      ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

}




