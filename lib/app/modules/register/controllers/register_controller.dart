import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:peminjam_perpustakaan_app/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_app/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_app/app/data/provider/storage_provider.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  final LoadingRegister = false.obs;

    addregist() async {
      LoadingRegister(true);
      try {
        FocusScope.of(Get.context!).unfocus();
        formkey.currentState?.save();
        if (formkey.currentState!.validate()) {
          final response = await ApiProvider.instance().post(Endpoint.register,
              data: {
                "password": passwordController.text.toString(),
                "username": usernameController.text.toString(),
                "nama": namaController.text.toString(),
                "telp": telpController.text.toString(),
                "alamat": alamatController.text.toString(),
              }

          );
          if (response.statusCode == 201) {
            Get.back();

          } else {
            Get.snackbar("Sorry", "Gagal menyimpan data",
                backgroundColor: Colors.orange);
          }
        }
        LoadingRegister(false);
      } on dio.DioException catch (e) {
        LoadingRegister(false);
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      } catch (e) {
        LoadingRegister(false);
        Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
        throw Exception('Error: $e');
      }
    }
  }

