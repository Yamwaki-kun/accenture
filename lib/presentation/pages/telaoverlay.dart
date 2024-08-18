import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Cria uma te
class DrawerTelaCheia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50)),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)),
              const Spacer(),
              IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: const Icon(Icons.language)),
              const Text(
                "Brazil ⌄",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(right: 20)),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 40)),
          const Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              Text(
                'Serviços',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  height: 0,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Text('>',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 0,
                    color: Colors.white,
                  )),
              Padding(padding: EdgeInsets.only(right: 20)),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              Text(
                'Sobre a Accenture',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  height: 0,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Text('>',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 0,
                    color: Colors.white,
                  )),
              Padding(padding: EdgeInsets.only(right: 20)),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              Text(
                'Sobre a Accenture',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  height: 0,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Text('>',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 0,
                    color: Colors.white,
                  )),
              Padding(padding: EdgeInsets.only(right: 20)),
            ],
          ),
          Spacer(),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 15,
                  height: 0,
                  color: Colors.white,
                ),
              ),
              Spacer(),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 15)),
          const Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              Text(
                'Careers',
                style: TextStyle(
                  fontSize: 15,
                  height: 0,
                  color: Colors.white,
                ),
              ),
              Spacer(),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 15)),
          const Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              Text(
                'Locations',
                style: TextStyle(
                  fontSize: 15,
                  height: 0,
                  color: Colors.white,
                ),
              ),
              Spacer(),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              Icon(
                FontAwesomeIcons.linkedin,
                color: Colors.white,
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Icon(
                FontAwesomeIcons.facebook,
                color: Colors.white,
              ),
              Padding(padding: EdgeInsets.only(left: 20)),
              Icon(
                FontAwesomeIcons.instagram,
                color: Colors.white,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 130)),
            ],
          ),
        ],
      ),
    );
  }
}
