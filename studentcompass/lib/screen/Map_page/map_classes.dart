import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  String name, description;
  double latitude, longtitude;
  Seller seller;
  MarkerId id;
  late BitmapDescriptor icon;
  Place(
      {required this.name,
      required this.id,
      required this.description,
      required this.seller,
      required this.latitude,
      required this.longtitude}) {
    this.getCostumeMarker();
  }

  getCostumeMarker() async {
    this.icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'mapAssets/supplyMarker.png');
  }
}

class RentalHome extends Place {
  bool booked;
  void getCostumeMarker() async {
    if (booked) {
      icon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration.empty, 'mapAssets/rentalMarker.png');
    } else {
      icon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration.empty, 'mapAssets/rentalMarkerBooked.png');
    }
  }

  RentalHome(
      {required super.name,
      required super.id,
      required super.description,
      required super.seller,
      required super.latitude,
      required super.longtitude,
      required this.booked}) {
    //getCostumeMarker();
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
      required super.latitude,
      required super.longtitude}) {
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
      required super.latitude,
      required super.longtitude}) {
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
      required super.latitude,
      required super.longtitude}) {
    getCostumeMarker();
  }
}

class Seller {
  String name, email, mobile;

  Seller({required this.name, required this.email, required this.mobile});
}
