import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:mapbox/MapMarkerModel.dart';
import 'constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final pageController = PageController();
  final mapController = MapController();


  @override
  Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: (){
                  mapController.move(myLocation, 6)  ;
                }, icon: Icon(Icons.my_location_outlined))
              ],
              title: Text('ITI Branches',style: Theme.of(context).textTheme.headline6,),
            ),
            body: Stack(
              children: [
                FlutterMap(
                  mapController: mapController,
                  options: MapOptions(minZoom: 5 , maxZoom: 15, zoom: 6,center: myLocation),
                  nonRotatedLayers: [
                    TileLayerOptions(
                      urlTemplate: 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                      additionalOptions: {
                        'accessToken': MAPBOX_ACCESS_TOKEN ,
                        'id' : MAPBOX_STYLE,
                      },
                    ),
                    MarkerLayerOptions(
                      markers: buildMarkers(),)
                  ],

                ),

                //page View
                Positioned(left: 10, right: 10, bottom: 20, top: MediaQuery.of(context).size.height *0.6,
                  child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=> infoBanner(mapMarkers[index]),
                      controller: pageController,
                      itemCount: mapMarkers.length,
                  ),

                )
              ],
            ),
          );
  }

  List<Marker> buildMarkers(){
    List<Marker> finalMarkersList = [] ;
    for(int i = 0 ; i < mapMarkers.length ; i++)
      {
        finalMarkersList.add(
            Marker(
            width: 35, height: 35,
            point: mapMarkers[i].location ,
            builder: (context){
              return GestureDetector(
                onTap: (){
                  pageController.animateToPage(i, duration: const Duration(milliseconds: 500), curve: Curves.elasticOut);
                },
                child: pointedMarker(),
              );
            }
        )
        );
      }
    return finalMarkersList ;
  }

  Widget pointedMarker (){
    return Center(
      child: AnimatedContainer(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
          ),
          width: 20, height: 20,
          duration: Duration(milliseconds: 500),
          child: unPointedMarker()
      ),
    );
  }

  Widget unPointedMarker(){
    return AnimatedContainer(duration: Duration(milliseconds: 500),
    child: Image.asset('assets/images/itilogo.png',height: 10, width: 10,));
  }

  Widget infoBanner(MapMarkerModel model){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: Colors.black26,
        child: Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(model.image,fit: BoxFit.cover,),
            ),),
            Expanded(child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(model.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  Text(model.address,textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),
                  const SizedBox(height: 10,),
                  MaterialButton(onPressed: (){
                    launch('tel://${model.phone}');
                  },child: Text('call'),color: Colors.red.shade900,minWidth: 120,)
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
