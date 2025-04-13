import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:expense_repository/expense_repository.dart' as repo;
part 'create_category_event.dart';
part 'create_category_state.dart';

class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final repo.ExpenseRepository expenseRepository;


  CreateCategoryBloc(this.expenseRepository) : super(CreateCategoryInitial()) {
    on<CreateCategory>((event, emit)  async {
      try{
        await expenseRepository.createCategory(event.category);
        emit((CreateCategorySuccess()));

      }catch(e){
        emit((CreateCategoryFailure()));
      }
    });
  }
}

