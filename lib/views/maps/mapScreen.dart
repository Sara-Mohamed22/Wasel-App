
import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoder_location/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasel/data/local/cashHelper.dart';
import 'package:wasel/shared/cubit/app-cubit.dart';
import 'package:wasel/shared/cubit/app-state.dart';
import 'package:wasel/shared/style/constant.dart';
import 'package:wasel/shared/style/fonts.dart';
import 'package:location/location.dart' as location ;
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:wasel/views/homeScreen/homeScreen.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  late GoogleMapController? mapController;

  LatLng showLocation = LatLng(26.6473333 , 34.0746422);
  Set<Marker> markers = {};
  String? myAddress;
  String? addressName ;

  List<int> data = imgIcon ;
  late Uint8List markerIcon =Uint8List.fromList(data)  ;


  @override
  void initState() {

    getLocation().then((value) async {
      markerIcon  = await getBytesFromAsset('assets/images/mark.png', 150);
      setState(() {
        markers = {};
        showLocation = LatLng(value.latitude, value.longitude);
        getAddress(value.latitude, value.longitude).then((value) {
          myAddress = value;
        });
      });
    });


    super.initState();
  }


  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();

    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer
        .asUint8List();
  }


  Future<Position> getLocation() async {
    LocationPermission permission;
    bool _serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnable) {
      await Geolocator.openLocationSettings();
      return Future.error("Location service is not enabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission is refused");
      }
    }


    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }


  Future<String> getAddress(double lat, double long) async
  {
    try {

      var instance = GeocodingPlatform.instance;
      List<Placemark> placeMarks = await instance.placemarkFromCoordinates(
          lat, long);

      Placemark myPlace = placeMarks.first;

      print('88888 ${myPlace}');

      myAddress = "${myPlace.name} - ${myPlace.street} - ${myPlace.country}";

      addressName = myPlace.country ;

      print('myAddress $myAddress');





      return myAddress!;
    }
    catch (e) {
      print('error ${e.toString()}');
    }
    return myAddress! ;
  }





    addMarker() {
      markers.add(Marker(
          markerId: MarkerId(showLocation.toString()),
          position: showLocation,

          infoWindow: InfoWindow(
            // title: 'My Custom Title ',
            snippet: 'My Location',
          ),
          // icon: BitmapDescriptor.defaultMarker,
          icon: BitmapDescriptor.fromBytes(markerIcon )
      ));
    }


    @override
    Widget build(BuildContext context) {
      // print('llk $markerIcon');

      addMarker();
      setState(() {});

       AppCubit cubit = AppCubit.get(context);

      return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {

          if(state is GetAddressSuccessState )
            {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(MediaQuery
                  .of(context)
                  .size
                  .height / 9),


              child: AppBar(
                  title: Text('عنوان التوصيل',
                    style: TextStyle(
                      fontWeight: FontWeightManager.semiBold,
                      fontFamily: fontFamily,
                      fontSize: FontSizeManager.s18,
                    ),),
                  centerTitle: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  )
              ),
            ),
            body:

            GoogleMap(
              zoomGesturesEnabled: true,
              initialCameraPosition: CameraPosition(
                target: showLocation,
                zoom: 5.0,
              ),
              markers: markers,
              mapType: MapType.normal,
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;


                  getLocation().then((value) {
                    getAddress(value.latitude, value.longitude).then((value) {
                      myAddress = value;
                    });
                  });
                });
              },
              onTap: (_pos) async
              {



                setState(() {
                  markers = {};
                  showLocation = LatLng(_pos.latitude, _pos.longitude);

                  addressID = showLocation ;

                  CashHelper.saveData(key: 'lat', value: showLocation.latitude);
                  CashHelper.saveData(key: 'long', value: showLocation.longitude);

                  print('showwwwwww ${showLocation}');
                  getAddress(_pos.latitude, _pos.longitude).then((value) async {
                    myAddress = value;

                    await showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(myAddress!, style: TextStyle(
                                  fontSize: FontSizeManager.s15,
                                  fontFamily: fontFamily,
                                  fontWeight: FontWeightManager.medium,
                                  color: defColor
                              ),),
                              SizedBox(height: 10,),


                              ConditionalBuilder(
                                condition: state is !GetAddressLoadingState ,
                                builder: (context)=> Container(
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Color(0xff7EC242),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: MaterialButton(onPressed: (){

                                     cubit.getAddressID(
                                      address:addressName,
                                      lat: showLocation.latitude.toString() ,
                                      lng: showLocation.longitude.toString() ,
                                    );




                                  }, child: Text('استمرار',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeightManager.semiBold,
                                      fontFamily: fontFamily,
                                      fontSize: FontSizeManager.s18,
                                    ),),),
                                ),
                                fallback: (context)=> Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),

                                  child: Center(child: CircularProgressIndicator()),
                                ) ,
                              ),


                            ],
                          ),
                        );
                      },
                    );
                  });
                });
              },

            )

            ,
          );
        },
      )

      ;
    }
  }



