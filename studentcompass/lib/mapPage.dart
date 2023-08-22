import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var markers = HashSet<Marker>();
  late BitmapDescriptor markerIcon;

  getCostumeMarker() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'mapAssets/MapMarker1.png');
  }

  @override
  void initState() {
    getCostumeMarker();
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
            markers.add(Marker(
                markerId: const MarkerId('1'),
                position: const LatLng(31.2001, 29.9187),
                icon: markerIcon,
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
                          child: const Text("mafish fessal"),
                        );
                      });
                },
                infoWindow: const InfoWindow(
                  title: "شقة قوضة و صالة",
                )));
          });
        },
        markers: markers,
      ),
    );
  }
}
