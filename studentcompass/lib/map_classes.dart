import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

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

  Marker makeMarker(
          place, double uniLat, double uniLong, BuildContext context) =>
      Marker(
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 5),
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
                        ],
                      ),
                    ),
                  );
                });
          },
          infoWindow: InfoWindow(
            title: place.name,
          ));
}

class RentalHome extends Place {
  getCostumeMarker() async {
    if (booked) {
      icon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration.empty, 'mapAssets/rentalMarker.png');
    } else {
      icon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration.empty, 'mapAssets/rentalMarkerBooked.png');
    }
  }

  bool booked;
  RentalHome(
      {required super.name,
      required super.id,
      required super.description,
      required super.seller,
      required super.lat,
      required super.long,
      required this.booked}) {
    getCostumeMarker();
  }

  @override
  Marker makeMarker(
          place, double uniLat, double uniLong, BuildContext context) =>
      Marker(
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 5),
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            // color: Colors.amber, //for debugging purpose
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AvailableContainer(rental: this),
                                Container(
                                  // width: MediaQuery.sizeOf(context).width,
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
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
                              ],
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
                        ],
                      ),
                    ),
                  );
                });
          },
          infoWindow: InfoWindow(
            title: place.name,
          ));
}

class AvailableContainer extends StatelessWidget {
  final RentalHome rental;

  const AvailableContainer({super.key, required this.rental});

  @override
  Widget build(BuildContext context) {
    if (rental.booked) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Rented",
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Available",
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    }
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
