import 'package:get_it/get_it.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firestore_services.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;
void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreServices());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    databaseService: getIt<DatabaseService>(),
    firebaseAuthService: getIt<FirebaseAuthService>(),
  ));
}
