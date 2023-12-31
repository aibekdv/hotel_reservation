import 'package:reservation/feature/data/models/models.dart';

abstract class HotelRepository {
  Future<HotelModel> getHotel();
  Future<List<RoomModel>> getRooms();
  Future<ReservationModel> getReservation();
}
