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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
