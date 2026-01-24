import 'package:flutter/material.dart';

// SCREEN 1
class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.location_on, color: Colors.black),
            SizedBox(width: 6),
            Text(
              'Dalna',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search bar (شكل فقط)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.black45),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for a location',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20), // مسافه بين العنوان والبحث

          const Text(
            'Popular locations',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16), //  مسافه بين العنوان واول كرت
          // -------- ITEM 1
          placeCard(
            context,
            name: 'Farasan island',
            country: 'Jazan',
            image: 'assets/images/island.jpg',
            desc:
                'Farasan Island is one of the most beautiful islands in Saudi Arabia. '
                'It is known for its white sandy beaches and rich marine life.',
          ),

          const SizedBox(height: 16),

          // -------- ITEM 2
          placeCard(
            context,
            name: 'The Elephant Rock',
            country: 'Al Ula',
            image: 'assets/images/rock.jpg',
            desc:
                'The Elephant Rock is a famous natural landmark in Al Ula. '
                'It is a unique rock formation shaped like an elephant.',
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, 
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // card
  Widget placeCard(
    BuildContext context, {
    required String name,
    required String country,
    required String image,
    required String desc,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),

          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(country, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    name: name,
                    country: country,
                    image: image,
                    desc: desc,
                  ),
                ),
              );
            },
            child: const Text('View Details'),
          ),
        ],
      ),
    );
  }
}

//SCREEN 2
class DetailsScreen extends StatelessWidget {
  final String name;
  final String country;
  final String image;
  final String desc;

  const DetailsScreen({
    super.key,
    required this.name,
    required this.country,
    required this.image,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(title: Text(name)),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.asset(
            image,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),

          Text(
            name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),

          Text(country, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 16),

          Text(
            desc,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
