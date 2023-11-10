import 'package:equatable/equatable.dart';

class UploadState extends Equatable {
  const UploadState();

  @override
  List<Object> get props => [];
}

class UploadStateInitial extends UploadState {
  const UploadStateInitial();

  @override
  List<Object> get props => [];
}

class UploadStateLoading extends UploadState {
  const UploadStateLoading();

  @override
  List<Object> get props => [];
}

class UploadStateSuccess extends UploadState {
  const UploadStateSuccess();

  @override
  List<Object> get props => [];
}

class UploadStateError extends UploadState {
  final String error;

  const UploadStateError(this.error);

  @override
  List<Object> get props => [error];
}
