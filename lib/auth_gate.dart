import 'package:fire_ui_app/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
                providerConfigs: const [
                  EmailProviderConfiguration(),
                  GoogleProviderConfiguration(
                    // GoogleService-Info.pilistのCLIENT_IDの下のコードを貼り付ける
                      clientId:
                          '921169842014-b6j085hcljlcvkf2uoqo648hbe7ukebf.apps.googleusercontent.com')
                ],
                headerBuilder: (context, constraints, _) {
                  return const CircleAvatar(
                    radius: 75,
                    // images.unsplash.comの画像のパスを貼り付ける
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1658033014478-cc3b36e31a5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
                  );
                },
                subtitleBuilder: (context, action) {
                  // 署名画面にいるかを確認するには、アクションパラメーターを使用できる
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(action == AuthAction.signIn
                        ? "FlutterFire UI - Sign In"
                        : "FlutterFire UI - Sign Up"),
                  );
                },
                // footerBuilderを使えば下部にメッセージを表示できる
                footerBuilder: (context, actions) {
                  return const Text(
                    'By signing in, you agree to our terms and conditicons',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  );
                });
          }

          return HomeScreen(user: snapshot.data!);
        });
  }
}
