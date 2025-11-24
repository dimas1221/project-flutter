import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/premium_drawer.dart';

/// Custom Shell Wrapper for go_router v17
class AppNavigationShell extends StatelessWidget {
  final StatefulNavigationShell shell;

  const AppNavigationShell({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PremiumDrawer(),

      appBar: AppBar(
        title: Text(_getTitle(shell.currentIndex)),
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(ctx).openDrawer(),
          ),
        ),
      ),

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: shell,
      ),

      bottomNavigationBar: _BottomNav(shell: shell),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Peta";
      case 2:
        return "Jadwal";
      case 3:
        return "Profil";
      default:
        return "";
    }
  }
}

class _BottomNav extends StatelessWidget {
  final StatefulNavigationShell shell;

  const _BottomNav({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final selected = shell.currentIndex;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              decoration: BoxDecoration(
                color: brightness == Brightness.light
                    ? Colors.white.withOpacity(0.50)
                    : Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: brightness == Brightness.light
                      ? Colors.black12
                      : Colors.white.withOpacity(0.10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: brightness == Brightness.light
                        ? Colors.black.withOpacity(0.07)
                        : Colors.black.withOpacity(0.3),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: NavigationBar(
                height: 70,
                backgroundColor: Colors.transparent,
                elevation: 0,
                indicatorColor: Colors.blue.withOpacity(0.22),
                selectedIndex: selected,
                onDestinationSelected: shell.goBranch,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                destinations: [
                  _navItem(
                    Icons.home_rounded,
                    "Home",
                    selected == 0,
                    brightness,
                  ),
                  _navItem(
                    Icons.map_rounded,
                    "Peta",
                    selected == 1,
                    brightness,
                  ),
                  _navItem(
                    Icons.calendar_month_rounded,
                    "Jadwal",
                    selected == 2,
                    brightness,
                  ),
                  _navItem(
                    Icons.person_rounded,
                    "Profil",
                    selected == 3,
                    brightness,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// NAV ITEM DENGAN TOOLTIP OVERLAY PREMIUM
  NavigationDestination _navItem(
    IconData icon,
    String tooltip,
    bool active,
    Brightness theme,
  ) {
    final isLight = theme == Brightness.light;

    return NavigationDestination(
      icon: _OverlayTooltip(
        message: tooltip,
        child: AnimatedScale(
          scale: active ? 1.28 : 1.0,
          duration: const Duration(milliseconds: 260),
          curve: Curves.easeOutCubic,
          child: Icon(
            icon,
            size: active ? 28 : 24,
            color: active
                ? (isLight ? Colors.blue : Colors.blueAccent)
                : (isLight ? Colors.black54 : Colors.white70),
            shadows: active
                ? [
                    Shadow(
                      color: (isLight
                          ? Colors.blue.withOpacity(0.20)
                          : Colors.blueAccent.withOpacity(0.55)),
                      blurRadius: isLight ? 10 : 18,
                    ),
                  ]
                : null,
          ),
        ),
      ),
      label: "",
    );
  }
}

/// ===========================================================
///  TOOLTIP OVERLAY — SELALU DI ATAS, TIDAK KETIMPA
/// ===========================================================
class _OverlayTooltip extends StatefulWidget {
  final Widget child;
  final String message;

  const _OverlayTooltip({
    super.key,
    required this.child,
    required this.message,
  });

  @override
  State<_OverlayTooltip> createState() => _OverlayTooltipState();
}

class _OverlayTooltipState extends State<_OverlayTooltip>
    with SingleTickerProviderStateMixin {
  OverlayEntry? entry;

  late AnimationController controller;
  late Animation<double> opacity;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 220),
      vsync: this,
    );

    opacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    offset = Tween<Offset>(
      begin: const Offset(0, 0.20),
      end: const Offset(0, -0.10),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    hideTooltip();
    controller.dispose();
    super.dispose();
  }

  void showTooltip() {
    if (entry != null) return;

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final offsetPos = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
      builder: (context) {
        final brightness = Theme.of(context).brightness;
        final isLight = brightness == Brightness.light;

        return Positioned(
          left: offsetPos.dx - 20,
          top: offsetPos.dy - 52,
          child: Material(
            color: Colors.transparent,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, _) => Opacity(
                opacity: opacity.value,
                child: Transform.translate(
                  offset: offset.value * 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isLight
                          ? Colors.black.withOpacity(0.85)
                          : Colors.white.withOpacity(0.90),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: isLight
                              ? Colors.black.withOpacity(0.25)
                              : Colors.blueAccent.withOpacity(0.35),
                          blurRadius: 12,
                          spreadRadius: 1.5,
                        ),
                      ],
                    ),
                    child: Text(
                      widget.message,
                      style: TextStyle(
                        color: isLight ? Colors.white : Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(entry!);
    controller.forward();
  }

  void hideTooltip() {
    if (entry != null) {
      controller.reverse().then((_) {
        entry?.remove();
        entry = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => showTooltip(),
      onExit: (_) => hideTooltip(),
      child: widget.child,
    );
  }
}
