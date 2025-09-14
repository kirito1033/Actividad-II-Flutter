import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../main.dart'; // 👈 Importa donde está MyApp.themeNotifier

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 28),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: trailing ??
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const CustomAppBar(title: 'Configuración', showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Cuenta"),
            _buildOptionTile(
              icon: Icons.email,
              title: "Cambiar Email",
              subtitle: "Actualiza tu dirección de correo electrónico",
              onTap: () {},
            ),
            _buildOptionTile(
              icon: Icons.lock,
              title: "Cambiar Contraseña",
              subtitle: "Establece una nueva contraseña segura",
              onTap: () {},
            ),
            const SizedBox(height: 20),
            _buildSectionTitle("Apariencia"),
            ValueListenableBuilder<ThemeMode>(
              valueListenable: MyApp.themeNotifier,
              builder: (context, mode, _) {
                return _buildOptionTile(
                  icon: Icons.color_lens,
                  title: "Tema de la App",
                  subtitle: mode == ThemeMode.dark
                      ? "Usando modo oscuro"
                      : "Usando modo claro",
                  trailing: Switch(
                    value: mode == ThemeMode.dark,
                    onChanged: (value) {
                      MyApp.themeNotifier.value =
                          value ? ThemeMode.dark : ThemeMode.light;
                    },
                  ),
                );
              },
            ),

            _buildOptionTile(
              icon: Icons.language,
              title: "Idioma",
              subtitle: "Selecciona el idioma de la aplicación",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
