import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/blocs.dart';
import '/repositories/repositories.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;

  ContactBloc(this.contactRepository) : super(ContactInitial()) {
    on<SubmitContactForm>((event, emit) async {
      emit(ContactSubmitting());
      try {
        final confirmationMessage = await contactRepository.submitContactForm(
          name: event.name,
          email: event.email,
          subject: event.subject,
          message: event.message,
        );
        emit(ContactSubmitted(confirmationMessage));
      } catch (e) {
        emit(ContactError("Failed to submit form: ${e.toString()}"));
      }
    });
  }
}
