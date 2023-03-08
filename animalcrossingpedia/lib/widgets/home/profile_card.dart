import 'package:flutter/material.dart';

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
    final villager =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

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
                            child: Text(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
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
                            child: Text(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
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
                            child: Text(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
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
                            child: Text(
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
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
          )
        ],
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

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Theme.of(context).colorScheme.secondary,
    //     title: Center(
    //       child: Image.asset(
    //         './assets/logo.png',
    //         width: 100,
    //         height: 100,
    //       ),
    //     ),
    //   ),
    //   body: Stack(
    //     alignment: const Alignment(0.6, 0.6),
    //     children: [
    //       Container(
    //         height: MediaQuery.of(context).size.height / 3,
    //         color: Color(villager['colore_carta']),
    //       ),
    //       Positioned(
    //         top: MediaQuery.of(context).size.height / 6,
    //         left: 0,
    //         right: 0,
    //         child: Image.network(
    //           villager['img_profilo'],
    //           height: MediaQuery.of(context).size.height / 3,
    //           width: MediaQuery.of(context).size.width,
    //         ),
    //       ),
    //     ],
    //   ),
    //   bottomNavigationBar: BottomNavigationBar(
    //     backgroundColor: Theme.of(context).colorScheme.primary,
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Icon(
    //           Icons.home,
    //           color: Colors.white,
    //         ),
    //         label: 'casetta',
    //       ),
    //       BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.all_out,
    //             color: Colors.white,
    //           ),
    //           label: 'pesciolino'),
    //     ],
    //   ),
    // );
  }
}
