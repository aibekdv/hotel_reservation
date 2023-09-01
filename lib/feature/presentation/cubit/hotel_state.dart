part of 'hotel_cubit.dart';

abstract class HotelState extends Equatable {
  const HotelState();

  @override
  List<Object> get props => [];
}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelLoaded extends HotelState {
  final HotelModel hotel;

  const HotelLoaded({required this.hotel});
}

class HotelError extends HotelState {}

class RoomsLoading extends HotelState {}

class RoomsLoaded extends HotelState {
  final List<RoomModel> rooms;

  const RoomsLoaded({required this.rooms});
}

class RoomsError extends HotelState {}

class ReservationLoading extends HotelState {}

class ReservationLoaded extends HotelState {
  final ReservationModel reservation;

  const ReservationLoaded({required this.reservation});
}

class ReservationError extends HotelState {}
