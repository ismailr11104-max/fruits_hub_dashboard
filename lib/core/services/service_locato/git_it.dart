import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/repo/add_product_repo/add_product_repo.dart';
import 'package:fruits_hub_dashboard/core/repo/add_product_repo/add_product_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repo/image_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/repo/image_repo/image_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/services/network/fire_store_service.dart';
import 'package:fruits_hub_dashboard/core/services/network/fire_store_service_impl.dart';
import 'package:fruits_hub_dashboard/core/services/network/storage_services.dart';
import 'package:fruits_hub_dashboard/core/services/network/supabase_storage_Impl.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/date_sourse/add_product_data_source.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/date_sourse/add_product_data_source_impl.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/date_sourse/upload_image_data_source.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/date_sourse/upload_image_data_source_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Firebase
  sl.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  sl.registerLazySingleton<StorageServices>(
    () => SupabaseStorageImpl(Supabase.instance.client.storage),
  );

  // Firestore
  sl.registerLazySingleton<FireStoreService>(
    () => FireStoreServiceImpl(FirebaseFirestore.instance),
  );

  // Storage
  // sl.registerLazySingleton<StorageServices>(
  //   () => FireStorageImpl(sl<FirebaseStorage>()),
  // );

  // Image
  sl.registerLazySingleton<UploadImageDataSource>(
    () => UploadImageDataSourceImpl(sl<StorageServices>()),
  );

  sl.registerLazySingleton<ImageRepo>(
    () => ImageRepoImpl(sl<UploadImageDataSource>()),
  );

  // Add Product DataSource
  sl.registerLazySingleton<AddProductDataSource>(
    () => AddProductDataSourceImpl(sl<FireStoreService>()),
  );

  // Add Product Repository
  sl.registerLazySingleton<AddProductRepo>(
    () => AddProductRepoImpl(sl<AddProductDataSource>()),
  );
}
