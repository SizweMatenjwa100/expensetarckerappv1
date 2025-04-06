import 'dart:ui';

class Category{
  String categoryID;
  String name;
  int totalExpense;
   String icon;
   String Color;

   Category( {
     required this.categoryID,
     required this.name,
     required this.totalExpense,
     required  this.icon,
     required this.Color
   });

   static final empty =Category (
       categoryID: '',
       name: '',
       totalExpense: 0,
       icon: '',
       Color: '',
   );
CategoryEntity toEntity() {
  return CategoryEntity(
    categoryID: categoryID,
    name: name,
    totalExpense: totalExpense,
    icon: icon,
    Color: Color,
  );
}
  static Category fromEntity(){
    return CategoryEntity(
      categoryID:entity.categoryID,
      name:entity.name,
      totalExpense :entity.totalExpense,
      icon:entity.icon,
      Color:entity.Color,
    );
}

}