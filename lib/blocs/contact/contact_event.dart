import 'package:equatable/equatable.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitContactForm extends ContactEvent {
  final String name;
  final String email;
  final String subject;
  final String message;

  SubmitContactForm({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  @override
  List<Object?> get props => [name, email, subject, message];
}
