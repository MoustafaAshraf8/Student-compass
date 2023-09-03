import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';
import 'map_classes.dart';
import './makeMarker.dart';
import '../../schema/rentalHomeSchema/getRentalHome.dart';
import '../../schema/restaurantSchema/getRestaurant.dart';
import '../../schema/pharmacySchema/getPharmacy.dart';
import '../../schema/supplySchema/getSupply.dart';
import './FloatingBtn.dart';

// 31.211029964261222, 29.937032121439096
// 31.233049781964777, 29.969991105710832
// 31.22805513419555, 29.942273991797162 balbaa
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var markers = HashSet<Marker>();
  late BitmapDescriptor markerIcon;

  List<RentalHome> futureRental = [];
  List<Resto> futureRestaurant = [];
  List<Pharma> futurePharmacy = [];
  List<Supply> futureSupply = [];

  double uniLat = 30.0;
  double uniLong = 30;
  @override
  void initState() {
    super.initState();
    loadRentalHome();
  }

  void loadRentalHome() async {
    if (futureRental.isEmpty) {
      futureRental = await getRentalHome();
    }
    setState(() {
      markers = makeMarkers(futureRental, uniLat, uniLong, context,
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
    });
  }

  void loadRestaurant() async {
    if (futureRestaurant.isEmpty) {
      futureRestaurant = await getRestaurant();
    }
    setState(() {
      markers = makeMarkers(futureRestaurant, uniLat, uniLong, context,
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));
    });
  }

  void loadPharmacy() async {
    if (futurePharmacy.isEmpty) {
      futurePharmacy = await getPharmacy();
    }
    setState(() {
      markers = makeMarkers(futurePharmacy, uniLat, uniLong, context,
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange));
    });
  }

  void loadSupply() async {
    if (futureSupply.isEmpty) {
      futureSupply = await getSypply();
    }
    setState(() {
      markers = makeMarkers(futureSupply, uniLat, uniLong, context,
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Map"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          futureRental.isNotEmpty
              ? GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(31.2001, 29.9187),
                    zoom: 10,
                  ),
                  onMapCreated: (GoogleMapController googleMapController) {
                    loadRentalHome();
                  },
                  markers: markers,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              FloatingBtn(
                  function: loadRestaurant,
                  icon: const Icon(Icons.food_bank_rounded)),
              const SizedBox(
                height: 10,
              ),
              FloatingBtn(
                  function: loadPharmacy, icon: Icon(Icons.local_pharmacy)),
              const SizedBox(
                height: 10,
              ),
              FloatingBtn(function: loadRentalHome, icon: Icon(Icons.home)),
              const SizedBox(
                height: 10,
              ),
              FloatingBtn(
                  function: loadSupply, icon: Icon(Icons.shopify_outlined))
            ],
          ),
        ],
      ),
    );
  }
}
