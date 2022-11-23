import 'package:cobaprojek2/detail.dart';
import 'package:cobaprojek2/helper/data_source.dart';
import 'package:cobaprojek2/helper/model.dart';
import 'package:cobaprojek2/home.dart';
import 'package:cobaprojek2/profil.dart';
import 'package:flutter/material.dart';
import 'helper/image.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';


class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}
int curentIndex = 0;
class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [

      Container(
        color: Colors.black,
        padding: EdgeInsets.all(8),
        child: FutureBuilder(
            future: StarDataSource.instance.loadCharcters(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
              if(snapshot.hasError){
                return _buildErrorSection();
              }
              if (snapshot.hasData) {
                ResultModel resultModel =
                ResultModel.fromJson(snapshot.data);
                return _buildSuccessSection(resultModel);
              }
              return _buildLoadingSection();
            }
        ),
      ),
      Profil()
    ];
    return SafeArea(
          // home : const Home()
          child: Scaffold(
            appBar: AppBar(
              title: Text('STAR WARS',style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold)),
              backgroundColor: Colors.black,
              centerTitle: true,
              automaticallyImplyLeading: true,
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
            body: widgets[curentIndex],
            bottomNavigationBar: ConvexAppBar(
              backgroundColor: Colors.black,
              activeColor: Colors.yellow,
              color: Colors.yellowAccent,
              items: [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.people, title: 'Profile'),
              ],
              initialActiveIndex: 0,
              onTap: (int i){
                setState(() {
                  curentIndex = i;
                });
              }
            ),
          )
    );
  }

  Widget _buildErrorSection(){
    return Text("error");
  }

  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(ResultModel data) {
    return GridView.builder(
      itemCount: data.results?.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index){
        final Results? results = data.results?[index];
        final Gambar gambar = GambarList[index];
        return InkWell(

          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailCharacter(result : results, gambars: gambar)));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Card(
              color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40), // if you need this
                  side: BorderSide(
                    color: Colors.yellow.withOpacity(0.2),
                    width: 3,
                  ),
                ),
              child: SingleChildScrollView(
                    child: Container(
                      // height: (MediaQuery
                      //     .of(context)
                      //     .size
                      //     .height) ,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Center(
                              //child: Image.network( gambar.imageUrls,width: 200, height: 130),
                             child: Image.asset(gambar.imageUrls,width: 200, height: 130),
                            ),
                          ),
                          Center(
                            child: Text("${data.results?[index].name}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.yellow)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
