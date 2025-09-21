import 'package:flutter/material.dart';
import 'package:travel_app_umayor/models/clima.dart';

class ClimaCard extends StatelessWidget {
  final Clima clima;

  const ClimaCard({super.key, required this.clima});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            cs.primaryContainer.withOpacity(0.6),
            cs.primaryContainer.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: DefaultTextStyle(
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: cs.onPrimaryContainer),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${clima.maxima}ºC / ${clima.minima}ºC',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    clima.dia.toUpperCase(),
                    style: const TextStyle(letterSpacing: 1.2),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    clima.nombre_lugar,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 6),
                  Text(clima.parrafo.texto),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.cloud,
              size: 56,
              color: cs.onPrimaryContainer.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }
}
