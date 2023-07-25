// ignore_for_file: unused_local_variable

import 'package:ess_app/Widget/button.dart';
import 'package:ess_app/Widget/textfield.dart';
import 'package:ess_app/controller/auth_Controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:maps_toolkit/maps_toolkit.dart' as maps_tool;

class Absen extends StatefulWidget{
  const Absen({super.key});

  @override
  AbsenP createState() => AbsenP();
}
class AbsenP extends State<Absen> {
  AuthController checkInController = Get.put(AuthController());
  late GoogleMapController mapController; //contrller for Google map
  final Set<Marker> markers = {}; //markers for google map
  final Set<Circle> circles = {}; //sirkel for google map
  static const LatLng showLocation = LatLng(-6.5039122826056674, 106.88832507445152); //location to show in map

  int currentIndex = 0;

  List<IconData> navigationIcon = [
    Icons.home,
    Icons.person,

  ];

  @override
  void initState() {
  String lat;
  String long;
    super.initState();
  }
  


  String locationmessage = 'lokasi user sekarang';
  late String lat;
  late String long;


  //ngambil posisi
  Future<Position> getCurrentlocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if(!serviceEnabled){
    return Future.error('Location service is disabled');
  }
  //permis
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied){
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
      return Future.error('location permision is denied');
    }
  }
  if (permission == LocationPermission.deniedForever){
    return Future.error('location permission are denied forever we cannot request permission');
  }
  return await Geolocator.getCurrentPosition();
 }
 //live lokasi
 void _liveLocation() {
  LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  Geolocator.getPositionStream(locationSettings: locationSettings)
  .listen((Position position) {
    lat  = position.latitude.toString();
    long = position.latitude.toString();

    setState(() {
      locationmessage = 'Latitude: $lat, Longtitude: $long';
    });
  });
 }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
          appBar: AppBar( 
            automaticallyImplyLeading: false,
             title: const Text("Check In"),
             backgroundColor: Colors.blue,
             centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: GoogleMap( //Map widget from google_maps_flutter package
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    initialCameraPosition: const CameraPosition( //innital position in map
                      target: showLocation, //initial position
                      zoom: 18, //initial zoom level
                    ),
                    markers: getmarkers(), //markers to show on map
                    circles: getcircles(), //markers to show on map
                    mapType: MapType.normal, //map type
                    onMapCreated: (controller) { //method called when map is created
                      setState(() {
                        mapController = controller; 
                      });
                    },
                  ),
                ),
              
              
              KoordinatTextFieldWidget(
                checkInController.latController, 'latitude'
              ),
              KoordinatTextFieldWidget(
                checkInController.longController, 'longtitude'
              ),
              const Text(
                      'Klik tombol cek posisi terlebih dahulu sebelum absen',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
              AbsenButton(
              onPressed: () {
                getCurrentlocation().then((value) {
                  lat = '${value.latitude}';
                  long = '${value.longitude}';
                  setState(() {
                    locationmessage = 'Latitude: $lat, Longtitude: $long';
                    checkInController.latController.text = lat;
                    checkInController.longController.text = long;
                  });
                  _liveLocation();
                });
              },
              title: 'cek posisi sekarang',
              ),
              AbsenButton(
                onPressed: () => checkInController.cekinlah(),
                 title: 'Absen')
            ],
          )  ,
          // bottomNavigationBar: Container(
          //   height: 70,
          //   decoration: const BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.all(Radius.circular(40)),
          //     // BoxShadow({
          //     //   Color color: black,
          //     //   double blurRadius: 10,
          //     //   }) 
          //   ),
          
          //   child: ClipRRect(
          //     child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       for(int i = 0; i < navigationIcon.length; i++)... <Expanded>{
          //       Expanded(
          //         child: GestureDetector(
          //           onTap: (){
          //             setState(() {
          //               currentIndex = i;
          //             });
          //           },
          //           child: Center(
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Icon(
          //                   navigationIcon[i],
          //                   color: i == currentIndex ? blue : Colors.grey,
          //                   size: i == currentIndex ? 30 : 26,
          //           ),
          //                 i == currentIndex ? Container(
          //                   height: 3,
          //                   width: 20,
          //                   color: black,
          //           ) : const SizedBox(),
          //               ],
          //             ),
                  
                    
          //           ),
          //         )
          //         )
          //       }
          //     ],
          //     ),
          //   ),
          //   ),
       );

   }

  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: const InfoWindow( //popup info 
          title: 'Kantor Citereup ',
          snippet: 'CMS Maju Sejahtera',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(-6.613963436770846, 106.8147440071582), //position of marker
        infoWindow: const InfoWindow( //popup info 
          title: 'Kantor Villa duta ',
          snippet: 'Zuko',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(-6.587699675057511, 106.79935202051304), //position of marker
        infoWindow: const InfoWindow( //popup info 
          title: 'Kantor Sempur ',
          snippet: 'CMSMart',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

       //add more markers here 
    });

    return markers;
  }
  Set<Circle> getcircles() {
    setState(() {
      circles.add(Circle( 
        circleId: const CircleId("1"),
        center: showLocation,
        radius: 60,
        strokeWidth: 2,
        fillColor: const Color(0xFF006491).withOpacity(0.2),
      ),
      );

      circles.add(Circle( 
        circleId: const CircleId("2"),
        center: const LatLng(-6.613963436770846, 106.8147440071582),
        radius: 60,
        strokeWidth: 2,
        fillColor: const Color(0xFF006491).withOpacity(0.2),
      ),
      );

      circles.add(Circle( 
        circleId: const CircleId("3"),
        center: const LatLng(-6.587699675057511, 106.79935202051304),
        radius: 60,
        strokeWidth: 2,
        fillColor: const Color(0xFF006491).withOpacity(0.2),
      ),
      );

       //add more markers here 
    });

    return circles;
  }
}