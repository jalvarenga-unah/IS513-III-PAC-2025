import 'package:flutter/material.dart';
import 'package:todo_app/src/shared/utils.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simular login - aquí iría tu lógica de autenticación
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        if (context.mounted) {
          Utils.showSnackBar(context: context, title: 'Bienvenido');
        }
      });
    }
  }

  void _handleGoogleSignIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                // Título
                const Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Inicia sesión en tu cuenta',
                  style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                ),
                const SizedBox(height: 32),

                // Campo de correo
                CustomTextField(
                  label: 'Correo electrónico',
                  hint: 'ejemplo@correo.com',
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Campo de contraseña
                CustomTextField(
                  label: 'Contraseña',
                  hint: '••••••••',
                  obscureText: true,
                  controller: _passwordController,
                  prefixIcon: Icons.lock_outlined,
                  suffixIcon: _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  onSuffixIconTap: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
                    }
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Recordar contraseña / Olvidé contraseña
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(
                        color: Color(0xFF2563EB),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Botón de inicio de sesión
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      disabledBackgroundColor: const Color(0xFFD1D5DB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Iniciar sesión',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),

                // Divisor
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: const Color(0xFFE5E7EB),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'O',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: const Color(0xFFE5E7EB),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Botón de Google Sign-In
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: _handleGoogleSignIn,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image(image: AssetImage('assets/google.png')),
                        Image.asset('assets/google.png', width: 25, height: 25),
                        const SizedBox(width: 12),
                        const Text(
                          'Continuar con Google',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Registrarse
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: '¿No tienes cuenta? ',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                      children: [
                        TextSpan(
                          text: 'Regístrate',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2563EB),
                          ),
                          recognizer: null, // Aquí irá tu navegación
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
