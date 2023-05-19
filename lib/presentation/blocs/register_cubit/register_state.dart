part of 'register_cubit.dart';

class RegisterFormState extends Equatable {

  final FormStatus formStatus;
  final bool isValid;
  // final String userName;
  final UserName userName;
  // final String email;
  final Email email;
  // final String password;
  final Password password;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid, 
    this.isValid = false,
    // this.userName = '', 
    this.userName = const UserName.pure(), 
    // this.email = '', 
    this.email = const Email.pure(), 
    // this.password = '',
    this.password = const Password.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    // String? userName,
    UserName? userName,
    // String? email,
    Email? email,
    // String? password,
    Password? password,
  }) => RegisterFormState(
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    userName: userName ?? this.userName,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  List<Object> get props => [ formStatus, userName, email, password, isValid, ];
}

enum FormStatus { invalid, valid, validating, posting }


