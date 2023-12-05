import 'package:ayaomrani/portfilio/text_style.dart';
import 'package:flutter/material.dart';

class Experience extends StatefulWidget {
  final bool isDarkMode;
  const Experience({Key? key, required this.isDarkMode}) : super(key: key);
  @override
  _EtudeState createState() => _EtudeState();
}

class _EtudeState extends State<Experience> {


  String description1 = "Institut supérieur des études technologiques de sfax  | Juillet – aout 2023""\n""Institut Superieure des etudestechnologique de sfax""\n""•	Développement et création d'une application web Degital Banking ""\n""•	Mise en place d'un système CRUD pour les services bancaires";
  String description2 = "Tunisie Telecom  | 17 janvier 2022 – 12 février 2022 ""\n""•	Gestion des besoins des clients.""\n""•	Résolution rapide des problèmes des clients.""\n""•	Collaboration avec l'équipe technique sur des aspects techniques sur le terrain.";

  String description5 = "Membre croissant rouge de Monastir depuis 2017, guide de farfadets depuis 2019.";
  String description6 = "Membre actif du Club Leo depuis 2019, leader d'initiatives communautaires et humanitaires.";



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0), // Ajout du padding global
      child: Scaffold(
        backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,

        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Expériences professionnelles",
                  style: headerTextStyle.copyWith(
                    color: Colors.teal,
                    fontSize: 18,
                  ),
                ),
              ),
              _itemWidget(
                "STAGE DE PERFECTIONNEMENT",
                description1,
              ),
              _itemWidget(
                "STAGE D’INITIATION ",
                description2,
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                "Expériences Associatives",
                style: headerTextStyle.copyWith(
                  color: Colors.teal,
                  fontSize: 18,
                ),
              ),
              _itemWidget(
                "croissant rouge de Tunis ",
                description5,
              ),
              _itemWidget(
                "Leo Club Monastir",
                description6,
              ),
              SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemWidget(title, description) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 15,
                width: 7,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[200],
                ),
              ),
              Text(title, style: subHeaderTextStyle)
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 6, top: 10),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 2,
                  color: Colors.red.shade200,
                ),
              ),
            ),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: widget.isDarkMode ? Colors.black : Colors.white,
              ),
              child: Text(
                description,
                style: TextStyle(
                  color: widget.isDarkMode  ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
