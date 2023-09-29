import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});
  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController tareaController = TextEditingController(text: "");
  TextEditingController descripcionController= TextEditingController(text: "");
  bool estadoController = false;
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    tareaController.text = arguments['tarea'];
    descripcionController.text = arguments['descripcion'];
    bool estadoController = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: tareaController,
              decoration: const InputDecoration(
                hintText: 'Actualice el tarea',
              ),
            ),
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(
                hintText: 'Actualice la descripcion',
              ),
            ),
            Checkbox(value: estadoController, onChanged: (value){setState(() {
              estadoController=!estadoController;
            }
            );}),        

            ElevatedButton(
                onPressed: () async {
                  await updateTarea(arguments['uid'], tareaController.text, descripcionController.text, estadoController)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Actualizar"))
          ],
        ),
      ),
    );
  }
}
