// ignore_for_file: unused_import, deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_const_constructors, invalid_use_of_visible_for_testing_member, library_prefixes
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:panicbutton/menu/menu.dart';
import 'package:panicbutton/methods/methods.dart';
import 'package:panicbutton/pagenavigator/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  //inicializamos con la cuenta que no se ah cerrado
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences.setMockInitialValues({});
  SharedPreferences preferences9 = await SharedPreferences.getInstance();
  SharedPreferences preferences1 = await SharedPreferences.getInstance();
  SharedPreferences preferences2 = await SharedPreferences.getInstance();
  SharedPreferences preferences3 = await SharedPreferences.getInstance();
  //correo
  var correos = preferences9.getString('correo');
  String nombre = preferences1.getString('nombre').toString();
  String paterno = preferences2.getString('paterno').toString();
  String materno = preferences3.getString('materno').toString();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: correos == null
          ? const MyApp()
          : InitPage(nombre + " " + paterno + " " + materno),
    ),
  );
} //cierre del main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple[300],
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // text controler
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool ispassword = true, showpassword = true;
  late Icon iconeye = Icon(Icons.remove_red_eye);
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
          offset: const Offset(0, 50),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //widget imagen
                  Image.asset("assets/images/logo.png"),
                  //widget card
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.only(
                        left: 0, right: 0, top: 80, bottom: 0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // campo de correo
                          TextFormField(
                            controller: email,
                            decoration: const InputDecoration(
                                labelText: "Correo", icon: Icon(Icons.email)),
                          ),
                          //campo de contraseña
                          TextFormField(
                            controller: password,
                            obscureText: ispassword ? showpassword : false,
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
                                            iconeye =
                                                Icon(Icons.remove_red_eye);
                                          } else {
                                            iconeye =
                                                Icon(Icons.visibility_off);
                                          }
                                        });
                                      })
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // botón de inicio de sesión
                          RaisedButton(
                            color: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            textColor: Colors.white,
                            onPressed: () {
                              if (email.text != "" && password.text != "") {
                                if (email.text == "lopez@gmail.com" &&
                                    password.text == "123") {
                                  methods.flutterToats(
                                      "Acceso Exitoso", Colors.green, 20);
                                  methods.preferencesDataUser(
                                      "Pedro",
                                      "Lopez",
                                      "Torres",
                                      "Calle alberca #674, baja california, mexico",
                                      "Hombre",
                                      "25",
                                      "12/01/1997",
                                      "8679097867",
                                      "lopez@gmail.com",
                                      "123");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          InitPage("Pedro Lopez Torres"),
                                    ),
                                  );
                                } else {
                                  methods.flutterToats(
                                      "Correo o Contraseña Incorrectos",
                                      Colors.red,
                                      20);
                                }
                              } else {
                                methods.flutterToats(
                                    "Campos Vacios", Colors.amber, 20);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[const Text("Iniciar Sesión")],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Text("¿Aun no estás registrado?"),
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              // buton de registro
                              FlatButton(
                                textColor: Theme.of(context).primaryColor,
                                child: const Text("Registrate"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              //botón de registro por facebook
                              IconButton(
                                iconSize: 35,
                                color: Theme.of(context).primaryColor,
                                icon: Icon(
                                  Icons.facebook,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          InitPage("Pedro Lopez Torres"),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              //botón de registro por correo
                              IconButton(
                                iconSize: 35,
                                color: Theme.of(context).primaryColor,
                                icon: Icon(
                                  Icons.g_mobiledata,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          InitPage("Pedro Lopez Torres"),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
