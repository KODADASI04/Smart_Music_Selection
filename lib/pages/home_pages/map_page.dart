import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../mainapp.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<BitmapDescriptor> avatars = [];
  List<String> moods = ["Happy", "Sad"];
  LatLng? _location;
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(
                size: Size(1, 1),
              ),
              "assets/images/example_avatar${i + 1}.png")
          .then(
        (value) {
          avatars.add(value);
          if (avatars.length == 10) {
            setState(() {});
          }
        },
      );
    }
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> controller =
        Completer<GoogleMapController>();
    return avatars.length != 10 || _location == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: _location!,
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController gcontroller) {
                  controller.complete(gcontroller);
                },
                markers: {
                  for (int i = 0; i < 10; i++)
                    Marker(
                      markerId: MarkerId(i.toString()),
                      icon: avatars[i],
                      infoWindow: InfoWindow(
                        title: "Person $i",
                        snippet: "Mood: ${moods[Random().nextInt(1)]}",
                      ),
                      position: LatLng(
                        _location!.latitude +
                            i / (Random().nextInt(1000) + 900),
                        _location!.longitude +
                            i / (Random().nextInt(1000) + 900),
                      ),
                    )
                },
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainApp(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "People Close to You",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: "PermanentMaker",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }

  void getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        locationData = await location.getLocation();
        locationData = await location.getLocation();
        setState(() {
          _location = LatLng(locationData.latitude!, locationData.longitude!);
        });
        return;
      } else {
        setState(() {
          _location = const LatLng(37.42796133580664, -122.085749655962);
        });
      }
    } else if (permissionGranted == PermissionStatus.deniedForever) {
      setState(() {
        _location = const LatLng(37.42796133580664, -122.085749655962);
      });
    } else {
      locationData = await location.getLocation();
      setState(() {
        _location = LatLng(locationData.latitude!, locationData.longitude!);
      });
    }
  }
}
