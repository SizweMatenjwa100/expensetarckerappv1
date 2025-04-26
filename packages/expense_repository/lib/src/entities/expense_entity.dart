
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../expense_repository.dart';


class ExpenseEntity {
  String expenseID;
  Category category;
  DateTime date;
  int amount;

  ExpenseEntity(
      {required this.expenseID, required this.category, required this.date, required this.amount});


  Map<String, Object?> toDocument() {
    return {
      'expenseID': expenseID,
      'Category':  category.toEntity().toDocument(),
      'DateTime': date,
      ' amount': amount,
    };
  }

  static ExpenseEntity fromDocument(Map<String, dynamic> doc) {
    return ExpenseEntity(
      expenseID: doc['expenseID'],
      category: Category.fromEntity(CategoryEntity.fromDocument(doc['category'])),
      date: (doc['date'] as Timestamp).toDate(),
      amount: doc['amount'],

    );
  }
}
