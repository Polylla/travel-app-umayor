import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  final void Function(String ruta) onNavigateMacrozone;

  const HamburgerMenu({super.key, required this.onNavigateMacrozone});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: const Color(0xFF202033),
      // tono oscuro similar a referencia
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _sectionTitle('DÓNDE IR'),
            Card(
              color: Colors.transparent,
              elevation: 0,
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.white24,
                  listTileTheme: const ListTileThemeData(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                  ),
                ),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  iconColor: color.primary,
                  collapsedIconColor: Colors.white,
                  title: const Text(
                    'Macrozona',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    _item('Norte y Desierto de Atacama', '/atacama'),
                    _item('Centro, Santiago y Valparaíso', '/centro'),
                    _item('Rapa Nui', '/rapanui'),
                    _item('Sur, Lagos y Volcanes', '/sur'),
                    _item('Patagonia y Antártica', '/patagonia'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            _sectionTitle('QUÉ HACER'),
            const ListTile(
              title: Text('—', style: TextStyle(color: Colors.white60)),
            ),
            _sectionTitle('SOBRE CHILE'),
            const ListTile(
              title: Text('—', style: TextStyle(color: Colors.white60)),
            ),
            _sectionTitle('ITINERARIOS'),
            const ListTile(
              title: Text('—', style: TextStyle(color: Colors.white60)),
            ),
            _sectionTitle('BLOG'),
            const ListTile(
              title: Text('—', style: TextStyle(color: Colors.white60)),
            ),
            _sectionTitle('EVENTOS'),
            const ListTile(
              title: Text('—', style: TextStyle(color: Colors.white60)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String t) => Padding(
    padding: const EdgeInsets.only(left: 8, top: 12, bottom: 4),
    child: Text(
      t,
      style: const TextStyle(color: Colors.white70, letterSpacing: 1.2),
    ),
  );

  Widget _item(String t, String ruta) => ListTile(
    title: Text(t),
    trailing: const Icon(Icons.chevron_right),
    onTap: () => onNavigateMacrozone(ruta),
  );
}
