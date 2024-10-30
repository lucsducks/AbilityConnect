import 'package:flutter/material.dart';

class DocumentWritingScreen extends StatefulWidget {
  const DocumentWritingScreen({super.key});

  @override
  State<DocumentWritingScreen> createState() => _DocumentWritingScreenState();
}

class _DocumentWritingScreenState extends State<DocumentWritingScreen> {
  String documentType = "resume";
  String jobType = "";
  String userInput = "";
  String aiSuggestions =
      "Las sugerencias aparecerán aquí después de enviar tu documento.";

  void handleSubmit() {
    setState(() {
      aiSuggestions =
          "Aquí aparecerán las sugerencias de la IA para mejorar tu documento.";
    });
  }

  void handleDownload() {
    print("Descargando documento...");
  }

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
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.grey[300],
                                  child: const Text(
                                    'JJ',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Hola, ',
                                        style: TextStyle(
                                          color: colors.colorScheme.secondary,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'jhonatan',
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
                        Row(
                          children: [
                            Container(
                              width: 300,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    decoration: BoxDecoration(
                                      color: colors.primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Buscar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.notifications_outlined,
                                        color: Colors.white70,
                                        size: 28),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Text(
                                        '1',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 300),
                  ],
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
          Positioned(
            top: 150,
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Mejora tu currículum o carta de presentación con la ayuda de la IA",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: documentType,
                            onChanged: (value) {
                              setState(() {
                                documentType = value ?? "resume";
                              });
                            },
                            items: const [
                              DropdownMenuItem(
                                value: "resume",
                                child: Text("Currículum"),
                              ),
                              DropdownMenuItem(
                                value: "cover-letter",
                                child: Text("Carta de presentación"),
                              ),
                            ],
                            decoration: const InputDecoration(
                              labelText: "Tipo de documento",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: jobType.isEmpty ? null : jobType,
                            onChanged: (value) {
                              setState(() {
                                jobType = value ?? "";
                              });
                            },
                            items: const [
                              DropdownMenuItem(
                                value: "tech",
                                child: Text("Tecnología"),
                              ),
                              DropdownMenuItem(
                                value: "finance",
                                child: Text("Finanzas"),
                              ),
                              DropdownMenuItem(
                                value: "healthcare",
                                child: Text("Salud"),
                              ),
                              DropdownMenuItem(
                                value: "education",
                                child: Text("Educación"),
                              ),
                            ],
                            decoration: const InputDecoration(
                              labelText: "Tipo de trabajo",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      maxLines: 8,
                      decoration: const InputDecoration(
                        hintText: "Escribe o pega tu documento aquí...",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          userInput = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: handleSubmit,
                      child: const Text("Obtener sugerencias de la IA"),
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
