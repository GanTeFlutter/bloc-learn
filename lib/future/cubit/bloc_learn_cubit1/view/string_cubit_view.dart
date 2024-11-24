import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/future/cubit/bloc_learn_cubit1/cubit/home_view_cubit.dart';

class StringCubitView extends StatefulWidget {
  const StringCubitView({super.key});

  @override
  State<StringCubitView> createState() => _StringCubitViewState();
}

class _StringCubitViewState extends State<StringCubitView> {
  @override
  Widget build(BuildContext context) {
    debugPrint('--StringCubitView build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('StringCubitView'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocBuilder ile StringCubit'ın state'ini dinliyoruz
            BlocBuilder<StringCubit, String>(
              builder: (context, count) => Center(
                  child: Text('StringCubit: $count',
                      style: const TextStyle(fontSize: 24, color: Colors.green))),
            ),
            const SizedBox(height: 20),
            // Update Text butonu
            ElevatedButton(
              onPressed: () => context.read<StringCubit>().updateText('Updated Text'),
              child: const Text('Update Text'),
            ),
            const SizedBox(height: 20),
            // Clear Text butonu
            ElevatedButton(
              onPressed: () => context.read<StringCubit>().clearText(),
              child: const Text('Clear Text'),
            ),
            const SizedBox(height: 20),
            // Append Text butonu
            ElevatedButton(
              onPressed: () => context.read<StringCubit>().appendText(' eklenen metin'),
              child: const Text('Yeni metin ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
