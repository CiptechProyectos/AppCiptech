import 'package:flutter/material.dart';

class Configuracion extends StatelessWidget {
  final String? idioma;
  final String? tipoMaquina;
  final String? cabezal;
  final String? unidades;
  final String? banda;
  final String? defaultConfig;
  final String? longitudDeCaudal;
  final String? fotocelula;
  final String? collGap;
  final String? valorDeFiltro;
  final String? ftc;

  Configuracion({
    this.idioma,
    this.tipoMaquina,
    this.cabezal,
    this.unidades,
    this.banda,
    this.defaultConfig,
    this.longitudDeCaudal,
    this.fotocelula,
    this.collGap,
    this.valorDeFiltro,
    this.ftc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Registrar Configuración:'),
                SizedBox(height: 20.0),
                _buildTextField('Idioma', idioma, (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Tipo Máquina', tipoMaquina, (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Cabezal', cabezal, (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Unidades', unidades, (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Banda', banda, (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Default', defaultConfig, (value) {}),
                SizedBox(height: 16.0),
                _buildTextField(
                    'Longitud de Caudal', longitudDeCaudal, (value) {}),
                SizedBox(height: 16.0),
                _buildDropdownButton(
                    'Fotocélula', fotocelula, ['Sí', 'No'], (newValue) {}),
                SizedBox(height: 16.0),
                _buildTextField('Coll Gap (entre Hierro)', collGap, (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('Valor de Filtro en el Software', valorDeFiltro,
                    (value) {}),
                SizedBox(height: 16.0),
                _buildTextField('FTC', ftc, (value) {}),
                SizedBox(height: 70.0),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context); // Regresar a la pantalla anterior
        },
        label: Text('Siguiente'),
        icon: Icon(Icons.arrow_forward),
        backgroundColor: Colors.blue,
      ),
    );
  }

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

  Widget _buildDropdownButton(String labelText, String? value,
      List<String> options, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      items: options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
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
