import 'package:app_architecture/repositorys/product_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final entriesProvider = FutureProvider((ref) {
  final entryRepository = ref.watch(productRepProvider);
  return entryRepository.allEntries();
});
final homeControllerProvider = Provider.autoDispose<HomeController>((ref) {
  final productRepo = ref.watch(productRepProvider);
  return HomeController(ref: ref, productRepository: productRepo);
});

class HomeController {
  final ProviderRef ref;
  final ProductRepository productRepository;

  HomeController({required this.ref, required this.productRepository}) {
    print('home controller colled');
  }

  addEntry(String entry) {
    productRepository.addEntry(entry);
    ref.refresh(entriesProvider);
  }

  removeEntry(String entry) {
    productRepository.removeEntry(entry);
    ref.refresh(entriesProvider);
  }
}
