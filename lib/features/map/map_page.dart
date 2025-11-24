import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Peta")),
      body: const Center(
        child: Text("Map Page", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
