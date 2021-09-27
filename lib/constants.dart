import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapbox/MapMarkerModel.dart';

const NAME_ID = 'salmafathi';
const MAPBOX_ACCESS_TOKEN = 'pk.eyJ1Ijoic2FsbWFmYXRoaSIsImEiOiJja3UxaGRtN3owNWl2MzFvNmJrNzY5bm03In0.BUVEmafZayRudMfJsxqn4A' ;
const MAPBOX_STYLE = 'mapbox/dark-v10';
final MARKER_COLOR =  Colors.red.shade900;

final myLocation = LatLng(28.033333	,31.233334);

final locations = [
  LatLng(31.205753	,29.924526),
  LatLng(30.013056	,31.208853),
  LatLng(31.037933, 31.381523),
  LatLng(27.180134, 31.189283),
];

final mapMarkers = [
  MapMarkerModel(
      image: 'assets/images/smart.jpg',
      address: 'B148, Smart Village -6 October',
      title: 'ITI Smart Village',
      phone:'02 35355656',
      location: locations[1]),
  MapMarkerModel(
      image: 'assets/images/itialex.jpg',
      address: ' محمود سلامة، كوم الدكة غرب، العطارين، الإسكندرية',
      title: 'ITI Alex',
      phone:'03 3906924',
      location: locations[0]),

  MapMarkerModel(
      image: 'assets/images/itimans.jpg',
      address: 'ميت خميس وكفر الموجي، المنصورة، الدقهلية',
      title: 'ITI Mansoura',
      phone:'050 2226772',
      location: locations[2]),

  MapMarkerModel(
      image: 'assets/images/itiasut.jpg',
      address: 'امتداد ش نايلة خاتون , ديروط ',
      title: 'ITI Assiut',
      phone:'088 2374264',
      location: locations[3]),

];