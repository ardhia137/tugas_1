/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/todo_endpoint.dart' as _i3;
import 'package:tugas_1_server/src/generated/todo_class.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'todo': _i3.TodoEndpoint()
        ..initialize(
          server,
          'todo',
          null,
        ),
    };
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['todo'] = _i1.EndpointConnector(
      name: 'todo',
      endpoint: endpoints['todo']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'todo': _i1.ParameterDescription(
              name: 'todo',
              type: _i1.getType<_i4.Todo>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['todo'] as _i3.TodoEndpoint).create(
            session,
            params['todo'],
          ),
        ),
        'read': _i1.MethodConnector(
          name: 'read',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['todo'] as _i3.TodoEndpoint).read(
            session,
            params['id'],
          ),
        ),
        'readSpec': _i1.MethodConnector(
          name: 'readSpec',
          params: {
            'kategori': _i1.ParameterDescription(
              name: 'kategori',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['todo'] as _i3.TodoEndpoint).readSpec(
            session,
            params['kategori'],
          ),
        ),
        'readAll': _i1.MethodConnector(
          name: 'readAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['todo'] as _i3.TodoEndpoint).readAll(session),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'todo': _i1.ParameterDescription(
              name: 'todo',
              type: _i1.getType<_i4.Todo>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['todo'] as _i3.TodoEndpoint).update(
            session,
            params['todo'],
          ),
        ),
        'updateTodo': _i1.MethodConnector(
          name: 'updateTodo',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'kategori': _i1.ParameterDescription(
              name: 'kategori',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['todo'] as _i3.TodoEndpoint).updateTodo(
            session,
            params['id'],
            params['kategori'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['todo'] as _i3.TodoEndpoint).delete(
            session,
            params['id'],
          ),
        ),
      },
    );
  }
}
