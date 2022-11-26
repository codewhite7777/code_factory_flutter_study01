import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final LatLng companyLatLng = LatLng(37.524327, 126.921252);
  static final CameraPosition initialPosition = CameraPosition(
    target: companyLatLng,
    zoom: 15.0,
  );
  static final double okDistance = 100.0;
  static final Circle withinDistanceCircle = Circle(
    circleId: CircleId("withinDistanceCircle"),
    center: companyLatLng,
    fillColor: Colors.blue.withOpacity(0.5),
    radius: okDistance,
    strokeColor: Colors.blue,
    strokeWidth: 1,
  );
  static final Circle notWithinDistanceCircle = Circle(
    circleId: CircleId("notWithinDistanceCircle"),
    center: companyLatLng,
    fillColor: Colors.red.withOpacity(0.5),
    radius: okDistance,
    strokeColor: Colors.red,
    strokeWidth: 1,
  );
  static final Circle checkDoneCircle = Circle(
    circleId: CircleId("checkDoneCircle"),
    center: companyLatLng,
    fillColor: Colors.green.withOpacity(0.5),
    radius: okDistance,
    strokeColor: Colors.green,
    strokeWidth: 1,
  );
  static final Marker marker = Marker(
    markerId: MarkerId('marker'),
    position: companyLatLng,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Check In',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: FutureBuilder<String>(
          future: checkPermission(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data == '이 앱의 위치 권한이 허가되었습니다.') {
              return StreamBuilder<Position>(
                  stream: Geolocator.getPositionStream(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Position> snapshot) {
                    bool isWithinRange = false;
                    if (snapshot.hasData) {
                      final start = snapshot.data;
                      final end = companyLatLng;
                      final distance = Geolocator.distanceBetween(
                          start!.latitude,
                          start!.longitude,
                          end.latitude,
                          end.longitude);
                      if (distance < okDistance) {
                        isWithinRange = true;
                      }
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _CustomGoogleMap(
                          initialPosition: initialPosition,
                          circle: (isWithinRange == false)
                              ? notWithinDistanceCircle
                              : withinDistanceCircle,
                          marker: marker,
                        ),
                        _CheckIn(),
                      ],
                    );
                  });
            }
            return Center(
              child: Text(snapshot.data!),
            );
          },
        ),
      ),
    );
  }

  Future<String> checkPermission() async {
    final bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationEnabled == false) {
      return '위치 서비스를 활성화 해 주세요.';
    }
    LocationPermission checkedPermission = await Geolocator.checkPermission();
    if (checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 활성화 해 주세요.';
      }
    }
    if (checkedPermission == LocationPermission.deniedForever) {
      return '이 앱의 위치 권한을 활성화 해 주세요.';
    }
    return '이 앱의 위치 권한이 허가되었습니다.';
  }
}

class _CustomGoogleMap extends StatelessWidget {
  final CameraPosition initialPosition;
  final Circle circle;
  final Marker marker;

  const _CustomGoogleMap({
    Key? key,
    required this.initialPosition,
    required this.circle,
    required this.marker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
        initialCameraPosition: initialPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        circles: Set.from([circle]),
        markers: Set.from([marker]),
      ),
    );
  }
}

class _CheckIn extends StatelessWidget {
  const _CheckIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text('google map'),
      ),
    );
  }
}
