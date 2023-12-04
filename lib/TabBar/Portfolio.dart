import 'package:flutter/material.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Portfolio> {
  bool isDarkMode = false;

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        shadowColor: isDarkMode ? Colors.white : Colors.black,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              color: isDarkMode ? Colors.white : Colors.black,
              icon: isDarkMode
                  ? Icon(Icons.sunny, size: 40)
                  : Icon(Icons.dark_mode_outlined, size: 40),
              onPressed: toggleDarkMode,
            ),
          )
        ],
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        title: Text(
          "Mon Portfolio ",
          style: TextStyle(
            color: Colors.red.shade300,
            fontSize: 28,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 1.5,
          children: [
            buildItemPortfilio('Degital Banking', 'assets/degital_banking.png', 'Application qui permet au client de gerer leur compte bancaire ecrit en angular et spring boot '),
            buildItemPortfilio('Gestion de Stock ', 'assets/gestion_de_stock.png', 'Site web qui permet au client de gerer le produit ajouter modifier supprimer et gerer la quantite ecrit en "Angular" et "Node" '),
            buildItemPortfilio('Online shopping', 'assets/online_shopping.png', ' Online Shopping qui permet le client de acheter des produit en ligne "React Js "'),
            buildItemPortfilio('Planner Agency', 'assets/planner_agency.png', 'Une application ecrit en "Angular" et "spring boot"  qui permet la planification, la coordination et l exécution d événements spéciaux '),
            buildItemPortfilio('Wedding planner ', 'assets/wedding_planner.png', ' site de planification de mariage ecrit en html css et js '),
            buildItemPortfilio('K-POP', 'assets/Kpop.png', 'c est un site permet d" engager les fans et fournir des informations pertinentes Actualités Calendrier des Événements Boutique en Ligne Classements et Awards '),
            const SizedBox(height: 5),
          ],

        ),
      ),
    );
  }

  Widget buildItemPortfilio(String title, String img, String description) {
    return GestureDetector(
      onTap: () {
        // Afficher une alerte avec le titre, l'image et la description
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(img, fit: BoxFit.cover),
                  const SizedBox(height: 10),
                  Text(description),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Fermer'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade200),
                    // Vous pouvez ajuster d'autres propriétés ici
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDarkMode ? Color(0xFFA7E0E0) :Color(0xFFE9C8CE),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(img, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
