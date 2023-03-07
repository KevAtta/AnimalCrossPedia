import 'package:animalcrossingpedia/widgets/home/profile_card.dart';
import 'package:flutter/material.dart';
import './widgets/home/animal_crossing_homepage.dart';
import '../../provider/api.dart' as api;

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
            primary: Color.fromARGB(255, 146, 124, 56),
            secondary: Color.fromARGB(255, 37, 119, 34),
            tertiary: Color.fromARGB(172, 226, 202, 202)),
      ),
      home: AnimalCrossing(),
      routes: {
        ProfileCard.routeName: (ctx) => ProfileCard(),
      },
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Center(
          child: Image.asset('./assets/logo.png', 
            width: 100, 
            height: 100,
          ),
        ),
      ),
      drawer: Drawer(),
      // container che contiene tutta l'applicazione
      body: Container(
        color: Theme.of(context).colorScheme.tertiary,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        // lista delle carte contenente le informazioni
        child: AnimalCrossingHomePage(villagersList: villagers),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'casetta',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.all_out,
                color: Colors.white,
              ),
              label: 'pesciolino'),
        ],
      ),
    );
  }
}