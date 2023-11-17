import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_dog/features/home/presenter/stores/home_page_store.dart';
import 'package:happy_dog/shared/components/button_signout.dart';
import 'package:happy_dog/shared/components/remove_account.dart';

class HomePage extends StatelessWidget {
  final HomePageStore store;
  const HomePage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            store.isLoading == true
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: ButtonSignout(
                              onPressed: () async {
                                await store.signout();
                                if (store.isError == false) {
                                  context.go('/initial_page');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 180),
                      Center(
                          child: Text(
                        'Welcome to HappyDog  ',
                        style: Theme.of(context).textTheme.headlineLarge,
                      )),
                      Padding(
                        padding: const EdgeInsets.only(top: 250),
                        child: RemoveAccount(
                          onPressed: () async {
                            await store.removeAccount();
                            if (store.isError == false) {
                              context.go('/initial_page');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      );
    });
  }
}
