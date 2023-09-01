import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';

import 'map_classes.dart';

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

HashSet<Marker> makeMarkers(List<Place> places, double uniLat, double uniLong,
    BuildContext context, BitmapDescriptor icon) {
  print("!!!!!!!!!!!!");
  print(places[0].longtitude);
  print(places[0].latitude);
  print("!!!!!!!!!!!!");
  // Future.delayed(Duration(seconds: 10), () {
  //   print("Wait for 10 seconds");
  // });
  //print(places[4].icon);

  return HashSet.of(places.map((place) => Marker(
      markerId: place.id,
      icon: icon,
      position: LatLng(place.latitude, place.longtitude),
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
                              '${calculateDistance(place.latitude, place.longtitude, uniLat, uniLong).toStringAsPrecision(3).toString()} KM',
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
}
