import 'package:abilityconnect/screens/screens.dart';
import 'package:flutter/material.dart';

class Resource {
  final String title;
  final String type;

  Resource(this.title, this.type);
}

class ModuleInstruction extends StatelessWidget {
  final Course course;

  const ModuleInstruction({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Módulo'),
        backgroundColor: colors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 24),

              // Sección de video
              Container(
                height: 500,
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: colors.onSurface.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.video_library,
                          size: 48, color: colors.primary),
                      SizedBox(width: 12),
                      Text(
                        'Video del módulo',
                        style: TextStyle(
                          color: colors.onSurface,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Recursos
              _buildSectionCard(
                context,
                title: 'Recursos',
                icon: Icons.file_copy,
                content: Column(
                  children: course.resources
                      .map((resource) => ListTile(
                            leading: Icon(Icons.insert_drive_file,
                                color: colors.primary),
                            title: Text(
                              'Discurso de Steve Jobs',
                              style: TextStyle(
                                  color: colors.onSurface,
                                  fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              'Documento PDF',
                              style: TextStyle(
                                  color: colors.onSurface.withOpacity(0.7)),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 24),

              // Foro de Discusión
              _buildSectionCard(
                context,
                title: 'Foro de Discusión',
                icon: Icons.forum,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comparte tus dudas y experiencias con otros estudiantes.',
                      style:
                          TextStyle(color: colors.onSurface.withOpacity(0.7)),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Acción para ir al foro
                      },
                      icon: Icon(Icons.arrow_forward),
                      label: Text('Ir al foro'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget content,
  }) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: colors.primary),
                SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colors.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            content,
          ],
        ),
      ),
    );
  }
}
