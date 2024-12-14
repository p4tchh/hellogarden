import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  // Define pages for Shop and Profile (Home Page content is custom in the body)
  static const List<Widget> _pages = <Widget>[
    SizedBox.shrink(), // Empty container for Home Page
    Center(child: Text('Shop Page')),
    Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNewsTap(String newsTitle) {
    // Handle click on news items
    print('Clicked on: $newsTitle');
  }

  final List<String> newsImages = [
    'assets/images/news1.jpg',
    'assets/images/news2.jpg',
    'assets/images/news3.jpg',
    'assets/images/news4.jpg',
    'assets/images/news5.jpg',
  ];

  void _onBoxTap(String label) {
    print('Tapped on: $label');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4DE165),
      body: Column(
        children: [
          // Logo Section
          Container(
            color: Colors.white, // White background for logo section
            padding: EdgeInsets.all(5),
            child: Center(
              child: Image.asset(
                'assets/images/logo2.png', // Update with your logo path
                height: 80,
                width: 80,
              ),
            ),
          ),

          // Search Bar (Exclusive to Home Page)
          if (_selectedIndex == 0)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Set background color to white
                  borderRadius: BorderRadius.circular(30), // Make it rounded
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12, // Shadow for better depth effect
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none, // Remove the default border
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  onChanged: (value) {
                    print('Search query: $value');
                  },
                ),
              ),
            ),

          // News Carousel (Exclusive to Home Page)
          if (_selectedIndex == 0)
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

          // Four Boxes Section (Exclusive to Home Page)
          if (_selectedIndex == 0)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 10, // Horizontal spacing
                mainAxisSpacing: 10, // Vertical spacing
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Prevent grid from scrolling
                children: [
                  _buildBox('Vegetables', Icons.grass),
                  _buildBox('Fruits', Icons.apple),
                  _buildBox('Compost', Icons.recycling),
                  _buildBox('Soil', Icons.landscape),
                ],
              ),
            ),

          // Page Content for Shop and Profile
          if (_selectedIndex != 0)
            Expanded(
              child: _pages[_selectedIndex], // Display the selected page
            ),
        ],
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
