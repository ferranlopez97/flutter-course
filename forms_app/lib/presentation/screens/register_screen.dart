import 'dart:math';

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
        title: Text("Nuevo usuario"),
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "Nombre de usuario",
            onChange: (p0) {
              registerCubit.usernameChanged(p0);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return "Campo requerido";
              if (value.trim().isEmpty) return "Campo requerido";
              if (value.trim().length < 6) return "Mínimo 6 letras";
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: "Correo electrónico",
            onChange: (p0) {
              registerCubit.emailChanged(p0);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return "Campo requerido";
              if (value.trim().isEmpty) return "Campo requerido";
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if (!emailRegExp.hasMatch(value)) return 'No tiene formato de correo';
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: "Contraseña",
            obscure: true,
            onChange: (p0) {
              registerCubit.passwordChanged(p0);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return "Campo requerido";
              if (value.trim().isEmpty) return "Campo requerido";
              if (value.trim().length < 6) return "Mínimo 6 letras";
              return null;
            },
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;

              registerCubit.onSubmit();
            },
            icon: Icon(Icons.save),
            label: Text("Crear usuario"),
          ),
        ],
      ),
    );
  }
}
