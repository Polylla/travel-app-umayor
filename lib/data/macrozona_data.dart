import 'package:travel_app_umayor/models/clima.dart';
import 'package:travel_app_umayor/models/experiencia.dart';
import 'package:travel_app_umayor/models/lugar.dart';
import 'package:travel_app_umayor/models/macrozona.dart';
import 'package:travel_app_umayor/models/parrafo.dart';

const kPatagoniaParrafos = [
  Parrafo(
    texto:
        "En medio de los cinematográficos paisajes podrás descubrir ciudades y pueblos pioneros, donde se respira una historia ganadera y el estilo del gaucho de la Patagonia. Recorre en auto o bicicleta la Carretera Austral para maravillarte con lo mejor del norte de la Patagonia.",
  ),
  Parrafo(
    texto:
        "i te apasiona el trekking, las Torres del Paine son tu norte: bosques, cerros, saltos de agua, lagos y vistas privilegiadas a los Campos de Hielo Sur serán parte de tu experiencia.",
  ),
  Parrafo(
    texto:
        "Para vivir un viaje único y aventurero, embárcate en una experiencia antártica. Navega por los fiordos y canales para llegar hasta el Cabo de Hornos, el punto más austral del continente, o sigue más allá hasta llegar a la Antártica, un tesoro científico y ecológico que no puedes dejar de visitar.",
  ),
];

const kPatagoniaLugares = [
  Lugar(destino: "Antártica Chilena", imagen: "assets/images/patagonia_1.jpg"),
  Lugar(destino: "Lago General Carrera", imagen: "assets/images/patagonia_2.jpg"),
  Lugar(destino: "Tierra del Fuego", imagen: "assets/images/patagonia_3.jpg"),
  Lugar(destino: "Torres del Paine", imagen: "assets/images/patagonia_4.jpg"),
  Lugar(destino: "Puerto Natales", imagen: "assets/images/patagonia_5.jpg"),
  Lugar(destino: "Punta Arenas", imagen: "assets/images/patagonia_6.jpg"),
  Lugar(destino: "Coyhaique y Puerto Aysén", imagen: "assets/images/patagonia_7.jpg"),
  Lugar(destino: "Carretera Austral", imagen: "assets/images/patagonia_8.jpg"),
];

const kPatagoniaExperiencias = [
  Experiencia(
    titiulo: 'Turismo indígena',
    descripcion: Parrafo(
      texto:
          '¡Ven a compartir y convivir con los pueblos originarios y sus tradiciones!',
    ),
  ),
  Experiencia(
    titiulo: 'Vida urbana',
    descripcion: Parrafo(
      texto: 'Ajetreada vida nocturna, modernos centros comerciales, productos textiles y gastronómicos típicos de Chile y mucho más.',
    ),
  ),
  Experiencia(
    titiulo: 'Termas y bienestar',
    descripcion: Parrafo(
      texto: '¿Te imaginas sumergido en calientes aguas termales mientras la lluvia cae sobre los frondosos bosques a tu alrededor?',
    ),
  ),
  Experiencia(
    titiulo: 'Cruceros y navegaciones',
    descripcion: Parrafo(
      texto: '¿Buscas vivir una experiencia única, rodeado de paisajes escénicos y con las comodidades propias de un rey?',
    ),
  ),
  Experiencia(
    titiulo: 'Astroturismo',
    descripcion: Parrafo(
      texto: '¡Vive un viaje a las estrellas en Chile!',
    ),
  ),
  Experiencia(
    titiulo: 'Cultura',
    descripcion: Parrafo(
      texto: '¡Ven a compartir y convivir con los pueblos originarios y sus tradiciones!',
    ),
  ),
  Experiencia(
    titiulo: 'Vinos y Gastronomía',
    descripcion: Parrafo(
      texto: 'Una combinación de exquisitos productos del mar y gran variedad de alimentos provenientes de la tierra…',
    ),
  ),
  Experiencia(
    titiulo: 'Aventura y deporte',
    descripcion: Parrafo(
      texto: 'Si te gusta sentir la adrenalina, no hay duda ¡Chile es para ti!',
    ),
  ),
  Experiencia(
    titiulo: 'Naturaleza',
    descripcion: Parrafo(
      texto: 'Hay pocos lugares en el mundo donde puedes disfrutar vistas tan diversas como en Chile…',
    ),
  ),
];

const kPatagoniaClima = Clima(
  maxima: 18,
  minima: 2,
  dia: 'SUNDAY',
  nombre_lugar: 'Patagonia y Antártica',
  parrafo: Parrafo(texto: 'La información corresponde a - Av. Pdte. Eduardo Frei Montalva 768, Punta Arenas, Magallanes y la Antártica Chilena, Chile'),
);

const kPatagoniaMacrozone = Macrozone(
  id: 'Patagonia y Antártica',
  nombre_lugar: 'Patagonia y Antártica',
  ruta: '/Patagonia',
  parrafos: kPatagoniaParrafos,
  lugar: kPatagoniaLugares,
  experiencias: kPatagoniaExperiencias,
);
