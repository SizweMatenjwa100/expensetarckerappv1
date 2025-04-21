import 'package:expensetarckerappv1/screens/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:expense_repository/src/models/category.dart';
import 'package:uuid/uuid.dart';

getCategoryCreation(BuildContext context){
  showDialog(context: (context),
    builder: (ctx){
      late bool isExpended=false;
      TextEditingController categoryColorController=TextEditingController();
      TextEditingController categoryNameController=TextEditingController();
      TextEditingController categoryIconController=TextEditingController();
      bool isLoading=false;
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


      return BlocProvider.value(
        value: context.read<CreateCategoryBloc>(),
        child: StatefulBuilder(
          builder:(ctx,setState) {
            return  BlocListener<CreateCategoryBloc, CreateCategoryState>(
              listener: (context, state) {
                if (state is CreateCategorySuccess) {
                  Navigator.pop(ctx);
                }
                else if (state is CreateCategoryLoading) {
                  setState(() {
                    isLoading = true;
                  });
                }
              },
              child: AlertDialog(

                content: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Create a Category", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                      ),
                      SizedBox(height: 12,),

                      TextFormField(
                        controller: categoryNameController,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Name",
                            hintStyle: TextStyle(color: Colors.grey,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    12),
                                borderSide: BorderSide.none

                            )
                        ),
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: categoryIconController,
                        onTap: () {
                          setState(() {
                            isExpended = !isExpended;
                          });
                        },
                        readOnly: true,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                                CupertinoIcons.chevron_down,
                                size: 16),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Icon",
                            hintStyle: TextStyle(color: Colors.grey,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                                borderRadius: isExpended ?
                                BorderRadius.vertical(
                                    top: Radius.circular(16)
                                )
                                    : BorderRadius.circular(12),
                                borderSide: BorderSide.none

                            )
                        ),
                      ),
                      isExpended ?
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 200,

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(16)
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                              ),
                              itemCount: myCategoriesIcon.length,
                              itemBuilder: (context, int i) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      iconSelected = myCategoriesIcon[i];
                                    });
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(

                                        border: Border.all(
                                            width: 2,
                                            color: iconSelected ==
                                                myCategoriesIcon[i] ? Colors
                                                .green : Colors.grey
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/${myCategoriesIcon[i]}.png'
                                          ),
                                        )
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                      )
                          : Container(),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: categoryColorController,

                        onTap: () {
                          showDialog(context: context, builder: (ctx2) {
                            return AlertDialog(

                              content: Column(

                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  ColorPicker(
                                    pickerColor: Colors.blue,
                                    onColorChanged: (value) {
                                      setState(() {
                                        categoryColor = value;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx2);
                                      },
                                      child: Text("Save Color"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          );
                        },
                        readOnly: true,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: categoryColor ?? Colors.white,
                            hintText: "Color",
                            hintStyle: TextStyle(color: categoryColor == null
                                ? categoryColor
                                : Colors.white,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none
                            )
                        ),
                      ),
                      SizedBox(height: 16,),
                      SizedBox(
                        width: double.infinity,
                        height: kToolbarHeight,

                        child: isLoading == true
                            ?
                        Center(child: CircularProgressIndicator(),
                        )
                            :
                        TextButton(onPressed: () {
                          Category category = Category.empty;
                          category.categoryID = const Uuid().v1();
                          category.name = categoryNameController.text;
                          category.icon = iconSelected;
                          category.color = categoryColor.toString();
                          context.read<CreateCategoryBloc>().add(
                              CreateCategory(category));
                        },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                              )
                          ),
                          child: Text('Save',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      );
    },
  );
}
