import 'package:flutter/material.dart';
import '../profile/ProgressBarCustom.dart';

class Education extends StatefulWidget {
  final bool isDarkMode;
  const Education({Key? key, required this.isDarkMode}) : super(key: key);
  @override
  State<Education> createState() => _CompetenceState();
}

final TextStyle lightTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 12,
);

final TextStyle darkTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
);

class _CompetenceState extends State<Education> {


  String description1 = "Licence en technologies de l'information";
  String description2 = "Baccalauréat en 2021";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              _SectionTitleWidget(title: "Éducation :"),
              _EducationSection(
                title: "Institut Supérieur des Études\nTechnologiques de SFAX",
                description: description1,
                icon: Icons.school,
                isDarkMode: widget.isDarkMode,
              ),
              _EducationSection(
                title: "Lycée Jammel\n Jammel, Monastir",
                description: description2,
                icon: Icons.school,
                isDarkMode: widget.isDarkMode,
              ),
              _EducationSection(
                title: "Collège Hay lfatah\n Jammel, Monastir",
                description: "",
                icon: Icons.school,
                isDarkMode: widget.isDarkMode,
              ),
              _EducationSection(
                title: "École primaire Ebn Jzar\n Jammel, Monastir",
                description: "",
                icon: Icons.school,
                isDarkMode: widget.isDarkMode,
              ),
              _SectionTitleWidget(title: "Langues :"),
              _LanguagesSection(isDarkMode: widget.isDarkMode),
            ],
          ),
        ),
      );
  }
}

class _EducationSection extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isDarkMode;

  const _EducationSection({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                icon,
                size: 30,
                color: isDarkMode ? Colors.teal : Color(0xFFCE8F8A),
              ),
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: isDarkMode ? darkTextStyle : lightTextStyle,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 8.0),
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: isDarkMode ? Colors.black : Colors.white,
            ),
            child: Text(
              description,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguagesSection extends StatelessWidget {
  final bool isDarkMode;

  const _LanguagesSection({
    Key? key,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 15.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.teal : Color(0xFFCE8F8A),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBarCustom(skill: 'Arabe', porcentaje: '100', color: Colors.white, barra: 250.0),
              ProgressBarCustom(skill: 'Français', porcentaje: '70', color: Colors.white, barra: 250.0),
              ProgressBarCustom(skill: 'Anglais', porcentaje: '80', color: Colors.white, barra: 250.0),
              ProgressBarCustom(skill: 'Espagnol', porcentaje: '40', color: Colors.white, barra: 250.0),
            ],
          ),
        ),
      ],
    );
  }
}

class LanguageItem extends StatelessWidget {
  final String language;
  final int proficiency;

  const LanguageItem({
    Key? key,
    required this.language,
    required this.proficiency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Text(
          '$proficiency%',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class _SectionTitleWidget extends StatelessWidget {
  final String title;

  const _SectionTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.red.shade200,
          fontSize: 18,
        ),
      ),
    );
  }
}
