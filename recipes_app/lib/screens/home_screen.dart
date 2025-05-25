import 'package:flutter/material.dart';
import 'upload_step.dart';
import 'my_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final Set<int> likedItems = {};

  void _onItemTapped(int index) {
    if (index == currentIndex) return;
    if (index == 1) { // (index = 1), it opens the UploadStep page.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UploadStep()),
      );
    } else if (index == 4) { // (index = 1), it opens the MyProfile  page.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyProfile()),
      );
    } else {
      setState(() {
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: Colors.green),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            activeIcon: Icon(Icons.edit, color: Colors.green),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 50,
              child: Image(
                image: AssetImage('assets/pic/icon.png'),
              ),
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            activeIcon: Icon(Icons.notifications, color: Colors.green),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person, color: Colors.green),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(33),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
             
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text("Search", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(height: 24),

            
              const Text("Category",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildCategoryButton("All", isActive: true),
                  const SizedBox(width: 10),
                  _buildCategoryButton("Food"),
                  const SizedBox(width: 10),
                  _buildCategoryButton("Drink"),
                ],
              ),
              const SizedBox(height: 24),

              // Left / Right
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Left",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(height: 3, color: Colors.green),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text("Right", style: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const Divider(color: Colors.grey),
              //Horizontal Cards
              const SizedBox(height: 18),
              _buildHorizontalCards(0),
              const SizedBox(height: 18),
              _buildHorizontalCards(2),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalCards(int startIndex) {
    final data = [
      {
        'image': 'assets/pic/dish4.png',
        'title': 'Pancake',
        'author': 'Calum Lewis',
        'duration': '> 60 mins',
        'avatar': 'assets/pic/men3.png',
      },
      {
        'image': 'assets/pic/dish1.png',
        'title': 'Salad',
        'author': 'Elif Sonas',
        'duration': '> 60 mins',
        'avatar': 'assets/pic/women1.png',
      },
      {
        'image': 'assets/pic/dish3.png',
        'title': 'Sweet',
        'author': 'Elena Shelby',
        'duration': '30 mins',
        'avatar': 'assets/pic/women2.png',
      },
      {
        'image': 'assets/pic/dish2.png',
        'title': 'Fruit',
        'author': 'John Priyadi',
        'duration': '45 mins',
        'avatar': 'assets/pic/men2.png',
      },
    ];
//buildHorizontalCards
    return SizedBox(
      height: 260,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(2, (i) {
            int index = startIndex + i;
            return Row(
              children: [
                _buildRecipeCard(
                  index: index,
                  image: data[index]['image']!,
                  title: data[index]['title']!,
                  author: data[index]['author']!,
                  duration: data[index]['duration']!,
                  avatar: data[index]['avatar']!,
                ),
                const SizedBox(width: 18),
              ],
            );
          }),
        ),
      ),
    );
  }

//buildRecipeCard
  Widget _buildRecipeCard({
    required int index,
    required String image,
    required String title,
    required String author,
    required String duration,
    required String avatar,
  }) {
    final isLiked = likedItems.contains(index);
    return Container(
      width: 170,
      margin: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(avatar), radius: 14),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  author,
                  style: const TextStyle(fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  height: 160,
                  width: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isLiked) {
                        likedItems.remove(index);
                      } else {
                        likedItems.add(index);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            "Food • $duration",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 10,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  static Widget _buildCategoryButton(String label, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: isActive ? Colors.white : Colors.grey),
      ),
    );
  }
}
