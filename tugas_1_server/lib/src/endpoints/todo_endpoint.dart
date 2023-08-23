import 'package:serverpod/serverpod.dart';
import '../generated/todo_class.dart';

class TodoEndpoint extends Endpoint {
  Future<Todo> create(Session session, Todo todo) async {
    await Todo.insert(session, todo);
    return todo;
  }

  Future<Todo?> read(Session session, int id) async {
    return await Todo.findById(session, id);
  }

  Future<List<Todo>> readSpec(Session session,String kategori) async {
    return await Todo.find(session, where: (t) => t.kategori.equals(kategori));
  }

  Future<List<Todo>> readAll(Session session) async {
    return await Todo.find(session);
  }

  Future<Todo> update(Session session, Todo todo) async {
    await Todo.update(session, todo);
    return todo;
  }

  Future<Todo> updateTodo(Session session, int id, String kategori) async {
    var mytodos = await Todo.findById(session, id);
    mytodos!.kategori = kategori;
    await session.db.update(mytodos);
    return mytodos;
  }

  Future<void> delete(Session session, int id) async {
    await Todo.delete(session, where: (todo) => todo.id.equals(id));
  }
}
