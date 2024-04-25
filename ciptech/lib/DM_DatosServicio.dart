import 'package:flutter/material.dart';

class DM_ConfiguracionProducto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('8.- Datos del Servicio'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ingresar Datos del Servicio:'),
                SizedBox(height: 20.0),
                _buildTextField('Diagnostico', '', (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Recomendaciones', '', (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Acciones Correctivas', '', (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Incidentes', '', (value) {}),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Aquí puedes agregar la lógica para guardar la configuración
        },
        label: Text('Siguiente'),
        icon: Icon(Icons.arrow_forward),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildTextField(
      String labelText, String value, Function(String) onChanged) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
