import 'package:flutter/material.dart';
import 'DM_DatosEquipo.dart'; // Importa la pantalla DM_DatosEquipo.dart

class DMFormScreen extends StatefulWidget {
  @override
  _DMFormScreenState createState() => _DMFormScreenState();
}

class _DMFormScreenState extends State<DMFormScreen> {
  final TextEditingController clienteController = TextEditingController();
  final TextEditingController contactoController = TextEditingController();
  final TextEditingController requerimientoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController cargoController = TextEditingController();
  final TextEditingController plantaController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController asesorController = TextEditingController();
  final TextEditingController tecnico1Controller = TextEditingController();
  final TextEditingController tecnico2Controller = TextEditingController();

  bool showTecnico2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Registro de Cliente:'),
              SizedBox(height: 20.0),
              TextFormField(
                controller: clienteController,
                decoration: InputDecoration(
                  labelText: 'Cliente',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: contactoController,
                decoration: InputDecoration(
                  labelText: 'Contacto',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: requerimientoController,
                decoration: InputDecoration(
                  labelText: 'N° Requerimiento',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: correoController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: telefonoController,
                decoration: InputDecoration(
                  labelText: 'Teléfono/Celular',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: cargoController,
                decoration: InputDecoration(
                  labelText: 'Cargo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: plantaController,
                decoration: InputDecoration(
                  labelText: 'Planta',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: direccionController,
                decoration: InputDecoration(
                  labelText: 'Dirección',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: asesorController,
                decoration: InputDecoration(
                  labelText: 'Asesor Comercial',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: tecnico1Controller,
                      decoration: InputDecoration(
                        labelText: 'Técnico 1',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        showTecnico2 = true;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              if (showTecnico2)
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: tecnico2Controller,
                        decoration: InputDecoration(
                          labelText: 'Técnico 2',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          showTecnico2 = false;
                        });
                      },
                    ),
                  ],
                ),
              SizedBox(height: 80.0),  // Espacio adicional para separar el botón
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),  // Padding hacia abajo
        child: FloatingActionButton.extended(
          onPressed: () {
            // Aquí puedes agregar la lógica para guardar los datos
            String cliente = clienteController.text;
            String contacto = contactoController.text;
            String requerimiento = requerimientoController.text;
            String correo = correoController.text;
            String telefono = telefonoController.text;
            String cargo = cargoController.text;
            String planta = plantaController.text;
            String direccion = direccionController.text;
            String asesor = asesorController.text;
            String tecnico1 = tecnico1Controller.text;
            String tecnico2 = tecnico2Controller.text;

            // Por ahora, solo imprimimos los datos
            print('Cliente: $cliente');
            print('Contacto: $contacto');
            print('N° Requerimiento: $requerimiento');
            print('Correo electrónico: $correo');
            print('Telefono/Celular: $telefono');
            print('Cargo: $cargo');
            print('Planta: $planta'); 
            print('Dirección: $direccion');
            print('Asesor: $asesor');
            print('Técnico 1: $tecnico1');
            print('Técnico 2: $tecnico2');

            // Navegar a la pantalla DM_DatosEquipo.dart
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DMDatosEquipo()),
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
