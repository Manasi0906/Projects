
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "todoui.dart";

void main(){
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build (BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BottomSheet",
      home: TodoAppUI(),
    );
  }
}

class TodoAppUI extends StatefulWidget{
  const TodoAppUI({super.key});
  @override  
  State createState() => _TodoAppUI();
}

class _TodoAppUI extends State{
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<TodoModel> todoCards = [
    TodoModel(title: "Flutter", description: "Dart, OOP", date: "17 October, 2024"),
    TodoModel(title: "Java", description: "Exception, OOP", date: "18 October, 2024"),
    TodoModel(title: "Python", description: "Generators, OOP", date: "19 October, 2024"),
  ];

  List<Color?> colorList = [
    const Color.fromARGB(255, 242, 210, 221),
    const Color.fromARGB(255, 179, 216, 246),
    const Color.fromARGB(255, 246, 241, 200),
    const Color.fromARGB(255, 226, 187, 240),
  ];

  void submit(bool doEdit, [TodoModel? todoObj]){
    if(titleController.text.trim().isNotEmpty && descriptionController.text.trim().isNotEmpty && dateController.text.trim().isNotEmpty){
      if(doEdit){
        todoObj!.title = titleController.text;
        todoObj.description = descriptionController.text;
        todoObj.date = dateController.text;
      }else{
        todoCards.add(
          TodoModel(title: titleController.text, description: descriptionController.text, date: dateController.text),
        );
      }
    }
    Navigator.of(context).pop();
    clearControllers();
    setState(() {});
  }

  void clearControllers(){
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  void showBottomSheet(bool doEdit, [TodoModel? todoObj]){
    showModalBottomSheet(
      context: context, 
      builder: (context){
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 12,
              right: 12,
              left: 12
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Todo",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
          
                // Title
          
                const Text("Title",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 139, 148, 1.0),
                ),
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
          
                //Description
          
                 const Text("Description",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 139, 148, 1.0),
                ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
          
                //date
          
                 const Text("Date",
                 style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 139, 148, 1.0),
                ),
                ),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1.0),
                      ),
                    ),
                    suffixIcon: const Icon(Icons.calendar_month_outlined),
                  ),
                  onTap: () async{
                    DateTime? pickedDate = await showDatePicker(
                      context: context, 
                      firstDate: DateTime(2024), 
                      lastDate: DateTime(2025),
                      );
                      String formattedDate = DateFormat.yMMMd().format(pickedDate!);
                      setState(() {
                        dateController.text = formattedDate;
                      });
                  },
                ),
                const SizedBox(height: 20,),
          
                //Submit
                Center(
                  child: ElevatedButton(
                    onPressed:(){
                      if(doEdit==true){
                        submit(true, todoObj);
                      }else{
                        submit(false);
                      }
                    } ,
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
          
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        );
      });
  }

  @override  
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: const Text("To-Do List",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
          ),
          backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        ),
        body: ListView.builder(
          itemCount: todoCards.length,
          itemBuilder: (BuildContext context, int index){
            return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: colorList[ index % colorList.length],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          
                          const SizedBox(width: 20,),

                          //Content

                          Expanded(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10,),
                                Text(" Title: ${todoCards[index].title}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                                ),
                                ),
                                const SizedBox(height: 10,),
                                Text("Discription:${todoCards[index].description}")
                              ],
                            ) 
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text("Date: ${todoCards[index].date}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromRGBO(132, 132, 132, 1 )
                            ),
                            ),
                            const Spacer(),

                            GestureDetector(
                              onTap: () {
                                titleController.text = todoCards[index].title;
                                descriptionController.text = todoCards[index].description;
                                dateController.text= todoCards[index].date;
                                showBottomSheet(
                                  true,
                                  todoCards[index],
                                );
                                setState((){ });

                              },
                              child: const Icon(Icons.edit,color: Color.fromRGBO(0, 139, 148, 1),
                              ),
                            ),
                            const SizedBox(width: 10,),

                            //delete
                            GestureDetector(
                              onTap: () {
                                todoCards.remove(todoCards[index]);
                                setState(() {});
                              },
                              child: const Icon(Icons.delete_outline_outlined,color: Color.fromRGBO(0, 139, 148, 1),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ), 
              );
          }),
          floatingActionButton: FloatingActionButton(onPressed: (){
            showBottomSheet(false);
          },
          backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
          ),

      );
  }
}