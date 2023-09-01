import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';

import 'map_classes.dart';
import './makeMarker.dart';
import '../../schema/rentalHomeSchema/getRentalHome.dart';
import '../../schema/restaurantSchema/getRestaurant.dart';
import '../../schema/pharmacySchema/getPharmacy.dart';
//import '../../schema/rentalHomeSchema/RentaHome.dart';

import './FloatingBtn.dart';

// 31.211029964261222, 29.937032121439096
// 31.233049781964777, 29.969991105710832
// 31.22805513419555, 29.942273991797162 balbaa
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

// List<RentalHome> getRentalHomes() {
//   return [
//     RentalHome(
//         name: "150m apartment",
//         id: const MarkerId('1'),
//         description: "2 rooms , 1 restroom , 1 kitchen",
//         seller: Seller(
//             name: "Khamis Adly",
//             email: "khamos@spoting.com",
//             mobile: "011 1927 0023"),
//         latitude: 31.2001,
//         longtitude: 29.9187,
//         booked: false),
//     RentalHome(
//         name: "80m apartment",
//         id: const MarkerId('2'),
//         description: "1 room , 1 restroom, 1 kitchen",
//         seller: Seller(
//             name: "Mohamed Gomaa",
//             email: "gomaa@sporting.com",
//             mobile: "011 1927 0023"),
//         latitude: 31,
//         longtitude: 29,
//         booked: true),
//   ];
// }

// List<Resto> getRestos() {
//   return [
//     Resto(
//         name: 'Balbaa',
//         id: const MarkerId('2'),
//         description: 'meat and fish. Not very good place for vegans',
//         seller: Seller(
//             name: 'Ahmed Balbaa',
//             email: 'balba3@gmail.com',
//             mobile: '01234567890'),
//         lat: 31.22805513419555,
//         long: 29.942273991797162)
//   ];
// }

// List<Pharma> getPharmas() {
//   return [
//     Pharma(
//         name: 'moheyeldin',
//         id: const MarkerId('3'),
//         description: 'pharmacy',
//         seller: Seller(
//             name: 'seller', email: 'pharmacy@gmail.com', mobile: '13567'),
//         lat: 31.219226615854247,
//         long: 29.940665012532833)
//   ];
// }

// List<Supply> getSupplies() {
//   return [
//     Supply(
//         name: 'eltabib wel mohandes',
//         id: const MarkerId('number 1'),
//         description: 'agmad maktaba law mesh ma3ak el drive',
//         seller: Seller(
//             name: 'essam', email: 'eltabib@gmail.com', mobile: '01486564654'),
//         lat: 31.206451266775947,
//         long: 29.92670827788856)
//   ];
// }

class _MapPageState extends State<MapPage> {
  var markers = HashSet<Marker>();
  late BitmapDescriptor markerIcon;

  // List<RentalHome> homes = getRentalHomes();
  // List<Resto> restos = getRestos();
  // List<Pharma> pharmas = getPharmas();
  // List<Supply> supplies = getSupplies();

  late List<RentalHome> futureRental = [];
  late List<Resto> futureRestaurant = [];
  late List<Pharma> futurePharmacy = [];
  late List<Supply> futureSupply = [];
  int test = 0;
  double uniLat = 30.0;
  double uniLong = 30;
  @override
  void initState() {
    super.initState();
    loadRentalHome();
  }

  void loadRentalHome() async {
    futureRental = await getRentalHome();
    setState(() {
      markers = makeMarkers(futureRental, uniLat, uniLong, context,
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
    });
  }

  void loadRestaurant() async {
    futureRestaurant = await getRestaurant();
    setState(() {
      markers = makeMarkers(futureRestaurant, uniLat, uniLong, context,
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue));
    });
  }

  void loadPharmacy() async {
    futurePharmacy = await getPharmacy();
    setState(() {
      markers = makeMarkers(futurePharmacy, uniLat, uniLong, context,
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("MAAAAAAAP NOT FINAAAL"),
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
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.deepPurple,
              //       shape: const CircleBorder(),
              //       padding: const EdgeInsets.all(14) // Background color
              //       ),
              //   onPressed: () {
              //     loadRestaurant();
              //   },
              //   child: const Icon(Icons.food_bank_rounded),
              // ),
              FloatingBtn(
                  function: loadRestaurant,
                  icon: const Icon(Icons.food_bank_rounded)),
              const SizedBox(
                height: 10,
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.deepPurple,
              //       shape: const CircleBorder(),
              //       padding: const EdgeInsets.all(14) // Background color
              //       ),
              //   onPressed: () {
              //     loadPharmacy();
              //   },
              //   child: const Icon(
              //     Icons.local_pharmacy,
              //   ),
              // ),
              FloatingBtn(
                  function: loadPharmacy, icon: Icon(Icons.local_pharmacy)),
              const SizedBox(
                height: 10,
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.deepPurple,
              //       shape: const CircleBorder(),
              //       padding: const EdgeInsets.all(14) // Background color
              //       ),
              //   onPressed: () {
              //     loadRentalHome();
              //   },
              //   child: const Icon(
              //     Icons.home,
              //   ),
              // ),
              FloatingBtn(function: loadRentalHome, icon: Icon(Icons.home)),
              const SizedBox(
                height: 10,
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.deepPurple,
              //       shape: const CircleBorder(),
              //       padding: const EdgeInsets.all(14) // Background color
              //       ),
              //   onPressed: () {
              //     setState(() {
              //       // markers = makeMarkers(supplies, uniLat, uniLong, context);
              //     });
              //   },
              //   child: const Icon(
              //     Icons.shopify_outlined,
              //   ),
              // ),
              FloatingBtn(
                  function: loadRestaurant, icon: Icon(Icons.shopify_outlined))
            ],
          ),
        ],
      ),
    );
  }
}
