import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
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
  bool isFileSelected = false;
  String fileName = "";
  String aiSuggestions =
      "Las sugerencias aparecerán aquí después de enviar tu documento.";

  void handleSubmit() {
    setState(() {
      aiSuggestions =
          "Aquí aparecerán las sugerencias de la IA para mejorar tu documento.";
    });
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });

      if (result.files.single.bytes != null) {
        Uint8List fileBytes = result.files.single.bytes!;
        String content = String.fromCharCodes(fileBytes);
        setState(() {
          userInput = content;
          isFileSelected = true;
        });
      } else if (result.files.single.path != null) {
        String content = await File(result.files.single.path!).readAsString();
        setState(() {
          userInput = content;
          isFileSelected = true;
        });
      }
    }
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
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Vamor a mejorar tu ',
                                        style: TextStyle(
                                          color: colors.colorScheme.secondary,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Curriculum o carta de presentación',
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
              const SizedBox(height: 150),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Sugerencias de la IA",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        aiSuggestions,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton.icon(
                  onPressed: handleDownload,
                  icon: const Icon(Icons.download),
                  label: const Text("Descargar Documento"),
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
                    !isFileSelected
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: pickFile,
                                child: const Text("Subir archivo"),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  fileName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colors.primaryColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFileSelected = false;
                                      fileName = '';
                                    });
                                  },
                                  icon: Icon(Icons.close))
                            ],
                          ),
                    SizedBox(
                      height: 5,
                    ),
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
