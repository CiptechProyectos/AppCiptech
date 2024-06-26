import 'package:flutter/material.dart';
import 'DM_DatosCliente.dart'; // Importa la pantalla del formulario DM
import 'dart:async'; // Importa dart:async para usar el temporizador

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Certificador',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Mantener el primarySwatch
        primaryColor: Color.fromARGB(255, 37, 122, 161), // Color principal consistente
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 37, 122, 161), // Misma combinación
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: 'San Francisco',
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'San Francisco',
            fontSize: 16.0,
          ),
        ),
      ),
      home: SplashScreen(), // Mostrar SplashScreen como pantalla de inicio
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Iniciar el temporizador para esperar 2 segundos antes de avanzar a la pantalla principal
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/inicio.png'), // Imagen de la SplashScreen
            SizedBox(height: 20), // Espacio entre la imagen y el indicador de carga
            CircularProgressIndicator(), // Indicador de carga
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registro de Certificador',
          style: TextStyle(fontFamily: 'San Francisco', fontSize: 18.0),
        ),
      ),
      body: Center(
        child: Text(
          'Ciptech',
          style: TextStyle(fontFamily: 'San Francisco', fontSize: 18.0),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Usuario"),
              accountEmail: Text("tecnico@cipsa.com.pe"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 89, 165, 201), // Color de fondo para avatar
                child: Text(
                  "U", // Inicial del usuario
                  style: TextStyle(fontFamily: 'San Francisco', fontSize: 24.0),
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 37, 122, 161), // Consistente con el color principal
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: ExpansionTile(
                leading: Icon(Icons.assignment, color: Color.fromARGB(255, 37, 122, 161)), // Ícono con color consistente
                title: Text(
                  'Certificación',
                  style: TextStyle(
                    fontFamily: 'San Francisco',
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 0, 0, 0), // Ajustar el color del texto
                  ),
                ),
                children: <Widget>[
                  ExpansionTile(
                    title: Text(
                      'Nueva Certificación',
                      style: TextStyle(
                        fontFamily: 'San Francisco',
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 0, 0, 0), // Mantener el color del texto
                      ),
                    ),
                    leading: Icon(Icons.add, color: Color.fromARGB(255, 37, 122, 161)), // Ícono con color consistente
                    children: <Widget>[
                      _buildAlignedListTile('DM', context),
                      _buildAlignedListTile('RX', context),
                      _buildAlignedListTile('CW', context),
                    ],
                  ),
                ],
              ),
            ),
            Divider(), // División para separación visual
            ListTile(
              leading: Icon(Icons.settings, color: Color.fromARGB(255, 37, 122, 161)), // Consistencia en íconos
              title: Text(
                'Configuración',
                style: TextStyle(fontFamily: 'San Francisco', fontSize: 16.0),
              ),
              onTap: () {
                Navigator.pop(context);
                // Lógica para configuración
              },
            ),
            Divider(), // División para separación visual
            ListTile(
              leading: Icon(Icons.history, color: Color.fromARGB(255, 37, 122, 161)), // Color para consistencia
              title: Text(
                'Historial',
                style: TextStyle(
                  fontFamily: 'San Francisco',
                  fontSize: 16.0,
                  color: Color.fromRGBO(0, 1, 2, 1), // Texto consistente
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Lógica para mostrar historial
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlignedListTile(String title, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 40.0), // Espacio adicional
      title: Text(
        title,
        style: TextStyle(fontFamily: 'San Francisco', fontSize: 16.0),
      ),
      onTap: () {
        Navigator.pop(context); // Cerrar el drawer
        if (title == 'DM') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DMFormScreen(),
            ),
          );
        } else if (title == 'RX') {
          // Lógica para RX
        } else if (title == 'CW') {
          // Lógica para CW
        }
      },
    );
  }
}
