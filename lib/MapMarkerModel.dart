import 'package:latlong2/latlong.dart';

class MapMarkerModel {
  final String image;
  final String address;
  final String title;
  final LatLng location ;
  final String phone ;

  MapMarkerModel({required this.phone,required this.image, required this.address, required this.title, required this.location});
}