import 'package:flutter/material.dart';
import 'package:travel_app_umayor/data/macrozona_data.dart';
import 'package:travel_app_umayor/models/lugar.dart';
import 'package:travel_app_umayor/widgets/clima_card.dart';
import 'package:travel_app_umayor/widgets/footer.dart';
import 'package:travel_app_umayor/widgets/hamburger_menu.dart';
import 'package:travel_app_umayor/widgets/header.dart';
import 'package:travel_app_umayor/widgets/image_carousel.dart';

const kBrandBlue = Color(0xFF002358);
const kBrandRed = Color(0xFFDC3545);
const kSectionBg = Color(0xFFF3F3F3);

class MacrozonePatagoniaPage extends StatelessWidget {
  const MacrozonePatagoniaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(
          context,
        ).textTheme.apply(bodyColor: kBrandBlue, displayColor: kBrandBlue),
      ),
      child: Scaffold(
        drawer: HamburgerMenu(
          onNavigateMacrozone: (ruta) {
            Navigator.pop(context);
            final current = ModalRoute.of(context)?.settings.name;
            if (current != ruta && ruta.isNotEmpty) {
              Navigator.pushNamed(context, ruta);
            }
          },
        ),

        appBar: const Header(height: 72),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kPatagoniaMacrozone.nombre_lugar,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    ...kPatagoniaMacrozone.parrafos
                        .map(
                          (p) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              p.texto,
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: kBrandBlue),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),

            // Card del clima
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverToBoxAdapter(
                child: ClimaCard(clima: kPatagoniaClima),
              ),
            ),

            // Sección carrusel: "Destinos..."
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(width: 4, height: 20, color: kBrandRed),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Destinos de Chile que te van a encantar',
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: kBrandBlue,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ImageCarousel(
                      images: kPatagoniaMacrozone.lugar
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
                  itemCount: kPatagoniaMacrozone.lugar.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (_, i) =>
                      _LugarChip(item: kPatagoniaMacrozone.lugar[i]),
                ),
              ),
            ),

            // Experiencias (acordeón)
            // Experiencias (acordeón)
            SliverToBoxAdapter(
              child: Container(
                color: kSectionBg,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(width: 4, height: 20, color: kBrandRed),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Descubre todas estas increíbles experiencias',
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: kBrandBlue,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // lista con separadores sin duplicar líneas
                      ...List.generate(
                        kPatagoniaMacrozone.experiencias.length,
                        (i) {
                          final e = kPatagoniaMacrozone.experiencias[i];
                          return _ExperienceItem(
                            title: e.titulo,
                            description: e.descripcion.texto,
                            isFirst: i == 0,
                            isLast:
                                i ==
                                kPatagoniaMacrozone.experiencias.length - 1,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Footer adoptado (al final del scroll)
            SliverToBoxAdapter(child: const Footer()),
          ],
        ),
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

class _ExperienceItem extends StatefulWidget {
  final String title;
  final String description;
  final bool isFirst;
  final bool isLast;

  const _ExperienceItem({
    required this.title,
    required this.description,
    required this.isFirst,
    required this.isLast,
  });

  @override
  State<_ExperienceItem> createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<_ExperienceItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSectionBg,
        border: Border(
          top: BorderSide(color: kBrandBlue, width: 0.3),
          bottom: BorderSide(color: kBrandBlue, width: 0.3),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kBrandBlue,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => _expanded = !_expanded),
                  icon: AnimatedRotation(
                    duration: const Duration(milliseconds: 180),
                    turns: _expanded ? 0.5 : 0.0,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: kBrandRed,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Contenido expandible
          AnimatedCrossFade(
            crossFadeState: _expanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 180),
            firstChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.description,
                    style: const TextStyle(color: kBrandBlue),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: kBrandRed),
                      foregroundColor: kBrandRed,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // TODO: acción "VER MÁS"
                    },
                    child: const Text(
                      'VER MÁS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            secondChild: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
