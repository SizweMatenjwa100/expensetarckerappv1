
import '../models/models.dart';


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
      Category: doc['category'],
      DateTime: doc['date'],
      amount: doc['amount'],

    );
  }
}
