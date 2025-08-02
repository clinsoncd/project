// blocs/chat_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/messagemodels.dart';

// Events
abstract class ChatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendMessage extends ChatEvent {
  final String message;

  SendMessage(this.message);

  @override
  List<Object?> get props => [message];
}

// States
class ChatState extends Equatable {
  final List<Message> messages;

  ChatState(this.messages);

  @override
  List<Object?> get props => [messages];
}

// Bloc
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState([])) {
    on<SendMessage>((event, emit) {
      final updatedMessages = List<Message>.from(state.messages)
        ..add(Message(text: event.message, isMe: true));
      emit(ChatState(updatedMessages));
    });
  }
}
