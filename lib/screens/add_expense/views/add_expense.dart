import 'package:expense_repository/expense_repository.dart';
import 'package:expensetarckerappv1/screens/add_expense/views/category_creation.dart';
import 'package:expensetarckerappv1/screens/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:expensetarckerappv1/screens/blocs/get_category_bloc/get_category_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController= TextEditingController();
  TextEditingController categoryController= TextEditingController();
  TextEditingController dateController= TextEditingController();
  DateTime selectDate=DateTime.now();
  List<String> myCategoriesIcon=[
    'burger',
    'entertainment',
    'home',
    'shopping',
    'tech',
    'travel'


  ];
late String iconSelected='';
Color categoryColor = Colors.blue;
late Expense expense;
bool isLoading=false;


  @override
  void initState(){

    dateController.text=DateFormat('dd/MM/yy').format(DateTime.now());
    expense=Expense.empty;
    expense.expenseID=Uuid().v1();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateExpenseBloc,CreateExpenseState>(
  listener: (context, state) {
   if(state is CreateExpenseSuccess){
     Navigator.pop(context);
   }else if(state is CreateExpenseLoading){
setState(() {
  isLoading=true;
});
   }
  },
  child: GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: BlocBuilder<GetCategoryBloc, GetCategoryState>(
  builder: (context, state) {
    if(state is GetCategorySuccess) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Add Expense",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
            SizedBox(height: 16,),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.70,
              child: TextFormField(
                controller: expenseController,
                textAlignVertical: TextAlignVertical.center,

                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    label: Text('R', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 22)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none

                    )
                ),
              ),
            ),
            SizedBox(height: 32,),
            TextFormField(
              readOnly: true,
              onTap: () {

              },
              textAlignVertical: TextAlignVertical.center,
              controller: categoryController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: expense.category==Category.empty ? Colors.white :Color(expense.category.color),
                  hintText: "Categories",
                  hintStyle: TextStyle(color: Colors.grey,
                      fontWeight: FontWeight.bold),
                  prefixIcon: expense.category==Category.empty ? Icon(
                    FontAwesomeIcons.list, size: 16, color: Colors.grey,)
                  :
                  Image.asset(
                    'assets/${expense.category.icon}.png',
                    scale: 11,
                  ),

                  suffixIcon: IconButton(icon: Icon(
                    FontAwesomeIcons.plus, size: 16, color: Colors.grey,),
                    onPressed: () async {
                      final newCategory = await getCategoryCreation(context);
                      if (newCategory != null && context.mounted) {
                        context.read<GetCategoryBloc>().add(GetCategories());
                      }
                      else {
                        debugPrint('User cancelled category creation or no category was returned.');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No category created",)));
                      }

                    },

                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12)
                      ),
                      borderSide: BorderSide.none

                  )
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
              ),
              child:ListView.builder(
                        itemCount: state.categories.length,
                        itemBuilder: (context, int i) {
                          return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  onTap: (){
                                    setState(() {
                                      expense.category=state.categories[i];
                                      categoryController.text=expense.category.name;
                                    });
                                  },
                                  leading: Image.asset(
                                    'assets/${state.categories[i].icon}.png',
                                    scale: 2,
                                  ),
                                  title: Text(state.categories[i].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),),
                                  tileColor: Color(state.categories[i].color),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8.0)
                                  ),
                                ),
                              )
                          );
                        }

              )

            ),
            SizedBox(height: 16,),

            TextFormField(
              controller: dateController,
              readOnly: true,
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: expense.date,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365),
                  ),
                );
                if (newDate != null) {
                  dateController.text = DateFormat('dd/MM/yy').format(newDate);
                  //selectDate = newDate;
                  expense.date=newDate;

                }
              },
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Date",
                  hintStyle: TextStyle(color: Colors.grey,
                      fontWeight: FontWeight.bold),
                  prefixIcon: Icon(
                    FontAwesomeIcons.clock, size: 16, color: Colors.grey,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none

                  )
              ),
            ),
            SizedBox(height: 22,),
            SizedBox(
              width: double.infinity,
              height: kToolbarHeight,

              child: isLoading?
                  Center(
                child: CircularProgressIndicator(),
              )
              :
              TextButton(onPressed: () {
                setState(() {
                  expense.amount=int.parse(expenseController.text);
                });
               context.read<CreateExpenseBloc>().add(CreateExpense(expense));

              },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                ), child: Text('Save', style: TextStyle(
                    fontSize: 22, color: Colors.white),
                ),
              )

            ),
          ],
        ),
      );
    }else{
      return const
      Center(
        child: CircularProgressIndicator(),
      );
    }
  },
),
      ),
    ),
);
  }
}
