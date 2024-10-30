import 'package:abilityconnect/responsive.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    return Scaffold(
        body: Responsive(
      mobile: Mobile(colors: colors),
      desktop: Desktop(colors: colors),
    ));
  }
}

class Desktop extends StatefulWidget {
  const Desktop({
    super.key,
    required this.colors,
  });

  final ThemeData colors;

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  ScrollController controllerTrabajos = ScrollController();
  double desplazamiento = 300.0;
  ScrollController controllerRemotoso = ScrollController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                                          color: widget
                                              .colors.colorScheme.secondary,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'jhonatan',
                                        style: TextStyle(
                                          color:
                                              widget.colors.colorScheme.primary,
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
                            SizedBox(
                              width: 250,
                              child: LinearProgressIndicator(
                                value: 0.51,
                                backgroundColor: Colors.grey[800],
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    widget.colors.primaryColor),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Text(
                                  'Tu perfil está al 51%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'completar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Icon(Icons.search,
                                        color: Colors.white70),
                                  ),
                                  const Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Buscar aquí',
                                        hintStyle:
                                            TextStyle(color: Colors.white70),
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    decoration: BoxDecoration(
                                      color: widget.colors.primaryColor,
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Últimos trabajos',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: widget.colors.colorScheme.onSurface,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ClipOval(
                          child: IconButton(
                              onPressed: () {
                                controllerTrabajos.animateTo(
                                  controllerTrabajos.offset - desplazamiento,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              icon: Icon(
                                Icons.arrow_circle_left_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 30,
                              )),
                        ),
                        IconButton(
                            onPressed: () {
                              controllerTrabajos.animateTo(
                                controllerTrabajos.offset + desplazamiento,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: Icon(
                              Icons.arrow_circle_right_outlined,
                              size: 30,
                              color: Theme.of(context).colorScheme.secondary,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 300,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: ListView.builder(
                  controller: controllerTrabajos,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return JobCard(
                      image:
                          'https://www.keyweo.com/wp-content/uploads/2022/03/el-logo-g-de-google.png',
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trabajos remotos',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: widget.colors.colorScheme.onSurface,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              controllerRemotoso.animateTo(
                                controllerRemotoso.offset - desplazamiento,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: Icon(
                              color: Theme.of(context).colorScheme.secondary,
                              Icons.arrow_circle_left_outlined,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {
                              controllerRemotoso.animateTo(
                                controllerRemotoso.offset + desplazamiento,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 30,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: 300,
                child: ListView.builder(
                  controller: controllerRemotoso,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return JobCard(
                      image:
                          'https://images.store.crowdstrike.com/9748z14dd5zg/3NqsFeaycaa7tnFCIdUjjT/9e6962c51915cf4ef6d5325c38fc2895/Cloudflare_icon_square.png',
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            child: CardHorizontal(),
          ),
        ],
      ),
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({
    super.key,
    required this.colors,
  });

  final ThemeData colors;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF0A0E21),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey[300],
                              child: Text(
                                'JJ',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
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
                        SizedBox(height: 10),
                        SizedBox(
                          width: 250,
                          child: LinearProgressIndicator(
                            value: 0.51,
                            backgroundColor: Colors.grey[800],
                            valueColor: AlwaysStoppedAnimation<Color>(
                                colors.primaryColor),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tu perfil está al 51%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 8),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'completar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child:
                                    Icon(Icons.search, color: Colors.white70),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Buscar aquí',
                                      hintStyle:
                                          TextStyle(color: Colors.white70),
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  color: colors.primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
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
                        SizedBox(width: 16),
                      ],
                    ),
                    CardHorizontal(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
          Text(
            'Últimos trabajos',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: colors.colorScheme.onSurface,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return JobCard(
                  image:
                      'https://www.keyweo.com/wp-content/uploads/2022/03/el-logo-g-de-google.png',
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Trabajos remotos',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: colors.colorScheme.onSurface,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return JobCard(
                  image:
                      'https://www.keyweo.com/wp-content/uploads/2022/03/el-logo-g-de-google.png',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CardHorizontal extends StatelessWidget {
  const CardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);
    return Container(
      height: 350,
      width: 900,
      margin: const EdgeInsets.only(top: 200),
      color: Colors.transparent,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 350,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Responsive(
                  mobile: Container(
                    width: 900,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: colors.cardColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/loading.gif',
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/loading.gif',
                                    width: 300,
                                    height: 250,
                                  );
                                },
                                image:
                                    'https://www.thomas-krenn.com/redx/tools/mb_image.php/ct.X47PPA/cid.ya88f4033624f2f7c/Microsoft.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Company Name $i",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "This is a brief description about the company, its values, "
                                "and how it supports inclusive hiring practices.",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text("See open positions"),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: const [
                                  Icon(Icons.location_on, size: 16),
                                  SizedBox(width: 5),
                                  Text("Location"),
                                  SizedBox(width: 15),
                                  Icon(Icons.people, size: 16),
                                  SizedBox(width: 5),
                                  Text("20,000+"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  desktop: Container(
                    width: 900,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: colors.cardColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/loading.gif',
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/loading.gif',
                                    width: 300,
                                    height: 250,
                                  );
                                },
                                image:
                                    'https://www.thomas-krenn.com/redx/tools/mb_image.php/ct.X47PPA/cid.ya88f4033624f2f7c/Microsoft.png'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Company Name $i",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "This is a brief description about the company, its values, "
                                  "and how it supports inclusive hiring practices.",
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text("See open positions"),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: const [
                                    Icon(Icons.location_on, size: 16),
                                    SizedBox(width: 5),
                                    Text("Location"),
                                    SizedBox(width: 15),
                                    Icon(Icons.people, size: 16),
                                    SizedBox(width: 5),
                                    Text("20,000+"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          );
        }).toList(),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  String image;
  JobCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 350,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: colors.onSurface.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: image,
                  fit: BoxFit.contain,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/loading.gif',
                      width: 300,
                      height: 250,
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Data Center Technician",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Microsoft",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Detalles del trabajo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("In-Person", style: TextStyle(fontSize: 12)),
              Icon(Icons.circle, size: 4, color: Colors.grey),
              Text("Multiple", style: TextStyle(fontSize: 12)),
              Icon(Icons.circle, size: 4, color: Colors.grey),
              Text("2 weeks ago", style: TextStyle(fontSize: 12)),
            ],
          ),
          const Divider(height: 20, thickness: 1),
          // Requisitos del trabajo
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("• Full Time Job"),
              Text("• 2+ years work experience"),
              Text("• High school (or GED)"),
              Text(
                  "• Prefers skills in Windows Servers, IT Infrastructure,..."),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                ),
                child: const Text("Aplicar"),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  side: BorderSide(color: colors.primary),
                ),
                child: const Text("Guardar"),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_down_alt_outlined),
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
