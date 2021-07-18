import 'package:financial_app/Models/keranjang.dart';
import 'package:financial_app/Repositories/repository.dart';

class KeranjangService {
  Repository _repository;
  KeranjangService() {
    _repository = Repository();
  }
  saveKeranjang(Keranjang keranjang) async {
    return await _repository.insertData('keranjang', keranjang.keranjangMap());
  }

  readKeranjang() async {
    return await _repository.readData('keranjang');
  }

  deleteKeranjang() async {
    return await _repository.removeData('keranjang');
  }
}
