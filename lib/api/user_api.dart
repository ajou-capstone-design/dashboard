import 'package:dashboard/model/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

part 'user_api.g.dart';

@riverpod
Future<List<User>> getAllUser(Ref ref) async {
  final users = await Supabase.instance.client.from('user').select();
  return [...users.map(User.fromJson)];
}

@riverpod
Future<User> getUserInfo(Ref ref, int id) async {
  final user = await Supabase.instance.client.from('user').select().eq('id', id).single();
  return User.fromJson(user);
}

@riverpod
Stream<List<Emg>> getEmgStream(Ref ref, int id) => Supabase.instance.client
    .from('emg_value')
    .stream(primaryKey: ['id'])
    .eq('user_id', id)
    .order('created_at', ascending: true)
    .map((x) => [...x.map(Emg.fromJson)]);
