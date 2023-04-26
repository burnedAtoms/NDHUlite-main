import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'login_page.dart';

Future<void> _getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw 'Location services are disabled.';
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw 'Location permissions are denied';
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw 'Location permissions are permanently denied, we cannot request permissions.';
  }
  try {
    Position position = await Geolocator.getCurrentPosition();
    final Uri url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=23.898674,121.5404075');

    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    print(e.toString());
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MapPage(),
  ));
}

class MapPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MapPage> {
  String _selectedOption = "";

  final List<String> _options = [
    'Profile',
    'View Campus',
    'Assignments',
    'Grades',
    'Logout',
  ];

  static final LatLng _kMapCenter = LatLng(23.898674, 121.5404075);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 15.0, tilt: 0, bearing: 0);

  late GoogleMapController _controller;


  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('lib/assets/map_styles.json');
    _controller.setMapStyle(value);
  }

  @override
  void initState() {
    super.initState();
    _selectedOption = _options[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NDHUlite'),
        backgroundColor: Color.fromARGB(255, 49, 86, 49),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Student Name'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 49, 86, 49),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text('View Campus'),
              onTap: () {
                setState(() {
                  _selectedOption = 'View Campus';
                });
                Navigator.pop(context);
                //_getCurrentLocation();
                onMapCreated(_controller);
              },
            ),
            ListTile(
              title: Text('Assignments'),
              onTap: () {
                setState(() {
                  _selectedOption = 'Assignments';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Grades'),
              onTap: () {
                setState(() {
                  _selectedOption = 'Grades';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(this.context);
                  FirebaseAuth.instance.signOut().whenComplete(() => Navigator.push(
                    this.context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  ));
                  
                }),
          ],
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: onMapCreated,
      ),
    );
  }
}
