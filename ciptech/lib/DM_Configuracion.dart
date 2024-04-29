import 'package:flutter/material.dart';
import 'DM_ValorBalance.dart'; // Asegúrate de importar DM_ValorBalance.dart

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
  final String? modoVelocidad;
  final String? constanteCTB; // Nueva variable para la constante de la CTB
  final String? velocidadCinta; // Nueva variable para la velocidad de la Cinta

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
    this.modoVelocidad,
    this.constanteCTB, // Inicializa la nueva variable
    this.velocidadCinta, // Inicializa la nueva variable
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4.- Configuración'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Registrar Configuración:'),
                SizedBox(height: 16.0),
                _buildDropdownButton(
                    'Idioma', fotocelula, ['Inglés', 'Español','Portugues'], (newValue) {}),
                SizedBox(height: 16.0),
                _buildDropdownButton(
                    'Tipo de Máquina', fotocelula, ['Cinta', 'Caída libre','Tuberia'], (newValue) {}),
                SizedBox(height: 16.0),
                _buildTextField('Cabezal', cabezal, (value) {}),
                SizedBox(height: 16.0),
                _buildDropdownButton(
                    'Unidades', fotocelula, ['Métricas', 'Imperial'], (newValue) {}),
                SizedBox(height: 16.0),
                _buildDropdownButton(
                    'Nº Banda', fotocelula, ['Banda 1', 'Banda 2','Banda 3','Banda 4','Banda 5','Banda 6','Banda 7','Banda 8','Banda 9','Banda 10'], (newValue) {}),
                SizedBox(height: 16.0),
                _buildTextField('Frecuencia (Default)', defaultConfig, (value) {}),
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
                SizedBox(height: 16.0),
                _buildDropdownButton(
                    'Modo de Velocidad', modoVelocidad, ['Variable', 'Fija'], (newValue) {}),
                SizedBox(height: 16.0),
                _buildTextField('Constante de la CTB', constanteCTB, (value) {}), // Nueva caja de texto
                SizedBox(height: 16.0),
                _buildTextField('Velocidad de la Cinta', velocidadCinta, (value) {}), // Nueva caja de texto
                SizedBox(height: 70.0),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navegar a la pantalla DM_ValorBalance
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DM_ValorBalance()),
          );
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
