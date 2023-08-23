import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';

import 'map_classes.dart';

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

class _MapPageState extends State<MapPage> {
  var markers = HashSet<Marker>();
  late BitmapDescriptor markerIcon;
  List<Place> places = [
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
  // getCostumeMarker() async {
  //   markerIcon = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration.empty, 'mapAssets/MapMarker1.png');
  // }

  @override
  void initState() {
    // getCostumeMarker();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("MAAAAAAAP NOT FINAAAL"),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(31.2001, 29.9187),
          zoom: 10,
        ),
        onMapCreated: (GoogleMapController googleMapController) {
          setState(() {
            markers = makeMarkers(places, context);
          });
        },
        markers: markers,
      ),
    );
  }
}
