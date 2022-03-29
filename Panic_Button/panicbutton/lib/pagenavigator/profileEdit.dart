// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, file_names, unused_import, unused_local_variable, deprecated_member_use, unnecessary_new, unnecessary_null_comparison, prefer_if_null_operators, invalid_use_of_visible_for_testing_member, must_be_immutable, prefer_const_constructors
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:panicbutton/menu/menu.dart';
import 'package:panicbutton/methods/methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profileEdit extends StatefulWidget {
  String nombre,
      paterno,
      materno,
      direccion,
      sexo,
      edad,
      fecha,
      telefono,
      correo,
      contrasena;
  profileEdit(
      this.nombre,
      this.paterno,
      this.materno,
      this.direccion,
      this.sexo,
      this.edad,
      this.fecha,
      this.telefono,
      this.correo,
      this.contrasena,
      {Key? key})
      : super(key: key);

  @override
  _profileEditState createState() => _profileEditState();
}

class _profileEditState extends State<profileEdit> {
// text controller
  TextEditingController nombre1 = TextEditingController();
  TextEditingController paterno1 = TextEditingController();
  TextEditingController materno1 = TextEditingController();
  TextEditingController direccion1 = TextEditingController();
  TextEditingController sexo1 = TextEditingController();
  TextEditingController edad1 = TextEditingController();
  TextEditingController fecha1 = TextEditingController();
  TextEditingController telefono1 = TextEditingController();
  TextEditingController correo1 = TextEditingController();
  TextEditingController contrasena1 = TextEditingController();
  TextEditingController confirmarcontrasena1 = TextEditingController();
  TextEditingController otherGender = TextEditingController();

  //instancia de la clase metodo
  Methods methods = Methods();
  String groupValue = ''; //string valor del genero
  // fecha y calculo de edad
  final format1 = DateFormat("dd/MM/yyyy");
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          title: methods.textDecoration(
              "Editar Perfil", Colors.black, Colors.white, 30)),
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
                    Transform.translate(
                      offset: const Offset(70, 100),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(), primary: Colors.white),
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Icon(Icons.add_a_photo, color: Colors.black),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                /******************* nombre ********************/
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: nombre1,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: "Nombre: ",
                      hintText: widget.nombre,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /******************* paterno ********************/
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: paterno1,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: "Paterno: ",
                      hintText: widget.paterno,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /******************* materno ********************/
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: materno1,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: "Materno: ",
                      hintText: widget.materno,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /******************* domicilio ********************/
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: direccion1,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: "Domicilio: ",
                      hintText: widget.direccion,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /******************* sexo genero ********************/
                Row(
                  children: <Widget>[
                    //radio para definir hombre o mujer
                    Radio(
                      value: "Hombre",
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value.toString();
                        });
                      },
                    ),
                    const Text("Hombre"),
                    const SizedBox(width: 5),
                    //radio mujer
                    Radio(
                      value: "Mujer",
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value.toString();
                        });
                      },
                    ),
                    const Text("Mujer"),
                    const SizedBox(width: 5),
                    //radio Otro
                    Radio(
                      value: "Otro",
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value.toString();
                        });
                      },
                    ),
                    const Text("Otro Genero"),
                  ],
                ),
                (groupValue == 'Otro')
                    ? Column(
                        children: [
                          TextFormField(
                            controller: otherGender,
                            decoration: const InputDecoration(
                                labelText: "Específica",
                                icon: Icon(Icons.wc_sharp)),
                          ),
                          SizedBox(height: 5),
                        ],
                      )
                    : Text(""),
                SizedBox(height: 5),
                /******************* Fecha ********************/
                Column(children: <Widget>[
                  Text('Fecha de Nacimiento:'),
                  DateTimeField(
                    format: format1,
                    onShowPicker: (context, currentValue) async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime.now());
                      if (picked != null && picked != selectedDate) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                      return picked;
                    },
                  ),
                ]),
                /******************* telefono ********************/
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: telefono1,
                    decoration: InputDecoration(
                      hintText: widget.telefono,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      labelText: "Telefono",
                      icon: const Icon(Icons.phone_android_outlined),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                /******************* correo ********************/
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: correo1,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: "Correo: ",
                      hintText: widget.correo,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                /******************* contraseña ********************/
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: contrasena1,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: "Contraseña: ",
                      hintText: "*" * widget.contrasena.length,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RaisedButton(
                  color: Colors.white54,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: const Text(
                    "Guardar Datos",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  onPressed: () {
                    List<String> birthday = methods.birthday(
                        selectedDate != null
                            ? selectedDate
                            : null); // retorna una edad tipo String
                    confirmEdition(
                        nombre1.text != '' ? nombre1.text : widget.nombre,
                        paterno1.text != '' ? paterno1.text : widget.paterno,
                        materno1.text != '' ? materno1.text : widget.materno,
                        direccion1.text != ''
                            ? direccion1.text
                            : widget.direccion,
                        groupValue != ''
                            ? groupValue != 'Otro'
                                ? groupValue
                                : otherGender.text != ''
                                    ? otherGender.text
                                    : widget.sexo
                            : widget.sexo,
                        birthday[0] != '' ? birthday[0] : widget.edad,
                        birthday[1] != '' ? birthday[1] : widget.fecha,
                        telefono1.text != '' ? telefono1.text : widget.telefono,
                        correo1.text != '' ? correo1.text : widget.correo,
                        contrasena1.text != ''
                            ? contrasena1.text
                            : widget.contrasena);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ****************metodo confirmar si los datos son vacios ************************ */
  confirmEdition(nombre, paterno, materno, direccion, sexo, edad, fecha,
      telefono, correo, contrasena) {
    if (nombre != '' ||
        paterno != '' ||
        materno != '' ||
        direccion != '' ||
        sexo != '' ||
        edad != '' ||
        fecha != '' ||
        telefono != '' && telefono.length == 10 ||
        correo != '' ||
        contrasena) {
      //muestra un alerta para confirmar cambios
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Actualizar Datos'),
            content: TextFormField(
              controller: confirmarcontrasena1,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Ingresa Contraseña Actual",
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  if (confirmarcontrasena1.text == widget.contrasena) {
                    methods.flutterToats(
                        "Cambios Actualizados", Colors.green, 20);
                    methods.preferencesDataUser(
                        nombre,
                        paterno,
                        materno,
                        direccion,
                        sexo,
                        edad,
                        fecha,
                        telefono,
                        correo,
                        contrasena);
                    Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              InitPage(nombre + " " + paterno + " " + materno),
                        ),
                        (Route<dynamic> route) => false);
                  } else {
                    Navigator.of(context).pop();
                    methods.flutterToats("Contraseña Invalida", Colors.red, 20);
                  }
                },
              ),
            ],
          );
        },
      );
    }
  }
}
