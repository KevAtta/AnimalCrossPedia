import 'package:animalcrossingpedia/provider/get_bugs.dart';
import 'package:animalcrossingpedia/provider/get_fish.dart';
import 'package:animalcrossingpedia/provider/get_music.dart';
import 'package:animalcrossingpedia/widgets/bugs_and_fish/bugs.dart';
import 'package:animalcrossingpedia/widgets/favorite/favorite_villager.dart';
import 'package:animalcrossingpedia/widgets/profile_card/profile_card.dart';
import 'package:animalcrossingpedia/widgets/songs/songs.dart';
import 'package:flutter/material.dart';
import 'widgets/bugs_and_fish/fish.dart';
import 'widgets/bugs_and_fish/fish_bugs_menu.dart';
import 'widgets/home/homepage.dart';
import 'provider/get_villagers.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<GetDataVillagers>(create: (_) => GetDataVillagers()),
          ChangeNotifierProvider<GetDataFish>(create: (_) => GetDataFish()),
          ChangeNotifierProvider<GetDataBugs>(create: (_) => GetDataBugs()),
          ChangeNotifierProvider<GetDataMusic>(create: (_) => GetDataMusic()),
        ],
        child: MaterialApp(
          title: 'Animal crossing',
          theme: ThemeData(
            primarySwatch: Colors.amber,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.brown,
                secondary: const Color.fromARGB(255, 37, 119, 34),
                tertiary: const Color.fromARGB(172, 226, 202, 202)),
          ),
          home: const AnimalCrossing(),
          routes: {
            ProfileCard.routeName: (ctx) => ProfileCard(),
            Fish.routeName: (ctx) => const Fish(),
            FavoriteVillagers.routeName: (ctx) => const FavoriteVillagers(),
            Bugs.routeName: (ctx) => const Bugs(),
            Songs.routeName: (ctx) => const Songs(),
          },
          debugShowCheckedModeBanner: false,
        ));
  }
}

class AnimalCrossing extends StatefulWidget {
  const AnimalCrossing({super.key});

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
      color: const Color.fromARGB(172, 226, 202, 202),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: HomePage(),
    ),
    const FishBugsMenu(),
    const Songs(),
    const FavoriteVillagers(),
  ];

  @override
  Widget build(BuildContext context) {
    final villagers = Provider.of<GetDataVillagers>(context, listen: false);
    final fishs = Provider.of<GetDataFish>(context, listen: false);
    final bugs = Provider.of<GetDataBugs>(context, listen: false);
    final songs = Provider.of<GetDataMusic>(context, listen: false);
    villagers.fetchVillagers();
    fishs.fetchFish();
    bugs.fetchBugs();
    songs.fetchMusic();


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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            label: 'Abitanti',
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
