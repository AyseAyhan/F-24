import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class SportScreen extends StatefulWidget {
  @override
  _SportScreenState createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {
  Map<String, List<Hedef>> hedefler = {
    'Günlük': [],
    'Haftalık': [],
    'Aylık': [],
  };

  String aktifSurec = 'Günlük';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text('Spor Hedefleri'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildSurecler(),
            SizedBox(height: 10),
            _buildPlanlar(hedefler[aktifSurec]!),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _hedefEkleDialogGoster();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildSurecler() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                aktifSurec = 'Günlük';
              });
            },
            style: ElevatedButton.styleFrom(
              primary: aktifSurec == 'Günlük' ? Colors.blue : Colors.grey,
            ),
            child: Text('Günlük'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                aktifSurec = 'Haftalık';
              });
            },
            style: ElevatedButton.styleFrom(
              primary: aktifSurec == 'Haftalık' ? Colors.blue : Colors.grey,
            ),
            child: Text('Haftalık'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                aktifSurec = 'Aylık';
              });
            },
            style: ElevatedButton.styleFrom(
              primary: aktifSurec == 'Aylık' ? Colors.blue : Colors.grey,
            ),
            child: Text('Aylık'),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanlar(List<Hedef> hedefler) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            aktifSurec + ' Planlar',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          hedefler.isEmpty
              ? Text('Plan bulunmamaktadır.')
              : Column(
            children: hedefler.map((hedef) {
              return ListTile(
                title: Text(hedef.baslik),
                trailing: Checkbox(
                  value: hedef.tamamlandi,
                  onChanged: (value) {
                    setState(() {
                      hedef.tamamlandi = value!;
                    });
                    if (hedef.tamamlandi) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Tebrikler!'),
                            content: Text('Hedef tamamlandı.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Kapat'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              );
            }).toList(),
          ),
          Divider(),
        ],
      ),
    );
  }

  void _hedefEkleDialogGoster() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String yeniHedef = '';

        return AlertDialog(
          title: Text('Yeni Hedef Ekle'),
          content: TextField(
            onChanged: (value) {
              yeniHedef = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  hedefler[aktifSurec]!.add(Hedef(
                    baslik: yeniHedef,
                    tamamlandi: false,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('Ekle'),
            ),
          ],
        );
      },
    );
  }
}

class Hedef {
  String baslik;
  bool tamamlandi;

  Hedef({
    required this.baslik,
    required this.tamamlandi,
  });
}