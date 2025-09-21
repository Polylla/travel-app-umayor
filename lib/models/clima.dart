import 'package:travel_app_umayor/models/parrafo.dart';

class Clima {
  final int maxima;
  final int minima;
  final String dia;
  final String nombre_lugar;
  final Parrafo parrafo;

  const Clima({
    required this.maxima,
    required this.minima,
    required this.dia,
    required this.nombre_lugar,
    required this.parrafo,
  });
}
