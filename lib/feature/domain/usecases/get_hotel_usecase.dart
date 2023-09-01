import 'package:reservetion/feature/data/models/models.dart';
import 'package:reservetion/feature/domain/repositories/repositories.dart';

class GetHotelUseCase {
  final HotelRepository repository;

  GetHotelUseCase({required this.repository});

  Future<HotelModel> call() async {
    return await repository.getHotel();
  }
}
