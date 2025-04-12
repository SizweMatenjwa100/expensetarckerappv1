class CategoryEntity {
  String categoryID;
  String name;
  int totalExpense;
  String icon;
  String color; // lowercase "color"

  CategoryEntity({
    required this.categoryID,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color, // lowercase here too
  });

  Map<String, Object?> toDocument() {
    return {
      'categoryID': categoryID,
      'name': name,
      'totalExpense': totalExpense,
      'icon': icon,
      'color': color,
    };
  }

  static CategoryEntity fromDocument(Map<String, dynamic> doc) {
    return CategoryEntity(
      categoryID: doc['categoryID'],
      name: doc['name'],
      totalExpense: doc['totalExpense'],
      icon: doc['icon'],
      color: doc['color'],
    );
  }
}
