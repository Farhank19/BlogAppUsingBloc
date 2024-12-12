import 'package:equatable/equatable.dart';

abstract class ContactState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ContactInitial extends ContactState {}

class ContactSubmitting extends ContactState {}

class ContactSubmitted extends ContactState {
  final String confirmationMessage;

  ContactSubmitted(this.confirmationMessage);

  @override
  List<Object?> get props => [confirmationMessage];
}

class ContactError extends ContactState {
  final String message;

  ContactError(this.message);

  @override
  List<Object?> get props => [message];
}
