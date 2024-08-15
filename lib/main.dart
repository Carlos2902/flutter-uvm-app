import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() => runApp(MaterialApp(
debugShowCheckedModeBanner: false,
theme: ThemeData(
brightness: Brightness.dark,
primaryColor: Colors.greenAccent,
// accentColor: Colors.greenAccent,
),
home: MyApp(),
));


class MyApp extends StatefulWidget {
const MyApp({super.key});

@override
State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

String? employeeID, employeeName, employeeEmail, employeePassword;

getEmployeeId(id){
this.employeeID = id;
}
getEmployeeName(name){
this.employeeName = name;
}
getEmployeeEmail(email){
this.employeeEmail = email;
}
getEmployeePassword(password){
this.employeePassword = password;
}

createData(){
print("created");
DocumentReference documentReference = FirebaseFirestore.instance.collection("Employees").doc(employeeName);


Map<String, dynamic> employeeMap = {
"employeeID": employeeID,
"employeeName": employeeName,
"employeeEmail": employeeEmail,
"employeePassword": employeePassword
};

documentReference.set(employeeMap).then((_) {
print("$employeeName created");
});
}



readData(){
print("read");
}
updateData(){
print("updated");
}
deleteData(){
print("deleted");
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text("rCycle Login"),
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
children: <Widget>[
Padding(
padding: EdgeInsets.only(bottom:8.0),
child: TextFormField(
decoration: InputDecoration(
labelText: "Employee ID",
fillColor: Colors.white,
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.blue,
width: 2.0))),
onChanged: (String id){
getEmployeeId(id);
},
),
),
Padding(
padding: EdgeInsets.only(bottom:8.0),
child: TextFormField(
decoration: InputDecoration(
labelText: "Name",
fillColor: Colors.white,
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.blue,
width: 2.0))),
onChanged: (String name){
getEmployeeName(name);
},
),
),
Padding(
padding: EdgeInsets.only(bottom:8.0),
child: TextFormField(
decoration: InputDecoration(
labelText: "Email",
fillColor: Colors.white,
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.blue,
width: 2.0))),
onChanged: (String email){
getEmployeeEmail(email);
},

),
),
Padding(
padding: EdgeInsets.only(bottom:8.0),
child: TextFormField(
decoration: InputDecoration(
labelText: "Password",
fillColor: Colors.white,
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.blue,
width: 2.0))),
onChanged: (String password){
getEmployeePassword(password);
},
),
),



Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: <Widget>[
ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.green,
foregroundColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
),
),
child: Text("Create"),
onPressed: () {
createData();
},
),
ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.blue,
foregroundColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
),
),
child: Text("Read"),
onPressed: () {
readData(); // Replace with your actual arguments
},
),
ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.orange,
foregroundColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
),
),
child: Text("Update"),
onPressed: () {
updateData();
},
),
ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.red,
foregroundColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
),
),
child: Text("Delete"),
onPressed: () {
deleteData();
},
),
],
)



],
),
),
);
}
}