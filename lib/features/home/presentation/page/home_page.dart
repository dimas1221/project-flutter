import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/injection.dart';
import '../controllers/post_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<PostController>()..fetchPosts(),
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Home"),
        //   actions: [
        //     IconButton(
        //       icon: const Icon(Icons.person),
        //       onPressed: () => context.push('/profile'),
        //     ),
        //   ],
        // ),
        body: Consumer<PostController>(
          builder: (context, c, _) {
            if (c.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (c.error != null) {
              return Center(child: Text("Error: ${c.error}"));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: c.posts.length,
              itemBuilder: (_, i) {
                final p = c.posts[i];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(
                      p.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(p.body),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
