//search view
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search city',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
            child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter city name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        )),
      ),
    );
  }
}
