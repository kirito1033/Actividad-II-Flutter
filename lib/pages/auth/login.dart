// lib/pages/auth/login.dart (modificado)
import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../home/home.dart';
import '../user/form.dart';
import '../../utils/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _registeredUsername;
  String? _registeredPassword;
  // ignore: unused_field
  String? _registeredConfirmPassword;

  String? _enteredUsername;
  String? _enteredPassword;
  bool _datosMostrados = false;

  @override
  void initState() {
    super.initState();
    _usernameController.text = _registeredUsername ?? '';
    _passwordController.text = _registeredPassword ?? '';
  }

  void _navigateToRegister() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserFormScreen()),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        _registeredUsername = result['username'];
        _registeredPassword = result['password'];
        _registeredConfirmPassword = result['confirmPassword'];
        _usernameController.text = _registeredUsername ?? '';
        _passwordController.text = _registeredPassword ?? '';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Usuario registrado:\n"
            "Usuario: ${result['username']}\n"
            "Email: ${result['email']}\n"
            "Contraseña: ${result['password']}\n"
            "Confirmar: ${result['confirmPassword']}",
          ),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;

      if (!_datosMostrados) {
        // Primer clic → mostrar datos
        print("Usuario: $username");
        print("Contraseña: $password");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Usuario: $username\nContraseña: $password"),
            duration: const Duration(seconds: 3),
          ),
        );

        setState(() {
          _enteredUsername = username;
          _enteredPassword = password;
          _datosMostrados = true; // Cambia el estado
        });
      } else {
        // Segundo clic → redirigir
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              username: _enteredUsername ?? '',
              password: _enteredPassword ?? '',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Iniciar Sesión'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/logos/stamp.webp',
                height: 250,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: Validators.email,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: Validators.password,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Ingresar'),
              ),
              if (_enteredUsername != null && _enteredPassword != null) ...[
                const SizedBox(height: 20),
                Text("Usuario ingresado: $_enteredUsername"),
                Text("Contraseña ingresada: $_enteredPassword"),
              ],
              const SizedBox(height: 20),
              TextButton(
                onPressed: _navigateToRegister,
                child: const Text('¿No tienes cuenta? Regístrate aquí'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
