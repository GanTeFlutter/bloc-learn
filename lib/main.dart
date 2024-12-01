import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_learn/demo/bloc_market_card/home/home_view.dart';
import 'package:flutter_bloc_learn/product/init/app_initialize.dart';
import 'package:flutter_bloc_learn/product/init/state_initialize.dart';
import 'package:lottie/lottie.dart';

//Main dosyamız temiz olsun diye AppInitialize ve StateInitialize sınıflarını oluşturduk.
//BlocProvider ve MultiBlocProvider kullanımını StateInitialize sınıfında görebilirsiniz.
Future<void> main() async {
  await AppInitialize().make();
  runApp(const StateInitialize(child: _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const Denem22(),
    );
  }
}

class Denem22 extends StatefulWidget {
  const Denem22({super.key});

  @override
  State<Denem22> createState() => _Denem22State();
}

class _Denem22State extends State<Denem22> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottie/lottieee.json'),
      ),
    );
  }
}

// class Denemwee extends StatefulWidget {
//   const Denemwee({super.key});

//   @override
//   State<Denemwee> createState() => _DenemweeState();
// }

// class _DenemweeState extends State<Denemwee> {
//   @override
//   Widget build(BuildContext context) {
//     const String svgString = '''
// <svg width="800px" height="800px" viewBox="0 0 1024 1024" class="icon"  version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M786 279l-48-13 48-13 13-48 13 48 49 13-49 13-13 49-13-49zM834 332l-19-4 19-5 4-19 5 19 19 5-19 4-5 19-4-19z" fill="#FDCD60" /><path d="M159 715l-21-5 21-5 5-21 5 21 21 5-21 5-5 21-5-21z" fill="#FDCD60" /><path d="M244 247m-9 0a9 9 0 1 0 18 0 9 9 0 1 0-18 0Z" fill="#5546CB" /><path d="M288 821l-27-6 27-7 6-27 7 27 27 7-27 6-7 27-6-27z" fill="#FDCD60" /><path d="M832 828a25 25 0 1 1 25-25 25 25 0 0 1-25 25z m0-36a10 10 0 1 0 10 10 10 10 0 0 0-10-10z" fill="#5546CB" /><path d="M627 502l-10-17 11-7V287l-22 14a95 95 0 0 1 3 24c0 28-19 64-58 108 21 7 34 19 34 34s-31 40-71 40-71-17-71-40 13-27 34-34l-25-30-40 26v180h2l11-7 11 17-17 10h-7v112l216-102V501z m-135 83l-16 10-8 5-8 5h-1l-5-9-5-8 9-5 24-15 10 17z m56-35l-33 20-10-17 33-20 10 17z m56-35l-33 20-10-17 17-10 16-10 10 17zM188 640l204 99V427L188 296z m162-74l32 22-11 16-32-22z m-57-31l4-5 8 6 23 16-11 16-15-11-8-6-8-6z m-42-45a29 29 0 1 1-29 29 29 29 0 0 1 30-29zM648 477l12 6-9 18-3-2v141l217 95V428L648 285z m176 68a29 29 0 1 1-29 29 29 29 0 0 1 29-29z m-72-15l36 19-9 18-36-18z m-69-23l5-10 9 4 9 4 18 9-9 18-27-14-9-4z" fill="#FDCD60" /><path d="M640 256l-41 27a95 95 0 0 0-181 43c0 17 7 38 22 61l-37 24-235-151v392l236 115 233-110 248 108V417z m-202 69a75 75 0 0 1 151 0c0 33-40 81-75 118-62-63-76-99-76-118z m97 124c18 4 29 12 29 18s-20 20-51 20-51-12-51-20 11-14 29-18l15 15 7 7 7-7zM392 739l-204-99V296l204 131z m20 2V630h7l17-10-11-17-11 7h-2V429l40-26 25 30c-21 7-34 19-34 34s31 40 71 40 71-17 71-40-13-27-34-34c39-44 58-80 58-108a95 95 0 0 0-3-24l22-14v190l-11 7 10 17h1v138z m453-6l-217-95V499l3 2 9-18-12-6V285l217 143z" fill="#5546CB" /><path d="M286 546l8 5 8 6 15 11 12-17-24-16-8-6-4 5-7 12zM371 604l11-16-32-22-11 16 32 22zM481 568l-24 15-9 5 1 1h-1l5 8 5 9v-1l1 1 8-5 9-5h-1l17-11-11-17zM537 534l-33 20 11 17 33-20-10-17h-1zM594 499l-16 10-17 10 10 17 33-20-10-17zM679 515l9 4 27 14 9-17v-1l-18-9-9-4-9-5-5 10-4 8zM779 566l9-18-36-18-9 17v1l36 18z" fill="#5546CB" /><path d="M824 585a11 11 0 1 0-11-11 11 11 0 0 0 11 11z" fill="#F97744" /><path d="M824 603a29 29 0 1 0-29-29 29 29 0 0 0 29 29z m0-40a11 11 0 1 1-11 11 11 11 0 0 1 11-11z" fill="#5546CB" /><path d="M252 530a11 11 0 1 0-11-11 11 11 0 0 0 11 11z" fill="#FFFFFF" /><path d="M252 548a29 29 0 1 0-29-29 29 29 0 0 0 29 29z m0-40a11 11 0 1 1-11 11 11 11 0 0 1 11-11z" fill="#5546CB" /><path d="M507 465l-15-15c-18 4-29 12-29 18s20 20 51 20 51-12 51-20-11-14-29-18l-15 15-7 7z" fill="#AFBCF3" /><path d="M514 444c36-37 75-85 75-118a75 75 0 0 0-151 0c0 18 14 54 76 118z m-35-117a35 35 0 1 1 35 35 35 35 0 0 1-35-35z" fill="#F97744" /><path d="M514 327m-35 0a35 35 0 1 0 70 0 35 35 0 1 0-70 0Z" fill="#FFFFFF" /></svg>
// ''';
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Denemwee'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.string(
//               svgString,
//               width: 500,
//               height: 500,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
