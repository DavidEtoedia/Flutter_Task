import 'package:equatable/equatable.dart';

class UpdateState extends Equatable {
  const UpdateState();

  @override
  List<Object> get props => [];
}

class UpdateStateInitial extends UpdateState {
  const UpdateStateInitial();

  @override
  List<Object> get props => [];
}

class UpdateStateLoading extends UpdateState {
  const UpdateStateLoading();

  @override
  List<Object> get props => [];
}

class UpdateStateSuccess extends UpdateState {
  const UpdateStateSuccess();

  @override
  List<Object> get props => [];
}

class UpdateStateError extends UpdateState {
  final String error;

  const UpdateStateError(this.error);

  @override
  List<Object> get props => [error];
}
