import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/Models/Food_Model.dart';
import 'package:flutter_recipes_app/Screen/Profile_Screen.dart';
import 'package:flutter_recipes_app/Widget/Food_Card_Widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FoodItem> items = [
      FoodItem(
        image: "assets/Pancake.png",
        avatar: "assets/profile1.png",
        user: "Calum Lewis",
        title: "Pancake",
      
      ),
      FoodItem(
        image: "assets/Salad.png",
        avatar: "assets/profile2.png",
        user: "Elif Sonas",
        title: "Salad",
      ),
      FoodItem(
        image: "assets/Vegetables.png",
        avatar: "assets/profile3.png",
        user: "Elena Shelby",
        title: "Vegetables",
      ),
      FoodItem(
        image: "assets/Fruits.png",
        avatar: "assets/profile4.png",
        user: "John Priyadi",
        title: "Fruits",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Search Bar
            Container(
              width: 360,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F5F7),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Color(0xFF3E5481)),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Color(0xFF9FA5C0)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Category Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Category",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3E5481),
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children:
                        ["All", "Food", "Drink"].map((text) {
                          final isSelected = text == "All";
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? const Color(0xFF34C47C)
                                        : const Color(0xFFF4F5F7),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                text,
                                style: TextStyle(
                                  color:
                                      isSelected
                                          ? Colors.white
                                          : const Color(0xFF9FA5C0),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Divider ABOVE Left/Right Tabs
            Container(
              width: double.infinity,
              height: 8,
              color: const Color(0xFFF4F5F7),
            ),

            const SizedBox(height: 30),

       
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Text(
                        "Left",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3E5481),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 14),
                      Divider(
                        thickness: 3,
                        color: Color(0xFF34C47C),
                        height: 0,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Text(
                        "Right",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9FA5C0),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 14),
                      Divider(thickness: 1, color: Colors.grey, height: 0),
                    ],
                  ),
                ),
              ],
            ),

             SizedBox(height: 16),

            // Grid of Cards
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => ProfileScreen(
                                profileImage: item.avatar as String,
                                name: item.user as String,
                                recipes: 25 + index,
                                following: 100 + index * 5,
                                followers: 300 + index * 10,
                                foodItems: items,
                              ),
                        ),
                      );
                    },
                    child: FoodCardWidget(
                      image: item.image,
                      avatar: item.avatar as String,
                      user: item.user as String,
                      title: item.title,
                      isSelected: item.isSelected,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
