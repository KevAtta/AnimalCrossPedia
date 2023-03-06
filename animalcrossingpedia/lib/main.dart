// import 'package:animalcrossingpedia/provider/api.dart';
import 'package:flutter/material.dart';
import 'provider/api.dart' as api;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal crossing',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Colors.amber,
            secondary: Color.fromARGB(255, 208, 196, 196),
            tertiary: Colors.brown.shade300),
      ),
      home: AnimalCrossing(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimalCrossing extends StatefulWidget {
  @override
  AnimalCrossingPedia createState() => AnimalCrossingPedia();
}

class AnimalCrossingPedia extends State<AnimalCrossing> {
  List<dynamic> villagers = [];

  @override
  void initState() {
    super.initState();
    loadVillagers();
  }

  Future<void> loadVillagers() async {
    // try-catch per l'ottenimento delle carte dalla chiamata api
    try {
      final List<dynamic> listVillagers = await api.fetchVillagers();
      setState(() {
        villagers = listVillagers;
      });
    } catch (e) {
      // Handle error
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // container che contiene tutta l'applicazione
      body: Container(
        color: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        // lista delle carte contenente le informazioni
        child: ListView.builder(
          itemCount: villagers.length,
          itemBuilder: (context, index) {
            // padding per
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              // costruzione della singola carta con elevazione 5, colore di background preso dall'api
              child: Card(
                elevation: 5,
                color: Color(villagers[index]['colore_carta']),
                // padding esterno (la distanza fra i margini dello schermo e le schede)
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                  // Sizebox definisce la grandezza della row
                  child: SizedBox(
                    height: 65,
                    // questa è la riga all'interno della carta, che conterrà le varie informazioni
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // l'id
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text(
                                '#${villagers[index]['id']}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                radius: 50,
                                child: Image.network(
                                  villagers[index]['img_icona'],
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // l'avatar con uno stile da immagine del profilo
                        // altre informazioni come nome e il giorno di nascita incolonnate
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  villagers[index]['nome'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 15),
                                Text(villagers[index]['birthday-string']),
                              ],
                            ),
                          ],
                        ),
                        // infine un icona per indicare che l'oggetto è cliccabile
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}