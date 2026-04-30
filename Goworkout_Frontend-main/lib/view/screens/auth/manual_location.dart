import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/view/widgets/my_button.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class ManualLocation extends StatefulWidget {
  const ManualLocation({super.key});

  @override
  State<ManualLocation> createState() => _ManualLocationState();
}

class _ManualLocationState extends State<ManualLocation> {
  static const LatLng _initialCenter = LatLng(40.7128, -74.0060); // NYC
  final MapController _mapController = MapController();
  LatLng _marker = _initialCenter;
  final TextEditingController _addressCtrl =
      TextEditingController(text: 'New York, NY, USA');

  @override
  void dispose() {
    _addressCtrl.dispose();
    _mapController.dispose();
    super.dispose();
  }

  void _onMapTap(LatLng pos) {
    setState(() {
      _marker = pos;
      _addressCtrl.text =
          '${pos.latitude.toStringAsFixed(5)}, ${pos.longitude.toStringAsFixed(5)}';
    });
  }

  void _recenter() {
    _mapController.move(_initialCenter, 13);
    setState(() => _marker = _initialCenter);
    Get.snackbar(
      'Location',
      'Map recentered.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: kPrimary100,
      colorText: kQuaternaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        actions: [
          MyButton(
            onTap: () {
              Get.snackbar(
                'Location',
                'Saved: ${_addressCtrl.text}',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: kPrimary100,
                colorText: kQuaternaryColor,
              );
              Future.delayed(
                const Duration(milliseconds: 600),
                () => Get.back(),
              );
            },
            buttonText: 'Save',
            height: 32,
            mhoriz: 16,
            fontSize: 14,
            mTop: 10,
          ),
        ],
      ),
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _initialCenter,
                initialZoom: 13,
                minZoom: 3,
                maxZoom: 18,
                onTap: (_, latLng) => _onMapTap(latLng),
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.goworkout.app',
                  maxNativeZoom: 19,
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _marker,
                      width: 40,
                      height: 40,
                      alignment: Alignment.topCenter,
                      child: const Icon(
                        Icons.location_pin,
                        color: kSecondaryColor,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 24,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kPrimary100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text: 'Selected location',
                    size: 12,
                    color: kGrey5Color,
                    paddingBottom: 6,
                  ),
                  TextField(
                    controller: _addressCtrl,
                    style: const TextStyle(color: kQuaternaryColor),
                    decoration: const InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Type an address...',
                      hintStyle: TextStyle(color: kGrey5Color),
                    ),
                  ),
                  const Divider(color: kGrey5Color, height: 16),
                  MyText(
                    text:
                        'Tap on the map to set the marker. Pinch / scroll to zoom.',
                    size: 11,
                    color: kGrey5Color,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _recenter,
        backgroundColor: kSecondaryColor,
        child: const Icon(Icons.my_location, color: kQuaternaryColor),
      ),
    );
  }
}
