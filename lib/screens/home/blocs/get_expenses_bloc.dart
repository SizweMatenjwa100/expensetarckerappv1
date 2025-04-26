import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

import 'get_expenses_bloc.dart';
import 'get_expenses_bloc.dart' as expenseRepository;

part 'get_expenses_event.dart';
part 'get_expenses_state.dart';

class GetExpensesBloc extends Bloc<GetExpensesEvent, GetExpensesState> {
final ExpenseRepository expenseRepository;

GetExpensesBloc(this.expenseRepository) : super(GetExpensesInitial()) {
on<GetExpenses>((event, emit) async {

   emit(GetExpensesLoading());
try {
  List<Expense> expenses=await expenseRepository.getExpense();

emit(GetExpensesSuccess(expenses));
} catch (e) {
emit(GetExpensesFailure());
}
});
}
}
