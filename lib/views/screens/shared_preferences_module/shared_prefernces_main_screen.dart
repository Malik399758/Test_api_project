import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_apis_project/views/screens/shared_preferences_module/cart_shared_preferences_screen.dart';

class SharedPreferncesMainScreen extends StatefulWidget {
  const SharedPreferncesMainScreen({super.key});

  @override
  State<SharedPreferncesMainScreen> createState() => _SharedPreferncesMainScreenState();
}

class _SharedPreferncesMainScreenState extends State<SharedPreferncesMainScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  List<String> list = [];

  List<String> savedList = [];

  // save data in shared preferences
  void saveData()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('all_names', list);
  }

  void getData()async{
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedList = prefs.getStringList('all_names');
    if(savedList != null){
      setState(() {
        list = savedList;
      });
    }
  }

  void addToCart(String name){
    if(!savedList.contains(name)){
      setState(() {
        savedList.add(name);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Screen'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) =>
              CartSharedPreferencesScreen(list: savedList)));
            },
                icon: Icon(CupertinoIcons.cart)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Column(
          children: [
            TextFormField(
              controller: firstName,
              decoration: InputDecoration(
                hintText: 'Enter first name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: lastName,
              decoration: InputDecoration(
                  hintText: 'Enter last name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  )
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                final fullName = '${firstName.text} ${lastName.text}';
                setState(() {
                  list.add(fullName);
                });
                saveData();
                firstName.clear();
                lastName.clear();
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.orange
                ),
                child: Center(child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),)),
              ),
            ),
            SizedBox(height: 20,),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        addToCart(list[index]);
                      },
                      child: ListTile(
                        title: Text(list[index]),
                        trailing: IconButton(onPressed: (){
                          setState(() {
                            list.removeAt(index);
                          });
                        },
                            icon: Icon(Icons.delete_forever)),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
