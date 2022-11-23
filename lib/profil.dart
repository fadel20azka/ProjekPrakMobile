import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          width: (MediaQuery
              .of(context)
              .size
              .width),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                child: Image.asset('assets/ifah.png'),
              ),
              Container(
                child: Column(
                  children: [ Text("Syarifah Insan Sekartini",style: TextStyle(fontSize: 24,color: Colors.yellow)),
                  Text("124200082",style: TextStyle(fontSize: 24,color: Colors.yellow)),
                  ]
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: Image.asset('assets/fadel.png'),
              ),
              Container(
                child: Column(
                    children: [ Text("Muhammad Fadel Azka",style: TextStyle(fontSize: 24,color: Colors.yellow)),
                      Text("124200059",style: TextStyle(fontSize: 24,color: Colors.yellow)),
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
