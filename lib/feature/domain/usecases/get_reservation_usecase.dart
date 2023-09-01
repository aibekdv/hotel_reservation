import 'package:reservetion/feature/data/models/models.dart';
import 'package:reservetion/feature/domain/repositories/repositories.dart';

class GetReservationUseCase {
  final HotelRepository repository;

  GetReservationUseCase({required this.repository});

  Future<ReservationModel> call() async {
    return await repository.getReservation();
  }
}
