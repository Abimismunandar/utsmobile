import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root app with Material theme and initial LoginPage
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// Halaman Login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _onLogin() {
    final userInput = _userController.text.trim();
    final name = userInput.isEmpty
        ? 'Andi'
        : (userInput.contains('@')
            ? userInput.split('@').first
            : userInput);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => DashboardPage(
          userName: name,
          email: userInput.isEmpty ? 'andi@example.com' : userInput,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FlutterLogo(size: 96), // gambar/logo dummy
                const SizedBox(height: 16),
                const Text(
                  'Selamat Datang',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Aplikasi demo UTS dengan tiga halaman: Login, Dashboard, dan Profil.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    labelText: 'Email / Username',
                    prefixIcon: Icon(Icons.person), // icon di textfield
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock), // icon di textfield
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _onLogin,
                    icon: const Icon(Icons.login),
                    label: const Text('Login'),
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

// Halaman Dashboard
class DashboardPage extends StatelessWidget {
  final String userName;
  final String email;

  const DashboardPage({
    super.key,
    required this.userName,
    required this.email,
  });

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi UTS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => _showSnack(context, 'Tidak ada notifikasi baru'),
            tooltip: 'Notifikasi',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // gambar/banner di atas
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 140,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: const Center(child: FlutterLogo(size: 80)),
                ),
              ),
              const SizedBox(height: 16),
              // header berisi text nama user
              Text(
                'Halo, $userName',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              // Menu dalam bentuk Grid minimal 3 item
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _MenuItem(
                    icon: Icons.person,
                    label: 'Profil',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProfilePage(
                            name: userName,
                            nim: '12345678',
                            email: email,
                            prodi: 'Informatika',
                            semester: '5',
                          ),
                        ),
                      );
                    },
                  ),
                  _MenuItem(
                    icon: Icons.list,
                    label: 'Data',
                    onTap: () => _showSnack(context, 'Menu Data diklik'),
                  ),
                  _MenuItem(
                    icon: Icons.settings,
                    label: 'Pengaturan',
                    onTap: () =>
                        _showSnack(context, 'Menu Pengaturan diklik'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Item menu (Icon + Text)
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceVariant,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32),
              const SizedBox(height: 8),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman Profil
class ProfilePage extends StatelessWidget {
  final String name;
  final String nim;
  final String email;
  final String prodi;
  final String semester;

  const ProfilePage({
    super.key,
    required this.name,
    required this.nim,
    required this.email,
    required this.prodi,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            // Foto / avatar dummy
            const CircleAvatar(
              radius: 45,
              child: FlutterLogo(size: 50),
            ),
            const SizedBox(height: 12),
            // Text nama, NIM/ID, email (Column)
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('NIM / ID: $nim'),
            Text('Email: $email'),
            const SizedBox(height: 12),
            // Row kecil info lain (Prodi – Semester)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Prodi: $prodi'),
                const SizedBox(width: 12),
                const Text('–'),
                const SizedBox(width: 12),
                Text('Semester: $semester'),
              ],
            ),
            const SizedBox(height: 20),
            // Tombol kembali ke Dashboard
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali ke Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
