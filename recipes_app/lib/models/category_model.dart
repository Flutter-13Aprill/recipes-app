class CategoryModel {
  final String name;
  final bool isSelected;
  CategoryModel({required this.name, required this.isSelected});
}
// sample 
List<CategoryModel> categories=[
CategoryModel(name: "All", isSelected: true),
CategoryModel(name: "Food", isSelected: false),
CategoryModel(name: "Drink", isSelected: false),
];