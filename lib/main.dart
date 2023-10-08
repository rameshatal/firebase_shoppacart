import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'note_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseFirestore db;
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    db = FirebaseFirestore.instance;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: StreamBuilder(
        stream: db.collection("Notes").snapshots(),
        builder: (_,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Center(child: Text("${snapshot.hasError.toString()}"),);
          }else if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_,index){
                  var model = NoteModel.fromJson(snapshot.data!.docs[index].data());
                  return InkWell(
                    onTap: (){

                    },
                    child: ListTile(
                      title: Text("${model.title}"),
                      subtitle: Text("${model.body}"),
                      trailing: InkWell(
                          onTap: (){
                            ///delete


                          },
                          child: Icon(Icons.delete)),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
/*
          db.collection("Students").add({
            "name": "Ramesh",
            "class":"X",
            "rollno":"23"
          }).then((value){
            print(value.id);
          });*/

          showModalBottomSheet(
              context: context,
              builder: (_) {
                return Container(
                  height: MediaQuery.of(context).viewInsets.bottom==0.0 ? 400 : 800,
                  color: Colors.blue.shade100,
                  child: Column(
                    children: [
                      Text("Add Note"),
                      TextField(
                        controller: titleController,
                        onTap: (){

                        },
                        decoration: InputDecoration(
                            hintText: "Enter title here",
                            label: Text("Title"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                            )),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      TextField(
                        controller: bodyController,
                        decoration: InputDecoration(
                          hintText: "Enter desc here",
                          label: Text("Body"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            db
                                .collection("Notes")
                                .doc("3OqGPrdHsCRliXFFFVod")
                                .collection("subNotes")
                                .add(NoteModel(
                                title: titleController.text.toString(),
                                body: bodyController.text.toString())
                                .toJson())
                                .then((value) {
                              print(value.id);
                            });
                          },
                          child: Text("Submit"))
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
// FutureBuilder(
// future: db.collection('Notes').get(),
// builder: (_, snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return Center(
// child: CircularProgressIndicator(),
// );
// } else if (snapshot.hasError) {
// } else if (snapshot.hasData) {
// return ListView.builder(
// itemCount: snapshot.data!.docs.length,
// itemBuilder: (_, index) {
// var model =
// NoteModel.fromJson(snapshot.data!.docs[index].data());
// return ListTile(
// title: Text("${model.title}"),
// subtitle: Text("${model.body}"),
// );
// });
// }
// return Container();
// },
// )
