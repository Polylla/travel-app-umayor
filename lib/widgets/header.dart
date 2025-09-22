import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    this.height = 80,
    this.onTapLogo,
    this.onSearch,
    this.onChangeLanguage,
  });

  final double height;

  final VoidCallback? onTapLogo;
  final VoidCallback? onSearch;
  final VoidCallback? onChangeLanguage;

  @override
  Size get preferredSize => Size.fromHeight(height);

  void _openDrawerIfAny(BuildContext context) {
    final scaffold = Scaffold.maybeOf(context);
    if (scaffold?.hasDrawer ?? false) {
      scaffold!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return AppBar(
      toolbarHeight: height,
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 120,
      leading: InkWell(
        onTap: onTapLogo,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0le_roEpezBZUQ0VKQCBUYJW8wghfqQguCw&s",
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => Icon(Icons.public, color: cs.primary),
          ),
        ),
      ),

      actions: [
        IconButton(
          tooltip: 'Buscar',
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: onSearch,
        ),
        InkWell(
          onTap: onChangeLanguage,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Bandera_de_Espa%C3%B1a_%28sin_escudo%29.svg/250px-Bandera_de_Espa%C3%B1a_%28sin_escudo%29.svg.png",
              width: 30,
              height: 20,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.flag, color: Colors.red),
            ),
          ),
        ),
        Builder(
          builder: (ctx) => IconButton(
            tooltip: 'Menú',
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => _openDrawerIfAny(ctx),
          ),
        ),
      ],
    );
  }
}
