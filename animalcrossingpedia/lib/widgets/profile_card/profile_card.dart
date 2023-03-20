import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/get_villagers.dart';

class ProfileCard extends StatefulWidget {
  static const routeName = '/profile-villager';

  @override
  State<ProfileCard> createState() => ProfileCardState();
}

class ProfileCardState extends State<ProfileCard> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final villager = ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: width,
              height: height * 0.3,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Color(villager['colore_carta']),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 5,
            child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Positioned(
            top: 70,
            left: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "#${villager['id']}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  villager['nome'],
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Positioned(
            top: (height * 0.2),
            left: (width / 2) - height / 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                villager['img_profilo'],
                height: height / 5,
                width: height / 5,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: height / 3.0,
            child: Container(
              width: width * 0.8,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Color(villager['colore_carta']),
                    width: 1.5,
                  ),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Sesso:',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              villager['genere'],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Hobby:',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              villager['hobby'],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Compleanno:',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              villager['birthday-string'],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Specie:',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              villager['specie'],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height / 6,
            child: Container(
              width: width * 0.8,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Color(villager['colore_carta']),
                      width: 1.5,
                    ),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Frase detta:"),
                        Text(villager['frase']),
                      ],
                    ),
                  )),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Consumer<GetDataVillagers>(
              builder: (ctx, villagerFav, child) =>
                IconButton(
                icon: villager['favoriti'] ? const Icon(Icons.star) : const Icon(Icons.star_border), 
                color: Colors.amber,
                onPressed: () => { villagerFav.addVillagerToFavorite(villager['id']) },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
