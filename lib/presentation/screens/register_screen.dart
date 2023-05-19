import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final userName = registerCubit.state.userName;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;


    return Form(
      // key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de Usuario',
            // onChange: (value) {
            //   registerCubit.userNameChange(value);
            //   _formKey.currentState?.validate();
            // },
            onChange: registerCubit.userNameChange,
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Campo requerido';
            //   if (value.trim().isEmpty) return 'Campo requerido';
            //   if (value.length < 6) return 'Mas de 6 letras';

            //   return null;
            // },

            //Mensaje de error con objeto UserName
            errorMessage: userName.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Correo electronico',
            // onChange: (value) {
            //   registerCubit.emailChange(value);
            //   _formKey.currentState?.validate();
            // },
            onChange: registerCubit.emailChange,
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Campo requerido';
            //   if (value.trim().isEmpty) return 'Campo requerido';

            //   final emailRegExp = RegExp(
            //     r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            //   );
            //   if (!emailRegExp.hasMatch(value)) {
            //     return 'No tiene formato de correo';
            //   }

            //   return null;
            // },
            errorMessage: email.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            // onChange: (value) {
            //   registerCubit.passwordChange(value);
            //   _formKey.currentState?.validate();
            // },
            onChange: registerCubit.passwordChange,
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Campo requerido';
            //   if (value.trim().isEmpty) return 'Campo requerido';
            //   if (value.length < 6) return 'Mas de 6 letras';

            //   return null;
            // },
            errorMessage: password.errorMessage,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            onPressed: () {
              // final isValid = _formKey.currentState!.validate();
              // if (!isValid) return;

              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuarios'),
          ),
        ],
      ),
    );
  }
}
