import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

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

  @override
  void initState(){
    dateController.text=DateFormat('dd/MM/yy').format(DateTime.now());
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Add Expense", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
              SizedBox(height: 16,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.70,
                child: TextFormField(
                  controller: expenseController,
                  textAlignVertical: TextAlignVertical.center,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor:Colors.white,
                    label: Text('R', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,fontSize: 22)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none

                    )
                  ),
                ),
              ),
              SizedBox(height: 32,),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                controller: categoryController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor:Colors.white,
                    hintText: "Categories",hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    prefixIcon: Icon(FontAwesomeIcons.list,size: 16,color: Colors.grey,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none

                    )
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate= await showDatePicker(
                      context: context,
                      initialDate: selectDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days:365),
                      ),
                  );
                  if(newDate!= null){
                    dateController.text=DateFormat('dd/MM/yy').format(newDate);
                    selectDate=newDate;
                  }
                },
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    filled: true,
                    fillColor:Colors.white,
                    hintText: "Date",hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    prefixIcon: Icon(FontAwesomeIcons.clock,size: 16,color: Colors.grey,),
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

                child: TextButton(onPressed: (){}, child: Text('Save', style: TextStyle(fontSize: 22, color:Colors.white),
                ), style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ) ,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
