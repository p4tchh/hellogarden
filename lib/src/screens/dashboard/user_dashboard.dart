import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    SizedBox.shrink(), // Empty container for Home Page
    Center(child: Text('Shop Page')),
    // Placeholder for Profile Page — will customize it
    SizedBox.shrink(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNewsTap(String newsTitle) {
    print('Clicked on: $newsTitle');
  }

  final List<String> newsImages = [
    'assets/images/plant1.jpg',
    'assets/images/plant2.jpg',
    'assets/images/plant3.jpg',
    'assets/images/plant4.jpg',
    'assets/images/plant5.jpg',
  ];

  void _onBoxTap(String label) {
    print('Tapped on: $label');
  }

  void _logout() {
    // Add your logout logic here (e.g., clear user session, token, etc.)
    print('User logged out');
    Navigator.of(context).pushReplacementNamed('/login'); // Navigate to the login page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4DE165),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo Section
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(5),
              child: Center(
                child: Image.asset(
                  'assets/images/logo2.png',
                  height: 80,
                  width: 80,
                ),
              ),
            ),

            // Home Page Content (Search Bar, News Carousel, and Four Boxes)
            if (_selectedIndex == 0) ...[
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    onChanged: (value) {
                      print('Search query: $value');
                    },
                  ),
                ),
              ),

              // News Carousel
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 150,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                  ),
                  items: newsImages.map((imagePath) {
                    return GestureDetector(
                      onTap: () => _onNewsTap('News: $imagePath'),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              // Four Boxes
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _buildBox('Vegetables', Icons.grass),
                    _buildBox('Fruits', Icons.apple),
                    _buildBox('Compost', Icons.recycling),
                    _buildBox('Soil', Icons.landscape),
                  ],
                ),
              ),
            ],

            // Shop Page Content
            if (_selectedIndex == 1) _pages[1],

            // Profile Page Content with Logout Button
            if (_selectedIndex == 2)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Profile Details (Customize as needed)
                    Text(
                      'Profile Page',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _logout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Button color
                      ),
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                  ],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBox(String label, IconData icon) {
    return GestureDetector(
      onTap: () => _onBoxTap(label),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.green),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
