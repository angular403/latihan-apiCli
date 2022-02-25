import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihanapicli/app/data/models/user_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView latihan Cli'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
          future: controller.getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }
            if (snapshot.data?.length == 0) {
              return Center(
                child: Text("Data Tidak ada"),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  User user = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("${user.avatar}"),
                    ),
                    title: Text("${user.firstName} ${user.lastName}"),
                    subtitle: Text("${user.email}"),
                  );
                },
              );
            }
          }),
    );
  }
}
