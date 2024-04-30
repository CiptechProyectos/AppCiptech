import 'package:flutter/material.dart';
import 'DM_OpcionUsuario.dart'; // Importa Opcion_Usuario.dart aquí

class DMDatosEquipo extends StatefulWidget {
  @override
  _DMDatosEquipoState createState() => _DMDatosEquipoState();
}

class _DMDatosEquipoState extends State<DMDatosEquipo> {
  String selectedLinea = 'Loma System';
  String selectedModelo = '';
  List<String> lineas = ['Loma System', 'Anritsu'];
  List<String> modelosLomaSystem = [
    'IQ3',
    'IQ3 ST',
    'IQ3+',
    'IQ3 +E',
    'IQ4',
    'IQ4H'
  ];
  List<String> modelosAnritsu = ['DM1', 'DM2', 'DM3'];
  List<String> modelos = [];
  List<String> tamanosH = [
    '75 H',
    '100 H',
    '150 H',
    '200 H',
    '250 H',
    '300 H',
    '350 H',
    '400 H',
    '450 H'
  ];
  List<String> tamanosW = [
    '75 W',
    '100 W',
    '200 W',
    '350 W',
    '400 W',
    '450 W',
    '650 W'
  ];
  List<String> tiposCinta = ['Sanitario', 'Modular'];
  List<String> garantiasVigentes = ['Equipo', 'Repuesto', 'Servicio'];
  List<String> selectedGarantias = [];
  List<String> condicionLinea = ['Proceso', 'Detenida', 'Mantto'];
  List<String> selectedCondicionLinea = [];

  final TextEditingController modeloController = TextEditingController();
  final TextEditingController serieController = TextEditingController();
  final TextEditingController frecuenciaController = TextEditingController();
  final TextEditingController versionController1 =
      TextEditingController(text: ' ');
  final TextEditingController versionController2 =
      TextEditingController(text: ' ');
  final TextEditingController codigoEquipoController = TextEditingController();
  final TextEditingController lineaAreaController = TextEditingController();
  final TextEditingController tipoCintaController = TextEditingController();
  final TextEditingController fechaCompraController = TextEditingController();
  final TextEditingController tamanoAperturaHController =
      TextEditingController();
  final TextEditingController tamanoAperturaWController =
      TextEditingController();

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    if (selectedLinea == 'Loma System') {
      modelos = modelosLomaSystem;
      if (!modelos.contains(selectedModelo)) {
        selectedModelo = '';
      }
    } else if (selectedLinea == 'Anritsu') {
      modelos = modelosAnritsu;
      if (!modelos.contains(selectedModelo)) {
        selectedModelo = '';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('2.- Datos del Equipo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Registro de Equipo:'),
              SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                value: selectedLinea,
                items: lineas.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLinea = value ?? 'Loma System';
                    selectedModelo = '';
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: selectedModelo.isNotEmpty ? selectedModelo : null,
                items: modelos.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedModelo = value ?? '';
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Modelo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: serieController,
                decoration: InputDecoration(
                  labelText: 'Serie',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: frecuenciaController,
                decoration: InputDecoration(
                  labelText: 'Frecuencia',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: versionController1,
                      decoration: InputDecoration(
                        labelText: 'Versión de Software CPU',
                        border: OutlineInputBorder(),
                        prefixText: 'v1 ', // Agregar prefijo 'v1 '
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextFormField(
                      controller: versionController2,
                      decoration: InputDecoration(
                        labelText: 'Versión de Software GUI',
                        border: OutlineInputBorder(),
                        prefixText: 'v2 ', // Agregar prefijo 'v2 '
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: codigoEquipoController,
                decoration: InputDecoration(
                  labelText: 'Código de Equipo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: lineaAreaController,
                decoration: InputDecoration(
                  labelText: 'Línea/Área',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: tamanoAperturaHController.text.isNotEmpty
                          ? tamanoAperturaHController.text
                          : null,
                      items: tamanosH.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          tamanoAperturaHController.text = value ?? '';
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Tamaño de Apertura (H)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Icon(Icons.close,
                      color: Colors.grey), // Icono "x" como separador
                  SizedBox(width: 10.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: tamanoAperturaWController.text.isNotEmpty
                          ? tamanoAperturaWController.text
                          : null,
                      items: tamanosW.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          tamanoAperturaWController.text = value ?? '';
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Tamaño de Apertura (W)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: tipoCintaController.text.isNotEmpty
                    ? tipoCintaController.text
                    : null,
                items: tiposCinta.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    tipoCintaController.text = value ?? '';
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Tipo de Cinta',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Text('Garantías Vigentes:'),
              SizedBox(height: 10.0),
              Column(
                children: garantiasVigentes.map((item) {
                  return Row(
                    children: [
                      Checkbox(
                        value: selectedGarantias.contains(item),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              if (value) {
                                selectedGarantias.add(item);
                              } else {
                                selectedGarantias.remove(item);
                              }
                            }
                          });
                        },
                      ),
                      Text(item),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              Text('Condición de Línea:'),
              SizedBox(height: 10.0),
              Column(
                children: condicionLinea.map((item) {
                  return Row(
                    children: [
                      Checkbox(
                        value: selectedCondicionLinea.contains(item),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              if (value) {
                                selectedCondicionLinea.add(item);
                              } else {
                                selectedCondicionLinea.remove(item);
                              }
                            }
                          });
                        },
                      ),
                      Text(item),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: fechaCompraController,
                      decoration: InputDecoration(
                        labelText: 'Fecha de Compra (YYYY-MM-DD)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null && pickedDate != selectedDate)
                        setState(() {
                          selectedDate = pickedDate;
                          fechaCompraController.text =
                              '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}';
                        });
                    },
                  ),
                ],
              ),
              SizedBox(height: 90.0),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            String modelo = selectedModelo;
            String serie = serieController.text;
            String frecuencia = frecuenciaController.text;
            String version1 = versionController1.text;
            String version2 = versionController2.text;
            String codigoEquipo = codigoEquipoController.text;
            String lineaArea = lineaAreaController.text;
            String tipoCinta = tipoCintaController.text;
            String fechaCompra = fechaCompraController.text;
            String tamanoAperturaH = tamanoAperturaHController.text;
            String tamanoAperturaW = tamanoAperturaWController.text;

            print('Línea: $selectedLinea');
            print('Modelo: $modelo');
            print('Serie: $serie');
            print('Frecuencia: $frecuencia');
            print('Versión de Software 1: $version1');
            print('Versión de Software 2: $version2');
            print('Código de Equipo: $codigoEquipo');
            print('Línea/Área: $lineaArea');
            print('Tipo de Cinta: $tipoCinta');
            print('Fecha de Compra: $fechaCompra');
            print('Tamaño de Apertura (h): $tamanoAperturaH');
            print('Tamaño de Apertura (w): $tamanoAperturaW');
            print('Garantías Vigentes: $selectedGarantias');
            print('Condición de Línea: $selectedCondicionLinea');

            // Navegar a la pantalla OpcionUsuario
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      OpcionUsuario()), // Reemplaza OpcionUsuario con el nombre de tu StatefulWidget en Opcion_Usuario.dart
            );
          },
          label: Text('Siguiente'),
          icon: Icon(Icons.arrow_forward),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
