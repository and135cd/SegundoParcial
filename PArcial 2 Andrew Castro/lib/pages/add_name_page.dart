import 'package:flutter/material.dart';
import 'package:crud/services/firebase_service.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});
  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController tareaController = TextEditingController(text: "");
  TextEditingController descripcionController = TextEditingController(text: "");
  bool estadoController = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Nueva Tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: tareaController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nuevo tarea',
              ),
            ),
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la nueva descripcion',
              ),
            ),
            
            Checkbox(value: estadoController, onChanged: (value){setState(() {
              estadoController=!estadoController;
            }
            );}),
            ElevatedButton(
                onPressed: () async {
                  await addTarea(tareaController.text, descripcionController.text, estadoController).then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Guardar"))
          ],
        ),
      ),
    );
  }
}
