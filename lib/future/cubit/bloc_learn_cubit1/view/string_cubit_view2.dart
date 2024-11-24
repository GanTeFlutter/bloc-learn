import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/future/cubit/bloc_learn_cubit1/cubit/home_view_cubit.dart';

class StringCubitView2 extends StatefulWidget {
  const StringCubitView2({super.key});

  @override
  State<StringCubitView2> createState() => _StringCubitView2State();
}

class _StringCubitView2State extends State<StringCubitView2> {
  // TextField için bir TextEditingController oluşturuluyor.
  // Bu sayede TextField'a girilen metin alınabilecek.
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StringCubitView2'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customSizedBox(),
              // StringCubit'in state'ini gösteren Text widget'ı
              BlocBuilder<StringCubit, String>(
                builder: (context, state) => Center(
                    child: Text('StringCubit: $state',
                        style: const TextStyle(fontSize: 24, color: Colors.green))),
              ),
              customSizedBox(),
              // TextField
              SizedBox(
                width: 300,
                child: TextField(
                  // TextField için oluşturulan TextEditingController
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                      hintText: 'Bir metin giriniz', border: OutlineInputBorder()),
                ),
              ),
              customSizedBox(),
              // Update Text butonu
              ElevatedButton(
                onPressed: () =>
                    context.read<StringCubit>().updateText(_textEditingController.text),
                child: const Text('Update Text'),
              ),
              customSizedBox(),
              // Append Text butonu
              ElevatedButton(
                onPressed: () =>
                    context.read<StringCubit>().appendText(_textEditingController.text),
                child: const Text('Yeni metin ekle'),
              ),
              customSizedBox(),
              // Clear Text butonu
              ElevatedButton(
                onPressed: () => context.read<StringCubit>().clearText(),
                child: const Text('Clear Text', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Bir SizedBox döndüren metot
  SizedBox customSizedBox() => const SizedBox(height: 20);
}

/*
_textEditingController.text ile TextField'a girilen metni anlik olarak alabiliriz.


SizedBox customSizedBox() => const SizedBox(height: 20); metodu ile bir SizedBox döndürüyoruz.
Bu şekilde kod tekrarını önlemiş oluyoruz.Ayrıca kodumuz daha okunabilir hale geliyor.Ve bence daha güzel görünüyor.

*/
