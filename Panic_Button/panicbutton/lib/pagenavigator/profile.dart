// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, invalid_use_of_visible_for_testing_member, sized_box_for_whitespace, must_be_immutable
import 'package:flutter/material.dart';
import 'package:panicbutton/pagenavigator/profileEdit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class Profile extends StatefulWidget {
  String latitude = "", logitude = "";
  Profile(this.latitude, this.logitude, {Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //preferencias del usuarion nombre y correo iniciado para dejar sesion iniciada
  String nombre = "",
      paterno = '',
      materno = '',
      direccion = '',
      sexo = '',
      edad = '',
      fecha = '',
      telefono = '',
      correo = '',
      contrasena = '';

  // ########## guardar datos de preferencia #########
  // mantenemos abierta nuestra sesion utilizando el metodo
  Future getDataUser() async {
    SharedPreferences preferences1 = await SharedPreferences.getInstance();
    SharedPreferences preferences2 = await SharedPreferences.getInstance();
    SharedPreferences preferences3 = await SharedPreferences.getInstance();
    SharedPreferences preferences4 = await SharedPreferences.getInstance();
    SharedPreferences preferences5 = await SharedPreferences.getInstance();
    SharedPreferences preferences6 = await SharedPreferences.getInstance();
    SharedPreferences preferences7 = await SharedPreferences.getInstance();
    SharedPreferences preferences8 = await SharedPreferences.getInstance();
    SharedPreferences preferences9 = await SharedPreferences.getInstance();
    SharedPreferences preferences10 = await SharedPreferences.getInstance();
    setState(() {
      nombre = preferences1.getString('nombre').toString();
      paterno = preferences2.getString('paterno').toString();
      materno = preferences3.getString('materno').toString();
      direccion = preferences4.getString('direccion').toString();
      sexo = preferences5.getString('sexo').toString();
      edad = preferences6.getString('edad').toString();
      fecha = preferences7.getString('fecha').toString();
      telefono = preferences8.getString('telefono').toString();
      correo = preferences9.getString('correo').toString();
      contrasena = preferences10.getString('contrasena').toString();
    });
  } //cierre de getEmail

  @override
  void initState() {
    super.initState();
    getDataUser();
  } //cierre de initstate

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9575CD),
      body: Transform.translate(
        offset: const Offset(0, 0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/user.png",
                      width: 140,
                    ),
                    /* cerra sesion */
                    Transform.translate(
                      offset: const Offset(70, 90),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(), primary: Colors.white),
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(shape: BoxShape.rectangle),
                          child: Icon(Icons.exit_to_app_outlined,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          removeData();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) => MyApp(),
                              ),
                              (Route<dynamic> route) => false);
                        },
                      ),
                    ),
                  ],
                ),
                infoTextBuild(
                    "Nombre: ", nombre + " " + paterno + " " + materno),
                infoTextBuild("Sexo: ", sexo),
                infoTextBuild("Fecha de Nacimiento: ", fecha),
                infoTextBuild("Edad: ", edad),
                infoTextBuild("Domicilio: ", direccion),
                infoTextBuild("Telefono: ", telefono),
                infoTextBuild("Correo: ", correo),
              ],
            ),
          ),
        ),
      ),
      //boton flotante
      floatingActionButton: Container(
        height: 50.0,
        width: 50.0,
        child: FittedBox(
          child: FloatingActionButton(
            child: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => profileEdit(
                      nombre,
                      paterno,
                      materno,
                      direccion,
                      sexo,
                      edad,
                      fecha,
                      telefono,
                      correo,
                      contrasena),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// ****************metodo para imprimir los datos de usuario************************ */
  Widget infoTextBuild(String parametro, String texto) {
    return Column(
      children: [
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          child: Container(
            child: Text(
              parametro,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            child: Text(
              texto == '' ? "" : texto,
              style: const TextStyle(fontSize: 20.0, color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        // linea para dividir
        Divider(
          color: Colors.white,
          height: 10,
          thickness: 2,
          indent: 0,
          endIndent: 0,
        ),
      ],
    );
  } //cierre de infoTextBuild

  /// ****************metodo para borrar datos del usuario************************ */
  Future removeData() async {
    SharedPreferences preferences1 = await SharedPreferences.getInstance();
    preferences1.remove('nombre');
    SharedPreferences preferences2 = await SharedPreferences.getInstance();
    preferences2.remove('paterno');
    SharedPreferences preferences3 = await SharedPreferences.getInstance();
    preferences3.remove('materno');
    SharedPreferences preferences4 = await SharedPreferences.getInstance();
    preferences4.remove('direccion');
    SharedPreferences preferences5 = await SharedPreferences.getInstance();
    preferences5.remove('sexo');
    SharedPreferences preferences6 = await SharedPreferences.getInstance();
    preferences6.remove('edad');
    SharedPreferences preferences7 = await SharedPreferences.getInstance();
    preferences7.remove('fecha');
    SharedPreferences preferences8 = await SharedPreferences.getInstance();
    preferences8.remove('telefono');
    SharedPreferences preferences9 = await SharedPreferences.getInstance();
    preferences9.remove('correo');
    SharedPreferences preferences10 = await SharedPreferences.getInstance();
    preferences10.remove('contrasena');
  } //cierre de removeData

}
