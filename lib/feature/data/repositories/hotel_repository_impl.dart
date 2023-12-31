import 'package:reservation/feature/data/datasources/remote_data_source.dart';
import 'package:reservation/feature/data/models/hotel_model.dart';
import 'package:reservation/feature/data/models/reservation_model.dart';
import 'package:reservation/feature/data/models/room_model.dart';
import 'package:reservation/feature/domain/repositories/repositories.dart';

class HotelRepositoryImpl implements HotelRepository {
  final RemoteDataSource remoteDataSource;

  HotelRepositoryImpl({required this.remoteDataSource});

  @override
  Future<HotelModel> getHotel() async => await remoteDataSource.getHotel();

  @override
  Future<ReservationModel> getReservation() async =>
      await remoteDataSource.getReservation();

  @override
  Future<List<RoomModel>> getRooms() async => await remoteDataSource.getRooms();
}
