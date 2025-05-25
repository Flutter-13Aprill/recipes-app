import 'package:flutter/material.dart';
import 'upload_step.dart';
import 'home_screen.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  final int currentIndex = 0;
//This function defines what happens when an item in the navigation bar is tapped.
  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UploadStep()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: const Icon(Icons.share, color: Colors.black),
              onPressed: () {
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) => _onItemTapped(context, index),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: Colors.green),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            activeIcon: Icon(Icons.edit, color: Colors.green),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Transform.translate(
              offset: const Offset(0, -20),
              child: Image.asset(
                'assets/pic/icon.png',
                width: 50,
                height: 50,
              ),
            ),
            label: 'Scan',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            activeIcon: Icon(Icons.notifications, color: Colors.green),
            label: 'Notification',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person, color: Colors.green),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/pic/men1.png'),
                      radius: 60,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Choirul Syafril",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //number of recipes, followers, and following.
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Text(
                            '32',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Recipes',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            '782',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Following',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            '1,287',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Followers',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: FractionallySizedBox(
                widthFactor: 1.0,
                child: Container(
                  height: 5,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        "Recipes",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Container(height: 3, color: Colors.green),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        "Liked",
                        style: TextStyle(
                          color: Color.fromARGB(255, 128, 126, 126),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 3,
                        color: Color.fromARGB(255, 199, 199, 199),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 240,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Row(
                  children: [
                    _buildRecipeCard(
                      image: 'assets/pic/dish4.png',
                      title: 'Pancake',
                      duration: '> 60 mins',
                    ),
                    const SizedBox(width: 18),
                    _buildRecipeCard(
                      image: 'assets/pic/dish1.png',
                      title: 'Salad',
                      duration: '> 60 mins',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 240,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Row(
                  children: [
                    _buildRecipeCard(
                      image: 'assets/pic/dish3.png',
                      title: 'Sweet',
                      duration: '30 mins',
                    ),
                    const SizedBox(width: 18),
                    _buildRecipeCard(
                      image: 'assets/pic/dish2.png',
                      title: 'Fruit',
                      duration: '45 mins',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  static Widget _buildRecipeCard({
    required String image,
    required String title,
    required String duration,
  }) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 20,
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
}
