import 'package:travel_app_umayor/models/clima.dart';
import 'package:travel_app_umayor/models/experiencia.dart';
import 'package:travel_app_umayor/models/lugar.dart';
import 'package:travel_app_umayor/models/macrozona.dart';
import 'package:travel_app_umayor/models/parrafo.dart';

const kAtacamaParrafos = [
  Parrafo(
    texto:
        "Lejos de ser inerte, el Desierto de Atacama es una zona abundante en energía, gracias a sus acogedoras culturas ancestrales y a los oasis que son fuente de vida en el desierto más árido del mundo.",
  ),
  Parrafo(
    texto:
        "Asciende los más de 4.000 metros de altura del altiplano andino para descubrir pequeños poblados que mantienen intactas sus costumbres en medio de extremos escenarios que vale la pena fotografiar.",
  ),
  Parrafo(
    texto:
        "Visita San Pedro de Atacama y explora paisajes únicos en el mundo. Salares, géiseres y lagunas de un intenso color azul, son parte de los lugares que te asombrarán.",
  ),
  Parrafo(
    texto:
        "Emprende un viaje por las estrellas. Aprende más sobre los astros y las constelaciones en uno de los múltiples observatorios astronómicos de la zona norte del país.",
  ),
];

const kAtacamaLugares = [
  Lugar(destino: "Valle del Huasco", imagen: "assets/images/atacama_1.jpg"),
  Lugar(destino: "San Pedro de Atacama", imagen: "assets/images/atacama_2.jpg"),
  Lugar(destino: "La Serena y Coquimbo", imagen: "assets/images/atacama_3.jpg"),
];

const kAtacamaExperiencias = [
  Experiencia(
    titiulo: 'Turismo indígena',
    descripcion: Parrafo(
      texto:
          'Aprende de las tradiciones atacameñas en visitas guiadas responsables.',
    ),
  ),
  Experiencia(
    titiulo: 'Vida urbana',
    descripcion: Parrafo(
      texto: 'Descubre mercados locales, artesanía y gastronomía en San Pedro.',
    ),
  ),
  Experiencia(
    titiulo: 'Playas',
    descripcion: Parrafo(
      texto: 'Explora caletas del norte chico en tu ruta hacia el desierto.',
    ),
  ),
  Experiencia(
    titiulo: 'Termas y bienestar',
    descripcion: Parrafo(
      texto: 'Relájate en termas naturales después de una jornada de trekking.',
    ),
  ),
  Experiencia(
    titiulo: 'Astroturismo',
    descripcion: Parrafo(
      texto: 'Cielos prístinos ideales para tours astronómicos y fotografía.',
    ),
  ),
  Experiencia(
    titiulo: 'Cultura',
    descripcion: Parrafo(
      texto: 'Sitios arqueológicos y museos con valioso patrimonio.',
    ),
  ),
  Experiencia(
    titiulo: 'Vinos y Gastronomía',
    descripcion: Parrafo(
      texto: 'Sabores locales con productos del altiplano y del mar.',
    ),
  ),
  Experiencia(
    titiulo: 'Aventura y deporte',
    descripcion: Parrafo(
      texto: 'Dunas, senderos y rutas de altura para viajeros experimentados.',
    ),
  ),
  Experiencia(
    titiulo: 'Naturaleza',
    descripcion: Parrafo(
      texto: 'Flamencos, vicuñas y bofedales en ecosistemas únicos.',
    ),
  ),
];

const kAtacamaClima = Clima(
  maxima: 24,
  minima: 2,
  dia: 'SUNDAY',
  nombre_lugar: 'Norte y Desierto de Atacama',
  parrafo: Parrafo(texto: 'La información corresponde a - Antofagasta, Chile'),
);

const kAtacamaMacrozone = Macrozone(
  id: 'atacama',
  nombre_lugar: 'Norte y Desierto de Atacama',
  ruta: '/atacama',
  parrafos: kAtacamaParrafos,
  lugar: kAtacamaLugares,
  experiencias: kAtacamaExperiencias,
);
