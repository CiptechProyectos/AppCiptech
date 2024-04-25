import 'package:flutter/material.dart';
import 'DM_DatosServicio.dart'; // Asegúrate de importar DM_ConfiguracionProducto.dart

class DM_DatosProducto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('7.- Datos Generales del Producto'),
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
                _buildTextField('N° Memoria', '', (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Nombre del Producto', '', (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Presentación del Producto', '', (value) {}),
                SizedBox(height: 16.0),
                _buildComboBox('¿Producto Seco?', ['Si', 'No'], (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('T° Producto', '', (value) {}),
                SizedBox(height: 16.0),
                _buildComboBox('¿Película Metálica?', ['Si', 'No'], (value) {}),
                SizedBox(height: 30.0),
                Text('Configuración del Producto:'),
                SizedBox(height: 20.0),
                _buildTextField('Retardo de rechazo', '', (value) {}),
                SizedBox(height: 20.0),
                _buildTextField('Paro de rechazo', '', (value) {}),
                SizedBox(height: 16.0),
                _buildComboBox('¿Auto Frecuencia?', ['Si', 'No'], (value) {}),
                SizedBox(height: 20.0),
                _buildTextField('Umbral Actual', '', (value) {}),
                SizedBox(height: 20.0),
                _buildTextField('Aumento Cabezal P/I', '', (value) {}),
                SizedBox(height: 20.0),
                _buildTextField('Aumento Cabezal Q', '', (value) {}),
                SizedBox(height: 20.0),
                _buildTextField('Aumento Cabezal / RF', '', (value) {}),
                SizedBox(height: 20.0),
                _buildTextField('Angulo Fase o Compensación', '', (value) {}),
                SizedBox(height: 20.0),
                _buildTextField('Excitación de Cabezal', '', (value) {}),
                SizedBox(height: 20.0),
                _buildTextField('Modo de Trabajo', '', (value) {}),
                SizedBox(height: 20.0),
                _buildTextField('Tipo de Rechazo', '', (value) {}),
                SizedBox(height: 90.0),
              ],
            ),
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
                MaterialPageRoute(builder: (context) => DM_ConfiguracionProducto()),
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

  Widget _buildComboBox(String labelText, List<String> items, void Function(String?)? onChanged) {
    return DropdownButtonFormField<String>(
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
