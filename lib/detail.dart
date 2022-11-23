import 'package:cobaprojek2/helper/model.dart';
import 'package:flutter/material.dart';
import 'helper/data_source.dart';
import 'helper/image.dart';


class DetailCharacter extends StatefulWidget {
  final Results? result;
  final Gambar? gambars ;
  const DetailCharacter({Key? key, required this.result,this.gambars}) : super(key: key);

  @override
  State<DetailCharacter> createState() => _DetailCharacterState();
}

class _DetailCharacterState extends State<DetailCharacter> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${widget.result?.name}".toUpperCase() ,style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold),),
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.yellow,
            ),
          ),
        ),
          body: Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 200, height: 400,
                   // child: Image.network(widget.gambars!.imageUrls),
                   child: Image.asset(widget.gambars!.imageUrls),
                ),
                Container(
                  child: Center(
                    child: Text("Biodata : ",style: TextStyle(fontSize: 24,color: Colors.yellow)),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Heigth       : ${widget.result!.height} Centimeters",style: TextStyle(fontSize: 20,color: Colors.yellow)),
                      Text("Mass         : ${widget.result!.mass} Kilograms",style: TextStyle(fontSize: 20, color: Colors.yellow)),
                      Text("Hair Color : ${widget.result!.hairColor}",style: TextStyle(fontSize: 20,color: Colors.yellow)),
                      Text("Gender      : ${widget.result!.gender} ",style: TextStyle(fontSize: 20,color: Colors.yellow)),
                    ],
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}
