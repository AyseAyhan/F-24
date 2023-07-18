import 'package:achievoapp/utils/constants.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true; // Bildirimlerin açık/kapalı durumunu tutan değişken

  void openNotificationsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationsPage()),
    );
  }

  void openChangePasswordPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChangePasswordPage()),
    );
  }

  void openProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  void openAboutPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kSecondaryColor,
        title: Text('Ayarlar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Genel Ayarlar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Bildirimler'),
              trailing: Switch(
                value: notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  notificationsEnabled = !notificationsEnabled;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Dil Seçimi (Yakında!)'),
              onTap: () {
                // Yakında eklenecek
              },
            ),
            Divider(),
            Text(
              'Hesap Ayarları',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil Fotoğrafı Değiştir'),
              onTap: () {
                Navigator.of(context).push<String>(
                      MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage();
                          }
                      )
                  );
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Şifre Değiştir'),
              onTap: () {
                openChangePasswordPage(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Hakkımızda'),
              onTap: () {
                openAboutPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bildirimler'),
      ),
      body: Center(
        child: Text('Bildirimler Sayfası'),
      ),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifre Değiştir'),
      ),
      body: Center(
        child: Text('Şifre Değiştirme Sayfası'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: Text('Profil Sayfası'),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hakkımızda'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Takım İsmi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'F 24',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Ürün ile İlgili Bilgiler',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Takım Elemanları',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Ayşe Ayhan: Scrum Master/Developer'),
            Text('Hanife Cennet Alkan: Product Owner/Developer'),
            Text('Yusuf Alçı: Developer'),
            Text('Okan Patır: Developer'),
            Text('İrem Nur Pirinççi: Developer'),
            SizedBox(height: 16.0),
            Text(
              'Ürün İsmi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Achievo'),
          ],
        ),
      ),
    );
  }
}