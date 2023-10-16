import 'package:api_curd/appbutton.dart';
import 'package:api_curd/base_client.dart';
import 'package:api_curd/usermodel.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Appbutton(
              name: "GET METHOD",
              onclick: () async {
                var response = await Baseclient().get('/users');
                if (response == null) {
                  return;
                }
                debugPrint('success');
                var users = usersFromJson(response);
                print(users.length.toString());
              },
            ),
            Appbutton(
              name: "POST METHOD",
              onclick: () async {
                var user = Users(
                  name: 'rabi',
                  email: 'shibili@gmail.com',
                  phone: '8848555711',
                );
                var response = await Baseclient().post(
                  '/users',
                  user,
                );
                if (response == null) return;
                print("successfull");
              },
            ),
            Appbutton(
              name: "PUT METHOD",
              onclick: () async {
                var id = 2;
                var user = Users(
                  name: 'mohammed',
                  email: 'shibili@gmail.com',
                  phone: '8848555711',
                );
                var response = await Baseclient()
                    .put(
                      '/users/$id',
                      user,
                    )
                    .catchError((err) {});
                if (response == null) return;
                print("successfull");
              },
            ),
            Appbutton(
              name: "DELETE METHOD",
              onclick: () async {
                var id = 2;
                var response = await Baseclient().delete('/users/$id');
                if (response == null) return;

                debugPrint('successully deleted');
              },
            ),
          ],
        ),
      ),
    );
  }
}
