import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

/// PremiumDrawer located at lib/features/widgets/premium_drawer.dart
class PremiumDrawer extends StatelessWidget {
  const PremiumDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProv = Provider.of<ThemeProvider>(context, listen: true);

    return Drawer(
      width: 300,
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            color: Theme.of(context).cardColor.withOpacity(0.08),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(radius: 28, child: Icon(Icons.person)),
                  const SizedBox(height: 12),
                  const Text(
                    'User Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  const Text('you@example.com', style: TextStyle(fontSize: 13)),
                  const SizedBox(height: 24),
                  ListTile(
                    leading: const Icon(Icons.home_rounded),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                      context.go('/');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.map_rounded),
                    title: const Text('Peta'),
                    onTap: () {
                      Navigator.pop(context);
                      context.go('/map');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_month_rounded),
                    title: const Text('Jadwal'),
                    onTap: () {
                      Navigator.pop(context);
                      context.go('/schedule');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_rounded),
                    title: const Text('Profil'),
                    onTap: () {
                      Navigator.pop(context);
                      context.go('/profile');
                    },
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.brightness_6),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          themeProv.themeMode == ThemeMode.dark
                              ? 'Dark'
                              : 'Light',
                        ),
                      ),
                      Switch(
                        value: themeProv.themeMode == ThemeMode.dark,
                        onChanged: (_) => themeProv.toggleTheme(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
