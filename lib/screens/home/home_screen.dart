import 'package:flutter/material.dart';
import 'home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  'API NETWORK CALLS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                shrinkWrap: true,
                children: HomeCardValues.values
                    .map((card) => HomeCardView(homeCard: card))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
