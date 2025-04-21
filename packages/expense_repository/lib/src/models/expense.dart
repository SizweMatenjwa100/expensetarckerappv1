import 'package:expense_repository/expense_repository.dart';
import '../entities/expense_entity.dart';
class Expense{
  String expenseID;
  Category category;
  DateTime date;
  int amount;
  Expense({required this.expenseID,required this.category, required this.date, required this.amount});
}
ExpenseEntity toEntity() {
  return ExpenseEntity(
    expenseID: expenseID,
    Category:  Category ,
    DateTime:  DateTime,
    amount: amount,

  );
}

static Expense fromEntity(ExpenseEntity entity) {
return Expense(
expenseID: entity.expenseID,
Category:  entity.Category ,
DateTime:  entity.DateTime,
amount: entity.amount,
   );
  }
}
