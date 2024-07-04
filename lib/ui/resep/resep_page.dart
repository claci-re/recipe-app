import 'package:flutter/material.dart';
import 'package:resep3_apk/model/resep.dart';

class ResepPage extends StatelessWidget {
  final Resep resep;

  const ResepPage({super.key, required this.resep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resep.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              resep.title,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  'By ${resep.author}',
                  style: const TextStyle(
                      fontSize: 16.0, fontStyle: FontStyle.italic),
                ),
                const Spacer(),
                Text(
                  'Rating: ${resep.rating}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              resep.description,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
