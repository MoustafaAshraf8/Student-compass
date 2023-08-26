import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';

import 'map_classes.dart';

// 31.211029964261222, 29.937032121439096
// 31.233049781964777, 29.969991105710832
// 31.22805513419555, 29.942273991797162 balbaa
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

HashSet<Marker> makeMarkers(List<Place> places, BuildContext context) =>
    HashSet.of(places.map((place) => Marker(
        markerId: place.id,
        icon: place.icon,
        position: LatLng(place.lat, place.long),
        onTap: () {
          showModalBottomSheet(
              showDragHandle: true,
              useSafeArea: true,
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.deepPurple,
                          ),
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              place.seller.name,
                              style: const TextStyle(fontSize: 20),
                            )),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.deepPurple,
                          ),
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              place.seller.mobile,
                              style: const TextStyle(fontSize: 20),
                            )),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.deepPurple,
                          ),
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              place.description,
                              style: const TextStyle(fontSize: 20),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        infoWindow: InfoWindow(
          title: place.name,
        ))));

List<RentalHome> getRentalHomes() {
  return [
    RentalHome(
        name: "شقة فول",
        id: const MarkerId('1'),
        description: "شقة طرش",
        seller: Seller(
            name: "عم خميس",
            email: "khamos@spoting.com",
            mobile: "011 1927 0023"),
        lat: 31.2001,
        long: 29.9187)
  ];
}

List<Resto> getRestos() {
  return [
    Resto(
        name: 'balba3',
        id: const MarkerId('2'),
        description: 'meat and fish. Not very good place for vegans',
        seller: Seller(
            name: 'الحاج بلبع',
            email: 'balba3@gmail.com',
            mobile: '01234567890'),
        lat: 31.22805513419555,
        long: 29.942273991797162)
  ];
}

List<Pharma> getPharmas() {
  return [
    Pharma(
        name: 'moheyeldin',
        id: const MarkerId('3'),
        description: 'pharmacy',
        seller: Seller(
            name: 'seller', email: 'pharmacy@gmail.com', mobile: '13567'),
        lat: 31.219226615854247,
        long: 29.940665012532833)
  ];
}

List<Supply> getSupplies() {
  return [
    Supply(
        name: 'eltabib wel mohandes',
        id: const MarkerId('number 1'),
        description: 'agmad maktaba law mesh ma3ak el drive',
        seller: Seller(
            name: 'essam', email: 'eltabib@gmail.com', mobile: '01486564654'),
        lat: 31.206451266775947,
        long: 29.92670827788856)
  ];
}

class _MapPageState extends State<MapPage> {
  var markers = HashSet<Marker>();
  late BitmapDescriptor markerIcon;

  List<RentalHome> homes = getRentalHomes();
  List<Resto> restos = getRestos();
  List<Pharma> pharmas = getPharmas();
  List<Supply> supplies = getSupplies();

  @override
  void initState() {
    super.initState();
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
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(31.2001, 29.9187),
              zoom: 10,
            ),
            onMapCreated: (GoogleMapController googleMapController) {
              setState(() {
                markers = makeMarkers(homes, context);
              });
            },
            markers: markers,
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(14) // Background color
                    ),
                onPressed: () {
                  setState(() {
                    markers = makeMarkers(restos, context);
                  });
                },
                child: const Icon(Icons.food_bank_rounded),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(14) // Background color
                    ),
                onPressed: () {
                  setState(() {
                    markers = makeMarkers(pharmas, context);
                  });
                },
                child: const Icon(
                  Icons.local_pharmacy,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(14) // Background color
                    ),
                onPressed: () {
                  setState(() {
                    markers = makeMarkers(homes, context);
                  });
                },
                child: const Icon(
                  Icons.home,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(14) // Background color
                    ),
                onPressed: () {
                  setState(() {
                    markers = makeMarkers(supplies, context);
                  });
                },
                child: const Icon(
                  Icons.shopify_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
