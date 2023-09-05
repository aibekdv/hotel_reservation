import 'package:reservation/feature/data/models/models.dart';
import 'package:reservation/feature/domain/repositories/repositories.dart';

class GetRoomsUseCase {
  final HotelRepository repository;

  GetRoomsUseCase({required this.repository});

  Future<List<RoomModel>> call() async {
    return await repository.getRooms();
  }
}
