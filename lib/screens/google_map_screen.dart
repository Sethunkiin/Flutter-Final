// screens/google_map_screen.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? _controller;

  final LatLng _initialPosition = LatLng(37.77483, -122.41942); // San Francisco

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _setMarkers();
  }

  void _setMarkers() {
    try {
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId("initial_position"),
            position: _initialPosition,
            infoWindow: InfoWindow(
              title: "San Francisco",
              snippet:
                  "ເມືອງທີ່ມີຄວາມສົນໃຈ", // Translated to Lao: 'An interesting city'
            ),
          ),
        );
      });
    } catch (e) {
      print(
          'ຜິດພາດໃນການຕັ້ງໝາຍ: $e'); // Translated to Lao: 'Error setting markers: $e'
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ແຜນທີ່'), // Translated to Lao: 'Map View'
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
          print('ສ້າງແຜນທີ່ແລ້ວ'); // Translated to Lao: 'Map Created'
        },
        markers: _markers,
      ),
    );
  }
}
