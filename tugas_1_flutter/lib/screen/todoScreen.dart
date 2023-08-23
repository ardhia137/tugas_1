import 'package:flutter/material.dart';
import 'package:tugas_1_client/tugas_1_client.dart';
import 'package:tugas_1_flutter/main.dart';
import 'package:tugas_1_flutter/screen/detailTodoScreen.dart';
import 'package:tugas_1_flutter/utils/theme.dart';
import 'package:tugas_1_flutter/widget/cardWidget.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo>? _todos;
  Exception? _connectionException;

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    try {
      final todos = await client.todo.readSpec("TODO");
      setState(() {
        _todos = todos;
      });
    } catch (e) {
      _connectionFailed(e);
    }
  }

  void _connectionFailed(dynamic exception) {
    // If the connection to the server fails, we clear the list of notes and
    // store the exception that was thrown. This will make the loading screen
    // appear and show a button to try again.

    // In a real app you would probably want to do more complete error handling.
    setState(() {
      _todos = null;
      _connectionException = exception;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              // final todo = Todo(
              //     kategori: "TODO",
              //     judul: "TODO TITLE",
              //     keterangan: "TODO SUB TITLE");
              // await client.todo.create(todo);
              // setState(() {
              //   _loadTodos();
              // });
              Navigator.pushNamed(context, '/add');
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 50,
            ),
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0))),
          ),
        ),
      ),
      body: Container(
        // margin: EdgeInsets.all(0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.1,
            0.8,
            // 0.6,
            // 0.9,
          ],
          colors: [
            bgColor1,
            bgColor1,
          ],
        )),
        child: _todos == null
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : ListView.builder(
                itemCount: _todos!.length,
                itemBuilder: (BuildContext context, int index) {
                  print(_todos![index].id.runtimeType);
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailTodoScreen(
                                  todo: _todos![index],
                                ))),
                    child: CardWidget(
                      todo: _todos![index],
                      onPressed: () async {
                        print("object");
                        await client.todo
                            .updateTodo(_todos![index].id!.toInt(), "DONE");
                        setState(() {
                          _loadTodos();
                        });
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
