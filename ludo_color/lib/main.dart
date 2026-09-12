import 'package:flutter/material.dart';

void main() {
  runApp(const LudoBoardApp());
}

class LudoBoardApp extends StatelessWidget {
  const LudoBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ludo Design',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Ludo Board Classic',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black87,
          centerTitle: true,
        ),
        body: Center(
          child: AspectRatio(
            aspectRatio: 1, // Keeps the board a perfect square
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Column(
                children: [
                  // Top Row (Red Home, Path, Green Home)
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        _buildHomeBase(Colors.red),
                        _buildVerticalPath(),
                        _buildHomeBase(Colors.green),
                      ],
                    ),
                  ),
                  // Middle Row (Horizontal Paths and Center)
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        _buildHorizontalPath(),
                        // Center Home Triangle Area
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                            ),
                            child: const Icon(
                              Icons.star,
                              size: 40,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        _buildHorizontalPath(),
                      ],
                    ),
                  ),
                  // Bottom Row (Blue Home, Path, Yellow Home)
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        _buildHomeBase(Colors.blue),
                        _buildVerticalPath(),
                        _buildHomeBase(Colors.amber),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Generates the large square bases for each color
  Widget _buildHomeBase(Color color) {
    return Expanded(
      flex: 4,
      child: Container(
        color: color,
        padding: const EdgeInsets.all(25),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              children: [
                _buildToken(color),
                _buildToken(color),
                _buildToken(color),
                _buildToken(color),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Generates the 4 circular tokens inside the base
  Widget _buildToken(Color color) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }

  // Generates vertical grid paths
  Widget _buildVerticalPath() {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
          ),
          itemCount: 18,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 0.5),
              ),
            );
          },
        ),
      ),
    );
  }

  // Generates horizontal grid paths
  Widget _buildHorizontalPath() {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.white,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            childAspectRatio: 1,
          ),
          itemCount: 18,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 0.5),
              ),
            );
          },
        ),
      ),
    );
  }
}
