import 'package:flutter/material.dart';

class JobBoardScreen extends StatefulWidget {
  const JobBoardScreen({super.key});

  @override
  State<JobBoardScreen> createState() => _JobBoardScreenState();
}

class _JobBoardScreenState extends State<JobBoardScreen> {
  double distance = 50;
  bool isRemote = false;
  String selectedOption = 'Remoto';
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF0A0E21),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'encontraras aqui',
                                        style: TextStyle(
                                          color: colors.colorScheme.secondary,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'todas las bolsas de trabajo',
                                        style: TextStyle(
                                          color: colors.colorScheme.primary,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 300),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 8),
                      ]),
                  child: Column(
                    children: List.generate(
                      3,
                      (index) => ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: const Text('Desarrollador Full Stack',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.work_outline,
                                    size: 18, color: Colors.grey),
                                SizedBox(width: 4),
                                Text('Tiempo completo'),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(Icons.location_on_outlined,
                                    size: 18, color: Colors.grey),
                                SizedBox(width: 4),
                                Text('Lima, Perú'),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(Icons.trending_up_outlined,
                                    size: 18, color: Colors.grey),
                                SizedBox(width: 4),
                                Text('Publicado hace 3 días'),
                              ],
                            ),
                          ],
                        ),
                        trailing: TextButton(
                          onPressed: () {},
                          child: const Text('Ver Detalles'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
          Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 8),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Filtros de Búsqueda',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Palabra clave',
                        hintText: 'Ej: Desarrollador Web',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Ubicación',
                        hintText: 'Ej: Lima, Perú',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Distancia (km): ${distance.round()}'),
                        Expanded(
                          child: Slider(
                            value: distance,
                            min: 0,
                            max: 100,
                            divisions: 100,
                            onChanged: (value) {
                              setState(() {
                                distance = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Switch(
                          value: isRemote,
                          onChanged: (value) {
                            setState(() {
                              isRemote = value;
                            });
                          },
                        ),
                        SegmentedButton<String>(
                          segments: const <ButtonSegment<String>>[
                            ButtonSegment<String>(
                                value: 'Remoto', label: Text('  Remoto  ')),
                            ButtonSegment<String>(
                                value: 'Presencial', label: Text('Presencial')),
                            ButtonSegment<String>(
                                value: 'Hibrido', label: Text('  Hibrido ')),
                          ],
                          selected: <String>{selectedOption},
                          onSelectionChanged: (Set<String> newSelection) {
                            setState(() {
                              selectedOption = newSelection.first;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.filter_alt_outlined),
                      label: const Text('Aplicar Filtros'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
