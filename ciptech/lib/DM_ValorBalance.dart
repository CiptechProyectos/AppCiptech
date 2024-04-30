import 'package:flutter/material.dart';
import 'DM_ValorDetector.dart'; // Asegúrate de importar DM_ValorDetector.dart

class DM_ValorBalance extends StatefulWidget {
  @override
  _DM_ValorBalanceState createState() => _DM_ValorBalanceState();
}

class _DM_ValorBalanceState extends State<DM_ValorBalance> {
  String? selectedBanda;
  List<String> bandas = [
    'Banda 1',
    'Banda 2',
    'Banda 3',
    'Banda 4',
    'Banda 5',
    'Banda 6',
    'Banda 7',
    'Banda 8',
    'Banda 9',
    'Banda 10'
  ];

  Map<String, List<String>> bandasDatos = {
    'Banda 1': ['31 Khz', '71 Khz', '195 Khz', '333 Khz', '577 Khz'],
    'Banda 2': ['33 Khz', '73 Khz', '197 Khz', '349 Khz', '600 Khz'],
    'Banda 3': ['35 Khz', '75 Khz', '200 Khz', '357 Khz', '625 Khz'],
    'Banda 4': ['37 Khz', '77 Khz', '203 Khz', '366 Khz', '652 Khz'],
    'Banda 5': ['39 Khz', '79 Khz', '205 Khz', '417 Khz', '682 Khz'],
    'Banda 6': ['41 Khz', '81 Khz', '208 Khz', '441 Khz', '714 Khz'],
    'Banda 7': ['43 Khz', '83 Khz', '211 Khz', '469 Khz', '789 Khz'],
    'Banda 8': ['46 Khz', '85 Khz', '214 Khz', '484 Khz', '833 Khz'],
    'Banda 9': ['48 Khz', '87 Khz', '217 Khz', '517 Khz', '882 Khz'],
    'Banda 10': ['52 Khz', '89 Khz', '221 Khz', '536 Khz', '939 Khz'],
  };

  // Parámetros de Ferrita
  String? frecuencia;
  String? umbral;
  String? fase;
  String? aumentoCabezal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5.- Valores de Balance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Registrar Valor Balance',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              DropdownButton<String>(
                hint: Text('Seleccione banda:   '),
                value: selectedBanda,
                onChanged: (String? value) {
                  setState(() {
                    selectedBanda = value;
                  });
                },
                items: bandas.map((String banda) {
                  return DropdownMenuItem<String>(
                    value: banda,
                    child: Text(banda),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              if (selectedBanda != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingrese los valores:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: bandasDatos[selectedBanda!]!
                              .sublist(0, 2)
                              .map((dato) {
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child:
                                    _buildSmallTextField(dato, '', (value) {}),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                            height:
                                10.0), // Separación vertical entre las filas
                        Row(
                          children: bandasDatos[selectedBanda!]!
                              .sublist(2, 4)
                              .map((dato) {
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child:
                                    _buildSmallTextField(dato, '', (value) {}),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                            height:
                                10.0), // Separación vertical entre las filas
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // Alineación central
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 80.0,
                                    right:
                                        80.0), // Ajuste a la izquierda y derecha
                                child: _buildSmallTextField(
                                  bandasDatos[selectedBanda!]!.last,
                                  '',
                                  (value) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Parámetros ADC:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        SizedBox(
                          width:
                              150.0, // Ancho ajustado para el primer cuadro de texto
                          child: _buildSmallTextField('P', '', (value) {}),
                        ),
                        SizedBox(
                            width:
                                20.0), // Espacio horizontal entre los cuadros de texto
                        SizedBox(
                          width:
                              150.0, // Ancho ajustado para el segundo cuadro de texto
                          child: _buildSmallTextField('Q', '', (value) {}),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Parámetros de Ferrita:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              _buildLargeTextField('Frecuencia', frecuencia ?? '', (value) {
                setState(() {
                  frecuencia = value;
                });
              }),
              SizedBox(height: 10.0),
              _buildLargeTextField('Umbral', umbral ?? '', (value) {
                setState(() {
                  umbral = value;
                });
              }),
              SizedBox(height: 10.0),
              _buildLargeTextField('Fase', fase ?? '', (value) {
                setState(() {
                  fase = value;
                });
              }),
              SizedBox(height: 10.0),
              _buildLargeTextField('Aumento de Cabezal', aumentoCabezal ?? '',
                  (value) {
                setState(() {
                  aumentoCabezal = value;
                });
              }),
              SizedBox(height: 80.0),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(
            top: 16.0), // Ajusta el margen superior según tus necesidades
        child: FloatingActionButton.extended(
          onPressed: () {
            // Navegar a la pantalla DM_ValorDetector
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DM_ValorDetector()),
            );
          },
          label: Text('Siguiente'),
          icon: Icon(Icons.arrow_forward),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildSmallTextField(
      String labelText, String value, Function(String) onChanged) {
    return SizedBox(
      width: 196.0, // Ancho ajustado para los campos de texto pequeños
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 15.0),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildLargeTextField(
      String labelText, String value, Function(String) onChanged) {
    return SizedBox(
      width: 435.0, // Ancho ajustado para los campos de texto grandes
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 15.0),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
