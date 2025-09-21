import 'package:flutter/material.dart';

//FooterWidget: pie de página con redes sociales, enlaces de interés y contacto//
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0B1A36),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0le_roEpezBZUQ0VKQCBUYJW8wghfqQguCw&s",
                width: 105,
              ),
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7sEPDnsKLPyUA6DjDzbbkFGsrMWI_hrsIedSz775RIS_3JirG",
                width: 200,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Redes Sociales",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.camera_alt, color: Colors.white, size: 32),
              SizedBox(width: 16),
              Icon(Icons.video_library, color: Colors.white, size: 32),
              SizedBox(width: 16),
              Icon(Icons.facebook, color: Colors.white, size: 32),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Enlaces de interés",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Chile es Tuyo",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const Text(
            "Calendario de ferias",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const Text(
            "Imagen de Chile",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const Text(
            "Pro Chile",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const Text(
            "Subsecretaría de Turismo",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 20),
          const Text(
            "Contacto",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Turismo Atiende:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "+56 2 27318337",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const Text(
            "turismoatiende@sernatur.cl",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const Text(
            "Whatsapp",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 20),
          Center(
            child: Image.network(
              "https://storage.googleapis.com/chile-travel-cdn/2024/07/96f9116d-premios-chiletravel-2024-1.png",
              width: 400,
            ),
          ),
        ],
      ),
    );
  }
}
