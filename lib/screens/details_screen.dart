import 'package:flutter/material.dart';
import 'package:project1/models/place_model.dart';

class DetailsScreen extends StatelessWidget {
  final PlaceModel model;
  const DetailsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              model.image ?? '',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Text(
              model.name ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(model.country ?? ''),
            const SizedBox(height: 12),
            Text(model.desc ?? ''),
          ],
        ),
      ),
    );
  }
}
