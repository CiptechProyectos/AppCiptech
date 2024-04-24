import 'package:flutter/material.dart';
import 'DM_Configuracion.dart';

class OpcionUsuario extends StatefulWidget {
  @override
  _OpcionUsuarioState createState() => _OpcionUsuarioState();
}

class _OpcionUsuarioState extends State<OpcionUsuario> {
  String? calibracionSeleccionada;
  String? accesoFerritaSeleccionado;
  String? ejecucionRechazoSeleccionada;

  // Variables para campos de texto y nuevo desplegable
  String? tamanoProducto;
  String? relayAuxiliar;
  String? tipoDePanel; // Nueva variable para el tipo de panel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opción de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Evitar desbordamiento del contenido
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Registro de Opciones de Usuario:'),
              SizedBox(height: 20.0),
              // Aquí es donde necesitas 3 argumentos para la función _buildDropdownButton
              _buildDropdownButton('¿Calibración de Datos?',
                  calibracionSeleccionada, ['Sí', 'No']),
              SizedBox(height: 20.0),
              _buildDropdownButton('¿Acceso de Ferrita?',
                  accesoFerritaSeleccionado, ['Sí', 'No']),
              SizedBox(height: 20.0),
              _buildDropdownButton('¿Ejec. de Salida de Rechazo?',
                  ejecucionRechazoSeleccionada, ['Sí', 'No']),
              SizedBox(height: 20.0),

              // Campos de texto
              _buildTextField('Tamaño del Producto', tamanoProducto, (value) {
                setState(() {
                  tamanoProducto = value; // Guardar el valor ingresado
                });
              }),
              SizedBox(height: 20.0),
              _buildTextField('Relay Auxiliar', relayAuxiliar, (value) {
                setState(() {
                  relayAuxiliar = value; // Guardar el valor ingresado
                });
              }),
              SizedBox(height: 20.0),
              // Nuevo botón desplegable para "Tipo de Panel"
              _buildDropdownButton('Tipo de Panel', tipoDePanel,
                  ['Single Line', 'Dual Line', 'Touch']),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton.extended(
            onPressed: () {
              // Navegar a la pantalla Configuracion
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Configuracion()),
              );
            },
            label: Text('Siguiente'), // Texto del botón
            icon: Icon(Icons.arrow_forward), // Ícono del botón
            backgroundColor: Colors.blue,
          ),
        ),
      ),
    );
  }

  // Función para construir un botón desplegable
  Widget _buildDropdownButton(
      String labelText, String? value, List<String> options) {
    return DropdownButtonFormField<String>(
      value: value,
      items: options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          if (labelText == 'Calibración de Datos') {
            calibracionSeleccionada = newValue;
          } else if (labelText == 'Acceso de Ferrita') {
            accesoFerritaSeleccionado = newValue;
          } else if (labelText == 'Tipo de Panel') {
            tipoDePanel = newValue;
          } else if (labelText == 'Ejec. de Salida de Rechazo') {
            ejecucionRechazoSeleccionada = newValue;
          }
        });
      },
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }

  // Función para construir una caja de texto
  Widget _buildTextField(
      String labelText, String? value, Function(String) onChanged) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
