import 'package:flutter/material.dart';
import 'DM_DatosGeneralesProducto.dart'; // Asegúrate de importar DM_DatosProducto.dart

  class DM_ValorDetector extends StatefulWidget {
    @override
    _DM_ValorDetectorState createState() => _DM_ValorDetectorState();
  }

  class _DM_ValorDetectorState extends State {
    List<Map<String, dynamic>> productOptions = [
      {'type': null}
    ]; // Lista para almacenar las opciones de producto, inicialmente con dos registros

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('6.- Valores de Detección'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tipo de Producto 1:',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 10.0),
                    DropdownButton<String>(
                      value: productOptions[0]['type'],
                      onChanged: (String? newValue) {
                        setState(() {
                          productOptions[0]['type'] =
                              newValue; // Actualizar el valor seleccionado
                        });
                      },
                      items: <String>['Metalizado', 'No Metalizado']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    if (productOptions[0]['type'] == 'Metalizado' ||
                        productOptions[0]['type'] ==
                            'No Metalizado') // Mostrar cajas de texto si se selecciona "Metalizado" o "No Metalizado"
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.0),
                          Text(
                            'Ingresar Valores:',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(labelText: 'FE'),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(labelText: 'NF'),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(labelText: 'Inox'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    SizedBox(height: 20.0),
                  ],
                ),
                if (productOptions.length <
                    2) // Mostrar el botón "Agregar" solo si hay menos de dos formularios
                  SizedBox(height: 00.0),
                ElevatedButton(
                  onPressed: () {
                    if (productOptions.length < 2) {
                      // Verificar que aún no hay dos formularios presentes antes de agregar uno nuevo
                      setState(() {
                        productOptions.add({
                          'type': null
                        }); // Agregar una nueva opción de producto
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 98, 178, 244), // Color azulino
                  ),
                  child: Text(
                    'Agregar',
                    style:
                        TextStyle(color: Colors.white), // Color del texto blanco
                  ),
                ),

                if (productOptions.length ==
                    2) // Mostrar el segundo registro solo si hay dos registros
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50.0),
                      Text(
                        'Tipo de Producto 2:',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 10.0),
                      DropdownButton<String>(
                        value: productOptions[1]['type'],
                        onChanged: (String? newValue) {
                          setState(() {
                            productOptions[1]['type'] =
                                newValue; // Actualizar el valor seleccionado
                          });
                        },
                        items: <String>['Metalizado', 'No Metalizado']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      if (productOptions[1]['type'] == 'Metalizado' ||
                          productOptions[1]['type'] ==
                              'No Metalizado') // Mostrar cajas de texto si se selecciona "Metalizado" o "No Metalizado"
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.0),
                            Text(
                              'Ingresar Valores:',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(labelText: 'FE'),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(labelText: 'NF'),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(labelText: 'Inox'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            productOptions
                                .removeAt(1); // Eliminar el segundo registro
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color.fromARGB(255, 222, 37, 37), // Color ligero
                        ),
                        child: Text(
                          'Eliminar',
                          style: TextStyle(
                              color: Colors.white), // Color del texto blanco
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 20.0),
                // Aquí debajo iría el segundo formulario y el botón de eliminar
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Navegar a la pantalla DM_DatosProducto
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DM_DatosProducto()),
            );
          },
          label: Text('Siguiente'),
          icon: Icon(Icons.arrow_forward),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }
