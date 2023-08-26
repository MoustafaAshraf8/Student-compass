import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  String name, description;
  double lat, long;
  Seller seller;
  MarkerId id;
  late BitmapDescriptor icon;
  Place(
      {required this.name,
      required this.id,
      required this.description,
      required this.seller,
      required this.lat,
      required this.long});
}

class RentalHome extends Place {
  getCostumeMarker() async {
    icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'mapAssets/rentalMarker.png');
  }

  RentalHome(
      {required super.name,
      required super.id,
      required super.description,
      required super.seller,
      required super.lat,
      required super.long}) {
    getCostumeMarker();
  }
}

class Resto extends Place {
  getCostumeMarker() async {
    icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'mapAssets/restoMarker2.png');
  }

  Resto(
      {required super.name,
      required super.id,
      required super.description,
      required super.seller,
      required super.lat,
      required super.long}) {
    getCostumeMarker();
  }
}

class Pharma extends Place {
  getCostumeMarker() async {
    icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'mapAssets/pharmaMarker.png');
  }

  Pharma(
      {required super.name,
      required super.id,
      required super.description,
      required super.seller,
      required super.lat,
      required super.long}) {
    getCostumeMarker();
  }
}

class Supply extends Place {
  getCostumeMarker() async {
    icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'mapAssets/supplyMarker.png');
  }

  Supply(
      {required super.name,
      required super.id,
      required super.description,
      required super.seller,
      required super.lat,
      required super.long}) {
    getCostumeMarker();
  }
}

class Seller {
  String name, email, mobile;

  Seller({required this.name, required this.email, required this.mobile});
}
