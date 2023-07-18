import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../utils/constants.dart';
import '../Repository of the Goals List.dart';
import 'goal1page.dart';


class goalSettingPage extends StatefulWidget {
  const goalSettingPage({Key? key, required String title}) : super(key: key);

  @override
  State<goalSettingPage> createState() => _goalSettingPageState();
}

const hedefAlani=['goal1page','spor','diğer', ];

class _goalSettingPageState extends State<goalSettingPage> {
  String? nereye;
  String? HedefeDogru = '';


TextEditingController hedefTanimla= TextEditingController();
final formKey = GlobalKey<FormState>();

TextEditingController zamanTanimi= TextEditingController();
TextEditingController EkNot= TextEditingController();


  String? zamanTanimla = '';


  String? Eknotlar='';

  static String? get newValue => newValue;

@override
  void dispose() {
  hedefTanimla.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kSecondaryColor),
      body: SingleChildScrollView(
        child: Center(
          child:Form(
            key: formKey,
            child:  Column(
              children: [
                DropdownButton<String>(
                    value: nereye,
                    items: hedefAlani.map(
                            (e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,)
                    ).toList(),
                    onChanged: (value){
                      setState(() {
                        nereye= value;
                      });
                    }),
                Text(nereye ?? "Hangi Tür Hedef Olduğunu Seçin"),
                Text('Boş olamaz'),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0),
                        ),
                      ),
                      labelText: 'Hedef başlığını giriniz',
                      hintText: 'Hedefleriniz başlığını bu alana giriniz',
                      icon: IconButton(
                          onPressed: (){
                            icon: IconButton(
                              onPressed: (){

                              }, icon: Icon(Icons.add_circle),
                            );

                          },
                          icon: Icon(Icons.add_chart,))
                  ),
                  controller: hedefTanimla,
                  onChanged: (value){
                    HedefeDogru=hedefTanimla.text;
                    setState(() {

                    });
                  },
                  onSaved: (newValue){

                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (value){
                              return repositoryOfTheList(hedefTanimla);
                            })

                    );
                  },
                ),
                TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:  BorderRadius.all(Radius.circular(20.0),),
                      ),
                      labelText: 'Bir zaman aralığı giriniz',
                      hintText: 'Lütfen bir zaman aralığı giriniz',
                      icon: IconButton(onPressed: (){}, icon: Icon(Icons.access_alarm))
                    ),
                    controller: zamanTanimi,
                    onChanged: (value){
                      zamanTanimla= zamanTanimi.text;
                      setState(() {



                      });
                    }
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0),),
                    ),
                    labelText: 'Eklenen notlar',
                    hintText: 'Eklemek istediğiniz herhangi birşey var mı?',
                  ),
                  controller: EkNot,
                  onChanged: (value){
                    Eknotlar= EkNot.text;
                    setState(() {


                    });
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      formKey.currentState?.save();
                    },
                    child: Text('Kaydet')),
                Text(HedefeDogru!),
                Text(nereye.toString()),
                Text(zamanTanimla!),
                Text(Eknotlar!),

              ],

          ),

        ),
        ),
      ),
    );
  }
}
class Goal extends StatelessWidget {
  const Goal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
