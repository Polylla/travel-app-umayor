import 'package:flutter/material.dart';
import 'package:travel_app_umayor/data/macrozona_data.dart';
import 'package:travel_app_umayor/models/lugar.dart';
import 'package:travel_app_umayor/widgets/clima_card.dart';
import 'package:travel_app_umayor/widgets/hamburger_menu.dart';
import 'package:travel_app_umayor/widgets/image_carousel.dart';

class MacrozoneAtacamaPage extends StatelessWidget {
  const MacrozoneAtacamaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HamburgerMenu(
        onNavigateMacrozone: (ruta) {
          Navigator.pop(context); // cierra drawer
          if (ruta != kAtacamaMacrozone.ruta) {
            // Aquí navegas a las otras macrozonas si tienes páginas listas
            // Navigator.pushNamed(context, ruta);
          }
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const Text('Chile Travel'),
            leading: Builder(
              builder: (ctx) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(ctx).openDrawer(),
              ),
            ),
          ),
          // Título + párrafos
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kAtacamaMacrozone.nombre_lugar,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...kAtacamaMacrozone.parrafos
                      .map(
                        (p) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(p.texto),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ),

          //Card Clima
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverToBoxAdapter(child: ClimaCard(clima: kAtacamaClima)),
          ),

          // Sección: Destinos que te van a encantar (Carrusel)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Destinos de Chile que te van a encantar',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.w700),
                          maxLines: 2, // o 1
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ImageCarousel(
                    images: kAtacamaMacrozone.lugar
                        .map((e) => e.imagen)
                        .toList(),
                  ),
                ],
              ),
            ),
          ),

          // Chips de lugares
          SliverToBoxAdapter(
            child: SizedBox(
              height: 96,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: kAtacamaMacrozone.lugar.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) =>
                    _LugarChip(item: kAtacamaMacrozone.lugar[i]),
              ),
            ),
          ),

          // Experiencias (acordeón)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        // <-- clave
                        child: Text(
                          'Descubre todas estas increíbles experiencias',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.w700),
                          maxLines: 2, // o 1
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...kAtacamaMacrozone.experiencias.map(
                    (e) => Card(
                      elevation: 0,
                      child: ExpansionTile(
                        title: Text(
                          e.titiulo,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Text(e.descripcion.texto),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LugarChip extends StatelessWidget {
  final Lugar item;

  const _LugarChip({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            item.imagen,
            width: 72,
            height: 56,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 80,
          child: Text(
            item.destino,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
