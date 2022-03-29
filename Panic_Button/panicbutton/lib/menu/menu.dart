// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_print, unused_field, unnecessary_new, unused_local_variable, library_prefixes
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:panicbutton/methods/methods.dart';
import 'package:panicbutton/pagenavigator/alert.dart';
import 'package:panicbutton/pagenavigator/map.dart';
import 'package:panicbutton/pagenavigator/profile.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class InitPage extends StatefulWidget {
  String nombre = "";
  InitPage(this.nombre, {Key? key}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  //variables de localización
  Location location = new Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  bool _isListenLocation = false, _isGetLocation = false;

  int _page = 0; //inico de pagina
  List<String> titles = [
    "Botón de Pánico",
    "Perfil del usuario",
    "Mapa"
  ]; // titulo del appBar
  MaterialColor iconColor = Colors.deepPurple;
  //instancia de la clase metodo
  Methods methods = Methods();
  //socket
  late IO.Socket socket;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: location.onLocationChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.waiting) {
          var data = snapshot.data as LocationData;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              primaryColor: Colors.deepPurple[300],
            ),
            home: _menuNavigator(
                data.latitude.toString(), data.longitude.toString()),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter menu',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              primaryColor: Colors.deepPurple[300],
            ),
            home: _menuNavigator("", ""),
          );
        }
      },
    );
  } //cierre del widget

  /// ****************metodo para navegacion entre paguinas************************ */
  _menuNavigator(String latitude, String logitude) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.warning,
              size: 30, color: _page != 0 ? Colors.black : iconColor),
          Icon(
            Icons.account_circle,
            size: 30,
            color: _page != 1 ? Colors.black : iconColor,
          ),
          Icon(Icons.map_sharp,
              size: 30, color: _page != 2 ? Colors.black : iconColor),
          //Icon(Icons.call_split, size: 30),
          //Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color(0xFF9575CD),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 700),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      appBar: AppBar(
        title: Center(
            child: methods.textDecoration(
                titles[_page], Colors.black, Colors.white, 30)),
      ),
      body: Container(
        color: Color(0xFF9575CD),
        child: Center(
          child: _getItemPages(_page, latitude, logitude, widget.nombre),
        ),
      ),
    );
  } // cierre de _menuNavigator

//cambiar de paguinas
  _getItemPages(int pos, String latitude, String logitude, String nombre) {
    latLngs(latitude, logitude, nombre);
    switch (pos) {
      case 0:
        return Alert(latitude, logitude);
      case 1:
        return Profile(latitude, logitude);
      case 2:
        return Maps(latitude, logitude);
    }
  } //cierre de _getItemPages

  //************************ Mandamos la coordenadas **************************** */
  latLngs(latitude, logitude, nombreusuario) {
    socket = IO.io("http://192.168.0.7:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();

    socket.emit('latlng', {latitude, logitude, nombreusuario});

    socket.onConnect((data) {
      // ignore: avoid_print
      print("----connected----");
    });
    // ignore: avoid_print
    print(socket.connected);
    //return "";
  } //cierre de latLngs

}
