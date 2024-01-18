import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/modules/add_peminjaman/controllers/add_peminjaman_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPeminjamanController>(
      () => AddPeminjamanController(),
    );
  }
}
