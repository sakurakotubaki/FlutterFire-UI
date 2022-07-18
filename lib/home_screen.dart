import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterfire_ui/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    print(user); // userのデータをデバッグ
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterFire UI Auth'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            // メールアドレス・パスワードのログインでは、nullのエラーになるので、コメントアウトする!
            // CircleAvatar(radius: 30, backgroundImage: NetworkImage(user.photoURL!),),
            // Text(
            //   user.displayName!,
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold
            //   ),
            // ),
            // SizedBox(height: 10),
            Text(
              user.email!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),
            const SignOutButton()
          ],
        ),
      ),
    );
  }
}
