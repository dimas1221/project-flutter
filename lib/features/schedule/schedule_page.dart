import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Jadwal")),
      body: const Center(
        child: Text("Schedule Page", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
