import 'package:abilityconnect/screens/dashboard/module_instrucction_screen.dart';
import 'package:flutter/material.dart';

class Course {
  final String name;
  final int duration;
  final String language;
  final String workType;
  final String accessibility;
  final List<Resource> resources;

  Course({
    required this.name,
    required this.duration,
    required this.language,
    required this.workType,
    required this.accessibility,
    this.resources = const [],
  });
}

class ModuleScreen extends StatefulWidget {
  const ModuleScreen({super.key});

  @override
  State<ModuleScreen> createState() => _ModuleScreenState();
}

class _ModuleScreenState extends State<ModuleScreen> {
  double horas = 50;
  bool isSpanish = false;
  String selectedOption = 'Español';
  String selectedWorkType = 'Todos';
  String selectedAccessibility = 'Todos';
  String courseName = '';
  bool isShow = false;

  final List<Course> allCourses = [
    Course(
        name: 'Capacitación en CV',
        duration: 30,
        language: 'Español',
        workType: 'Remoto',
        accessibility: 'Accesible Físicamente'),
    Course(
        name: 'Habilidades Digitales',
        duration: 20,
        language: 'Ingles',
        workType: 'Presencial',
        accessibility: 'Accesible Visualmente'),
    Course(
        name: 'Microsoft Excel Avanzado',
        duration: 40,
        language: 'Español',
        workType: 'Híbrido',
        accessibility: 'Accesible Auditivamente'),
    Course(
        name: 'Preparación para Entrevistas',
        duration: 10,
        language: 'Quechua',
        workType: 'Remoto',
        accessibility: 'Accesible Físicamente'),
  ];

  List<Course> filteredCourses = [];

  @override
  void initState() {
    super.initState();
    filteredCourses = allCourses;
  }

  void applyFilters() {
    setState(() {
      filteredCourses = allCourses.where((course) {
        final matchesName =
            course.name.toLowerCase().contains(courseName.toLowerCase());
        final matchesDuration = course.duration <= horas.round();
        final matchesLanguage =
            selectedOption == 'Todos' || course.language == selectedOption;
        final matchesWorkType =
            selectedWorkType == 'Todos' || course.workType == selectedWorkType;
        final matchesAccessibility = selectedAccessibility == 'Todos' ||
            course.accessibility == selectedAccessibility;

        return matchesName &&
            matchesDuration &&
            matchesLanguage &&
            matchesWorkType &&
            matchesAccessibility;
      }).toList();

      if (filteredCourses.isEmpty)
        filteredCourses =
            allCourses; // Si no se selecciona filtro, mostrar todos
      isShow = true;
    });
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
                                        text: 'Encontrarás aquí ',
                                        style: TextStyle(
                                          color: colors.colorScheme.secondary,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            'todas las capacitaciones que deseas',
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

              //! aquí va todo el contenido de los filtros y resultados de búsqueda

              if (isShow && filteredCourses.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Resultados de Búsqueda',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      ...filteredCourses.map((course) => Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: CourseCard(course: course),
                          )),
                    ],
                  ),
                ),
              if (isShow && filteredCourses.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                      'No se encontraron cursos que coincidan con los filtros.'),
                ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Filtros de Búsqueda',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Nombre del curso',
                        hintText: 'Habilidades digitales',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          courseName = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Duración del curso (horas): ${horas.round()}'),
                        Expanded(
                          child: Slider(
                            value: horas,
                            min: 0,
                            max: 50,
                            divisions: 50,
                            onChanged: (value) {
                              setState(() {
                                horas = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SegmentedButton<String>(
                          segments: const <ButtonSegment<String>>[
                            ButtonSegment<String>(
                                value: 'Español', label: Text('Español')),
                            ButtonSegment<String>(
                                value: 'Ingles', label: Text('Ingles')),
                            ButtonSegment<String>(
                                value: 'Quechua', label: Text('Quechua')),
                            ButtonSegment<String>(
                                value: 'Todos', label: Text('Todos')),
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
                    const SizedBox(height: 16),
                    DropdownButton<String>(
                      value: selectedAccessibility,
                      items: [
                        'Todos',
                        'Accesible Físicamente',
                        'Accesible Visualmente',
                        'Accesible Auditivamente'
                      ]
                          .map((access) => DropdownMenuItem<String>(
                                value: access,
                                child: Text(access),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedAccessibility = value!;
                        });
                      },
                      hint: const Text('Accesibilidad'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: applyFilters,
                      icon: const Icon(Icons.filter_alt_outlined),
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

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título del curso
            Row(
              children: [
                Icon(Icons.school, color: colors.primaryColor, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    course.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Información detallada con íconos
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.blueGrey[400], size: 20),
                const SizedBox(width: 6),
                Text(
                  '${course.duration} horas',
                  style: TextStyle(color: Colors.blueGrey[700]),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.language, color: Colors.blueGrey[400], size: 20),
                const SizedBox(width: 6),
                Text(
                  'Idioma: ${course.language}',
                  style: TextStyle(color: Colors.blueGrey[700]),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.work_outline, color: Colors.blueGrey[400], size: 20),
                const SizedBox(width: 6),
                Text(
                  'Tipo de Trabajo: ${course.workType}',
                  style: TextStyle(color: Colors.blueGrey[700]),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.accessibility,
                    color: Colors.blueGrey[400], size: 20),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Accesibilidad: ${course.accessibility}',
                    style: TextStyle(color: Colors.blueGrey[700]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Botón de acción
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  showCourseDetails(course, context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Más detalles'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCourseDetails(Course course, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            course.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.language,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Duración',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              TextFormField(
                initialValue: '${course.duration} semanas',
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Nivel',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              TextFormField(
                initialValue: 'Principiante', // Cambia según el nivel del curso
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Cerrar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModuleInstruction(course: course),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Inscribirse'),
            ),
          ],
        );
      },
    );
  }
}
