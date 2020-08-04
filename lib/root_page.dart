import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'loading_page.dart';
import 'login_page.dart';
import 'tab_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('root_page created');
    return _handleCurrentScreen();
  }


  //로그인 상태에 따라서 다르게 분기, 로그인 상태에 따른 분기


  Widget _handleCurrentScreen() {
//    return LoginPage();

  return StreamBuilder(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context, AsyncSnapshot snapshot){
      //연결 상태가 기다리는 중이라면 로딩 페이지를 반환
      if (snapshot.connectionState == ConnectionState.waiting) {
        return LoadingPage();
      } else {
        if (snapshot.hasData) {
          return TabPage(snapshot.data);
        }
        return LoginPage();

      }
    },

  );

  }
}
