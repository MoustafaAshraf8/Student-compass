import 'dart:ffi';
import 'dart:math';

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

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

HashSet<Marker> makeMarkers(List<Place> places, double uniLat, double uniLong,
        BuildContext context) =>
    HashSet.of(places.map((place) => Marker(
        markerId: place.id,
        icon: place.icon,
        position: LatLng(place.lat, place.long),
        onTap: () {
          showModalBottomSheet(
              backgroundColor: Colors.deepPurple,
              showDragHandle: true,
              useSafeArea: true,
              context: context,
              isScrollControlled: true,
              elevation: 0.5,
              builder: (BuildContext context) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  width: MediaQuery.sizeOf(context).width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: Colors.white),
                            ),
                            // width: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                '${calculateDistance(place.lat, place.long, uniLat, uniLong).toStringAsPrecision(3).toString()} KM',
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.deepPurple[300],
                          ),
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Seller: ${place.seller.name}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Phone: ${place.seller.mobile}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Description ${place.description}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ),
                        // const SizedBox(height: 3),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius:
                        //         const BorderRadius.all(Radius.circular(10)),
                        //     color: Colors.deepPurple[300],
                        //   ),
                        //   width: MediaQuery.sizeOf(context).width,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Center(
                        //         child: Text(
                        //       place.seller.mobile,
                        //       style: const TextStyle(
                        //           fontSize: 20, color: Colors.white),
                        //     )),
                        //   ),
                        // ),
                        // const SizedBox(height: 3),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius:
                        //         const BorderRadius.all(Radius.circular(10)),
                        //     color: Colors.deepPurple[300],
                        //   ),
                        //   width: MediaQuery.sizeOf(context).width,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Center(
                        //         child: Text(
                        //       place.description,
                        //       style: const TextStyle(
                        //           fontSize: 20, color: Colors.white),
                        //     )),
                        //   ),
                        // ),
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
        name: "150m apartment",
        id: const MarkerId('1'),
        description: "2 rooms , 1 restroom , 1 kitchen",
        seller: Seller(
            name: "Khamis Adly",
            email: "khamos@spoting.com",
            mobile: "011 1927 0023"),
        lat: 31.2001,
        long: 29.9187,
        booked: false),
    RentalHome(
        name: "80m apartment",
        id: const MarkerId('2'),
        description: "1 room , 1 restroom, 1 kitchen",
        seller: Seller(
            name: "Mohamed Gomaa",
            email: "gomaa@sporting.com",
            mobile: "011 1927 0023"),
        lat: 31,
        long: 29,
        booked: true),
  ];
}

List<Resto> getRestos() {
  return [
    Resto(
        name: 'Balbaa',
        id: const MarkerId('2'),
        description: 'meat and fish. Not very good place for vegans',
        seller: Seller(
            name: 'Ahmed Balbaa',
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

  double uniLat = 30.0;
  double uniLong = 30;
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
                markers = makeMarkers(homes, uniLat, uniLong, context);
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
                    markers = makeMarkers(restos, uniLat, uniLong, context);
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
                    markers = makeMarkers(pharmas, uniLat, uniLong, context);
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
                    markers = makeMarkers(homes, uniLat, uniLong, context);
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
                    markers = makeMarkers(supplies, uniLat, uniLong, context);
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
