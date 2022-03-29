// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, unused_import, unused_local_variable
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:panicbutton/main.dart';
import 'package:panicbutton/methods/methods.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  TextEditingController name = TextEditingController();
  TextEditingController lastnameP = TextEditingController();
  TextEditingController lastnamM = TextEditingController();
  TextEditingController otherGender = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController cellphone = TextEditingController();
  TextEditingController emails = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();

  bool ispassword = true, showpassword = true; //muestra el password o lo oculta
  late Icon iconeye = Icon(Icons.remove_red_eye);
  String groupValue = ''; //string valor del genero
  //
  final format1 = DateFormat("dd/MM/yyyy");
  DateTime selectedDate = DateTime.now();
  //
  //instancia de la clase metodo
  Methods methods = Methods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            //width: double.infinity,
            color: Theme.of(context).primaryColor,
          ),
          Transform.translate(
            offset: const Offset(0, 30),
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png"),
                  Card(
                    elevation: 9.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    margin:
                        EdgeInsets.only(left: 0, right: 0, top: 30, bottom: 0),
                    child: Container(
                        //width: MediaQuery.of(context).size.width - 100,
                        height: 410,
                        margin: EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Column(
                              children: [
                                /******************* Card letrero ********************/
                                Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  margin: EdgeInsets.only(
                                      left: 0, right: 0, top: 0, bottom: 0),
                                  color: Theme.of(context).primaryColor,
                                  child: Center(
                                    child: Text(
                                      "Datos de Usuario\nLlenar todos los campos.",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                /******************* foto de usuario para  ********************/
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
                                            shape: CircleBorder(),
                                            primary: Colors.white),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: Icon(Icons.add_a_photo,
                                              color: Colors.black),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                                /*CircleAvatar(
                                backgroundImage: FileImage(File(imagePath)), radius: 80),*/
                                /******************* nombre ********************/
                                TextFormField(
                                  controller: name,
                                  decoration: const InputDecoration(
                                      labelText: "nombre",
                                      icon: Icon(Icons.person)),
                                ),
                                /******************* apellido paterno ********************/
                                TextFormField(
                                  controller: lastnameP,
                                  decoration: const InputDecoration(
                                      labelText: "Apellido Paterno",
                                      icon: Icon(Icons.person)),
                                ),
                                /******************* apellido materno ********************/
                                TextFormField(
                                  controller: lastnamM,
                                  decoration: const InputDecoration(
                                      labelText: "Apellido Materno",
                                      icon: Icon(Icons.person)),
                                ),
                                /******************* domicilio ********************/
                                TextFormField(
                                  controller: address,
                                  decoration: const InputDecoration(
                                      labelText: "Dirección",
                                      icon: Icon(Icons.streetview)),
                                ),
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
                                SizedBox(height: 10),
                                /******************* Fecha ********************/
                                Column(children: <Widget>[
                                  Text(
                                      'Fecha de Nacimiento: (${format1.pattern})'),
                                  DateTimeField(
                                    format: format1,
                                    onShowPicker:
                                        (context, currentValue) async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                              context: context,
                                              firstDate: DateTime(1900),
                                              initialDate: currentValue ??
                                                  DateTime.now(),
                                              lastDate: DateTime.now());
                                      if (picked != null &&
                                          picked != selectedDate) {
                                        setState(() {
                                          selectedDate = picked;
                                        });
                                      }
                                      return picked;
                                    },
                                  ),
                                ]),
                                /******************* telefono ********************/
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Escribe su Telefono celular';
                                    }
                                    return null;
                                  },
                                  controller: cellphone,
                                  decoration: const InputDecoration(
                                    hintText: 'Escribe su Telefono celular',
                                    labelText: "Telefono",
                                    icon: Icon(Icons.phone_android_outlined),
                                  ),
                                ),
                                /******************* correo ********************/
                                TextFormField(
                                  controller: emails,
                                  decoration: const InputDecoration(
                                      labelText: "Correo",
                                      icon: Icon(Icons.email)),
                                ),
                                /******************* contraseña ********************/
                                TextFormField(
                                  controller: password,
                                  obscureText:
                                      ispassword ? showpassword : false,
                                  decoration: InputDecoration(
                                    labelText: "Contraseña",
                                    icon: const Icon(Icons.lock_sharp),
                                    suffixIcon: ispassword
                                        ? IconButton(
                                            icon: iconeye,
                                            onPressed: () {
                                              setState(() {
                                                showpassword = !showpassword;
                                                if (showpassword) {
                                                  iconeye = Icon(
                                                      Icons.remove_red_eye);
                                                } else {
                                                  iconeye = Icon(
                                                      Icons.visibility_off);
                                                }
                                              });
                                            })
                                        : null,
                                  ),
                                ),
                                /******************* confirmar contraseña ********************/
                                TextFormField(
                                  controller: passwordconfirm,
                                  obscureText:
                                      ispassword ? showpassword : false,
                                  decoration: InputDecoration(
                                    labelText: "Confirmar Contraseña",
                                    icon: const Icon(Icons.lock_sharp),
                                    suffixIcon: ispassword
                                        ? IconButton(
                                            icon: iconeye,
                                            onPressed: () {
                                              setState(() {
                                                showpassword = !showpassword;
                                                if (showpassword) {
                                                  iconeye = Icon(
                                                      Icons.remove_red_eye);
                                                } else {
                                                  iconeye = Icon(
                                                      Icons.visibility_off);
                                                }
                                              });
                                            })
                                        : null,
                                  ),
                                ),
                                SizedBox(height: 10),
                                /*************** botón de guardar **************** */
                                RaisedButton(
                                  color: Theme.of(context).primaryColor,
                                  //padding: const EdgeInsets.symmetric(vertical: 5),
                                  textColor: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text("Resgistrar Datos")
                                    ],
                                  ),
                                  onPressed: () {
                                    if (groupValue == "Otro") {
                                      confirmCamp(
                                          name,
                                          lastnameP,
                                          lastnamM,
                                          address,
                                          otherGender.text,
                                          selectedDate,
                                          cellphone,
                                          emails,
                                          password,
                                          passwordconfirm);
                                    } else {
                                      confirmCamp(
                                          name,
                                          lastnameP,
                                          lastnamM,
                                          address,
                                          groupValue,
                                          selectedDate,
                                          cellphone,
                                          emails,
                                          password,
                                          passwordconfirm);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } // cierre de widget

  // ########## confirmación de registro de usuario #########
  confirmCamp(name, lastnameP, lastnameM, address, sex, birthday, cellphone,
      emails, password, passwordConfirm) {
    birthday = methods.birthday(birthday); // retorna una edad tipo String
    if (name.text != "" &&
        lastnameP.text != "" &&
        lastnameM.text != "" &&
        address.text != "" &&
        sex != "" &&
        birthday[0] != "" &&
        cellphone.text != "" &&
        emails.text != "" &&
        password.text != "" &&
        passwordConfirm.text != "") {
      if (EmailValidator.validate(emails.text)) {
        if (cellphone.text.length == 10) {
          methods.flutterToats("Registro Exitoso", Colors.green, 20);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );
        } else {
          methods.flutterToats("Teléfono Inválido", Colors.amber, 20);
        }
      } else {
        methods.flutterToats("Correo Inválido", Colors.amber, 20);
      }
    } else {
      methods.flutterToats("Llena todos los campos", Colors.red, 20);
    }
  } // cierre de confirmcamp
}
