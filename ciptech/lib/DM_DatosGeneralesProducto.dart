import 'package:flutter/material.dart';
import 'DM_DatosServicio.dart'; // Asegúrate de importar DM_ConfiguracionProducto.dart

class DM_DatosProducto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DM Datos Producto'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Registrar Datos del Producto:'),
                SizedBox(height: 20.0),
                _buildTextField('Nombre del Producto', '', (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Código del Producto', '', (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Fecha de Fabricación', '', (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Descripción', '', (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Número de Serie', '', (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Modelo', '', (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('País de Origen', '', (value) {}),
                SizedBox(height: 70.0),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navegar a la pantalla DM_ConfiguracionProducto
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DM_ConfiguracionProducto()),
          );
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
