import 'package:flutter/material.dart';

import 'package:project1/constants/colors.dart';
import 'package:project1/constants/spacing.dart';
import 'package:project1/data/places.dart';
import 'package:project1/data/global.dart';
import 'package:project1/extension/nav.dart';
import 'package:project1/models/place_model.dart';
import 'package:project1/screens/details_screen.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  void initState() {
    placesList.clear();

    for (var element in placesJson) {
      PlaceModel place = PlaceModel.fromJson(element);
      placesList.add(place);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.location_on,color: AppColors.blackColor),
            SizedBox(width: 6),
            Text(
              'Dalna',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
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
              border: Border.all(color: AppColors.greyColor),
              color: AppColors.whiteColor,
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

          AppSpace.heightH20,

          const Text(
            'Popular locations',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          AppSpace.heightH16,

          // الكروت تحت بعض
          for (final item in placesList) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      item.image ?? '',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  AppSpace.heightH10,

                  Text(
                    item.name ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  AppSpace.heightH6,

                  Text(
                    item.country ?? '',
                    style: const TextStyle(color: Colors.black54),
                  ),
                  AppSpace.heightH10,

                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push(DetailsScreen(model: item));
                      },
                      child: const Text('View Details'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
