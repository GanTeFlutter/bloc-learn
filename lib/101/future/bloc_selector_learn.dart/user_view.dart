import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/101/future/bloc_selector_learn.dart/user_cubit.dart';
import 'package:flutter_bloc_learn/101/future/bloc_selector_learn.dart/user_model.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<UserProfileCubit, UserProfileState, String>(
              selector: (state) => state.profileImage, // Sadece userName seçiyoruz
              builder: (context, image) {
                return SizedBox(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(image),
                  ),
                );
              },
            ),
            // Kullanıcı adını izlemek için BlocSelector kullanıyoruz
            BlocSelector<UserProfileCubit, UserProfileState, String>(
              selector: (state) => state.userName, // Sadece userName seçiyoruz
              builder: (context, userName) {
                return Text(
                  'User Name: $userName',
                  style: const TextStyle(fontSize: 24, color: Colors.blue),
                );
              },
            ),
            const SizedBox(height: 20),
            // Yaşı izlemek için BlocSelector kullanıyoruz
            BlocSelector<UserProfileCubit, UserProfileState, int>(
              selector: (state) => state.age, // Sadece age seçiyoruz
              builder: (context, age) {
                return Text(
                  'Age: $age',
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                );
              },
            ),
            const SizedBox(height: 20),

            // Profil fotoğrafı değiştirme butonu
            ElevatedButton(
              onPressed: () {
                context.read<UserProfileCubit>().updateProfileImage('assets/kaydirak.jpg');
              },
              child: const Text('Change Profile Image'),
            ),

            const SizedBox(height: 20),

            // Kullanıcı adını değiştirme butonu
            ElevatedButton(
              onPressed: () {
                context.read<UserProfileCubit>().updateUserName('Jane Doe');
              },
              child: const Text('Change User Name'),
            ),

            const SizedBox(height: 20),

            // Yaşı değiştirme butonu
            ElevatedButton(
              onPressed: () {
                context.read<UserProfileCubit>().updateAge(25);
              },
              child: const Text('Change Age'),
            ),
          ],
        ),
      ),
    );
  }
}


/*
Buradaki kilit nokta, BlocSelector ve BlocBuilder arasındaki farkı anlamaktır.

BlocBuilder, bir Bloc'un tüm durum değişikliklerini dinler ve stattekı her değişiklikte widget'ı yeniden oluşturur. 
Bu, gereksiz yeniden çizimlere yol açabilir. Örneğin, bir sayfada birden fazla widget aynı Bloc'u dinliyorsa, 
bir durum değişikliği meydana geldiğinde bu widget'ların hepsi yeniden oluşturulabilir; bu, performansı olumsuz etkileyebilir.

BlocSelector ise daha optimize bir yaklaşım sunar. Sadece belirli bir state parçasını dinler ve yalnızca o parçadaki değişikliklere tepki verir.
Bu sayede gereksiz yeniden çizimlerden kaçınılır ve uygulamanın performansı artar.

Bu sayfada BlocBuilder kullansaydık, durum değişikliği olduğunda tüm widget'ların yeniden oluşturulmasına neden olabilirdi. 
Ancak BlocSelector kullanarak yalnızca ilgilendiğimiz state parçalarını dinledik ve bu parçalar değiştiğinde ilgili widget'ların yeniden oluşturulmasını sağladık. 

*/ 
