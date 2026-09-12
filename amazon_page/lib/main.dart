import 'package:flutter/material.dart';

void main() {
  runApp(const AmazonApp());
}

class AmazonApp extends StatelessWidget {
  const AmazonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      home: const AmazonHomePage(),
    );
  }
}

class AmazonHomePage extends StatelessWidget {
  const AmazonHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF84D8E3), Color(0xFFA6E6CE)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.black),
              suffixIcon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey,
              ),
              hintText: 'Search Amazon',
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              border: InputBorder.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.mic, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Location Strip
            Container(
              color: const Color(0xFFC7EBEB),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: const Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 20),
                  SizedBox(width: 5),
                  Text(
                    'Deliver to Pakistan',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Icon(Icons.keyboard_arrow_down, size: 20),
                ],
              ),
            ),

            // Categories
            Container(
              height: 100,
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(10),
                children: [
                  _buildCategoryCircle('Prime', Icons.star),
                  _buildCategoryCircle('Mobiles', Icons.phone_android),
                  _buildCategoryCircle('Fashion', Icons.checkroom),
                  _buildCategoryCircle('Electronics', Icons.laptop),
                  _buildCategoryCircle('Home', Icons.chair),
                ],
              ),
            ),
            const SizedBox(height: 5),

            // Banner Image Placeholder
            Container(
              height: 200,
              width: double.infinity,
              color: const Color(0xFF0F1111),
              child: const Center(
                child: Text(
                  'Great Indian Festival\nUp to 70% Off',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),

            // Deal of the Day
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deal of the Day',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.red[100],
                    child: const Icon(
                      Icons.headphones,
                      size: 100,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Up to 60% off on Headphones',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    '\$49.99 - \$199.00',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCircle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[200],
            child: Icon(icon, color: Colors.black87),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
