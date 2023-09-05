import 'package:reservation/feature/data/models/models.dart';
import 'package:reservation/feature/domain/repositories/repositories.dart';

class GetReservationUseCase {
  final HotelRepository repository;

  GetReservationUseCase({required this.repository});

  Future<ReservationModel> call() async {
    return await repository.getReservation();
  }
}
