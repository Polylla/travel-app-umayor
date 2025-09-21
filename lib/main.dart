import 'package:flutter/material.dart';
import 'package:travel_app_umayor/pages/macrozone_atacama_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final seed = const Color(0xFF0F4C81);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App UMayor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seed,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,

      // Empezamos en Atacama
      initialRoute: '/atacama',

      // Rutas nombradas para el Drawer "Dónde ir"
      routes: {
        '/atacama': (_) => const MacrozoneAtacamaPage(),
        '/centro': (_) => const MacrozonePlaceholderPage(
          title: 'Centro, Santiago y Valparaíso',
        ),
        '/rapanui': (_) => const MacrozonePlaceholderPage(title: 'Rapa Nui'),
        '/sur': (_) =>
            const MacrozonePlaceholderPage(title: 'Sur, Lagos y Volcanes'),
        '/patagonia': (_) =>
            const MacrozonePlaceholderPage(title: 'Patagonia y Antártica'),
      },

      // Fallback por si llega una ruta desconocida
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) =>
            const MacrozonePlaceholderPage(title: 'Ruta no encontrada'),
      ),
    );
  }
}

class MacrozonePlaceholderPage extends StatelessWidget {
  final String title;

  const MacrozonePlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Esta macrozona aún no está implementada.\n\n'
            'Úsala como plantilla o navega a otra desde el menú.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
