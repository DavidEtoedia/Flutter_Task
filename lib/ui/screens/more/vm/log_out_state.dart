import 'package:equatable/equatable.dart';

class LogOutState extends Equatable {
  const LogOutState();

  @override
  List<Object> get props => [];
}

class LogOutStateInitial extends LogOutState {
  const LogOutStateInitial();

  @override
  List<Object> get props => [];
}

class LogOutStateLoading extends LogOutState {
  const LogOutStateLoading();

  @override
  List<Object> get props => [];
}

class LogOutStateSuccess extends LogOutState {
  const LogOutStateSuccess();

  @override
  List<Object> get props => [];
}

class LogOutStateError extends LogOutState {
  final String error;

  const LogOutStateError(this.error);

  @override
  List<Object> get props => [error];
}
