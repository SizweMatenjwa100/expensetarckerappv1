import '../entities/entities.dart';

class Category {
  String categoryID;
  String name;
  int totalExpense;
  String icon;
  String color;

  Category({
    required this.categoryID,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color,
  });

  static final empty = Category(
    categoryID: '',
    name: '',
    totalExpense: 0,
    icon: '',
    color: '',
  );

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryID: categoryID,
      name: name,
      totalExpense: totalExpense,
      icon: icon,
      color: color,
    );
  }

  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryID: entity.categoryID,
      name: entity.name,
      totalExpense: entity.totalExpense,
      icon: entity.icon,
      color: entity.color,
    );
  }
}
