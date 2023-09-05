import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservation/feature/data/models/hotel_model.dart';
import 'package:reservation/feature/data/models/models.dart';
import 'package:reservation/feature/data/models/room_model.dart';
import 'package:reservation/feature/domain/usecases/get_hotel_usecase.dart';
import 'package:reservation/feature/domain/usecases/get_reservation_usecase.dart';
import 'package:reservation/feature/domain/usecases/get_rooms_usecase.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final GetHotelUseCase getHotelUseCase;
  final GetRoomsUseCase getRoomsUseCase;
  final GetReservationUseCase getReservationUseCase;

  HotelCubit({
    required this.getHotelUseCase,
    required this.getRoomsUseCase,
    required this.getReservationUseCase,
  }) : super(HotelInitial());

  getHotel() async {
    emit(HotelLoading());
    try {
      final hotel = await getHotelUseCase();
      emit(HotelLoaded(hotel: hotel));
    } catch (e) {
      emit(HotelError());
    }
  }

  getRooms() async {
    emit(RoomsLoading());
    try {
      final rooms = await getRoomsUseCase();
      emit(RoomsLoaded(rooms: rooms));
    } catch (e) {
      emit(RoomsError());
    }
  }

  getReservation() async {
    emit(ReservationLoading());
    try {
      final reservation = await getReservationUseCase();
      emit(ReservationLoaded(reservation: reservation));
    } catch (e) {
      emit(ReservationError());
    }
  }
}
