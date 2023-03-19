import 'package:animalcrossingpedia/widgets/profile_card/profile_card.dart';
import 'package:flutter/material.dart';
import 'widgets/bugs_and_fish/fish.dart';
import 'widgets/bugs_and_fish/fish_bugs_menu.dart';
import 'widgets/home/homepage.dart';
import '../../provider/api.dart' as api;
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<api.GetData>(create: (_) => api.GetData())
        ],
        child: MaterialApp(
          title: 'Animal crossing',
          theme: ThemeData(
            primarySwatch: Colors.amber,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.brown,
                secondary: Color.fromARGB(255, 37, 119, 34),
                tertiary: Color.fromARGB(172, 226, 202, 202)),
          ),
          home: AnimalCrossing(),
          routes: {
            ProfileCard.routeName: (ctx) => ProfileCard(),
            Fish.routeName: (ctx) => Fish(),
          },
          debugShowCheckedModeBanner: false,
        ));
  }
}

class AnimalCrossing extends StatefulWidget {
  @override
  AnimalCrossingPedia createState() => AnimalCrossingPedia();
}

class AnimalCrossingPedia extends State<AnimalCrossing> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    Container(
      color: Color.fromARGB(172, 226, 202, 202),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      // lista delle carte contenente le informazioni
      child: HomePage(),
    ),
    const FishBugsMenu(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeContext = context;
    final villagers = Provider.of<api.GetData>(context);
    villagers.fetchVillagers();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Center(
          child: Image.asset(
            './assets/logo2.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
      // container che contiene tutta l'applicazione
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            label: 'Casetta',
            icon: Icon(
              Icons.home,
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pets,
                color: Colors.lightGreen,
              ),
              label: 'Pesci e Insetti'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.music_note,
                color: Colors.lightGreen,
              ),
              label: 'Musiche'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                color: Colors.lightGreen,
              ),
              label: 'Preferiti'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.lightGreen,
        selectedLabelStyle: const TextStyle(
          color: Colors.green,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.lightGreen,
        ),
      ),
    );
  }
}
