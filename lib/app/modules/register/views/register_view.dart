import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
        body: Form(
            key: controller.formkey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(hintText: "Masukkan password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password tidak boleh kosong";
                      }
                      return null;
                    }),
                TextFormField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(hintText: "Masukkan username"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "username tidak boleh kosong";
                      }
                      return null;
                    }),
                TextFormField(
                    controller: controller.namaController,
                    decoration: InputDecoration(hintText: "Masukkan nama"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "nama tidak boleh kosong";
                      }
                      return null;
                    }),
                TextFormField(
                    controller: controller.telpController,
                    decoration: InputDecoration(hintText: "Masukkan telpon"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nomor telpon tidak boleh kosong";
                      }
                      return null;
                    }),
                TextFormField(
                    controller: controller.alamatController,
                    decoration: InputDecoration(hintText: "Masukkan alamat"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "alamat tidak boleh kosong";
                      }
                      return null;
                    }),


                Obx(() =>
                controller.LoadingRegister.value?
                CircularProgressIndicator():
                ElevatedButton(
                    onPressed: () {
                      controller.addregist();
                    },
                    child: Text("Register"))),


              ],
            )),
    );
  }
}
