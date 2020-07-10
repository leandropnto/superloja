import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:superloja/domain/cart/cart_failures.dart';
import 'package:superloja/domain/cart/cart_item.dart';
import 'package:superloja/domain/cart/cart_product.dart';
import 'package:superloja/domain/cart/i_cart_repository.dart';
import 'package:superloja/infrastructure/cart/cart_item_dto.dart';
import 'package:superloja/infrastructure/core/firebase_helpers.dart';

@Singleton(as: ICartRepository)
class FirebaseCartRepository implements ICartRepository {
  final Firestore _firestore;

  FirebaseCartRepository(this._firestore);

  @override
  Stream<Either<CartFailures, List<CartItem>>> watchCart() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.collection("cart").snapshots().map(
          (snapshot) => right(
            snapshot.documents
                .map((doc) => CartItemDto.fromFirestore(doc).toDomain())
                .toList(),
          ),
        );
  }

  @override
  Future<Option<Either<CartFailures, Unit>>> addToCart(CartProduct item) async {
    final userDoc = await _firestore.userDocument();
    try {
      final items = await userDoc.collection("cart").getDocuments();
      final founded = items.documents
          .firstWhere((element) => item.isStackabel(element.data));
      var quantity = founded.data['quantity'] as int;
      await founded.reference.updateData({'quantity': ++quantity});

      return some(right(unit));
      // ignore: avoid_catching_errors
    } on StateError {
      await userDoc.collection("cart").add(CartItemDto(
            productId: item.product.id.getOrCrash(),
            sizeName: item.size.sizeName.getOrCrash(),
            quantity: item.quantity,
          ).toJson());
      return some(right(unit));
    } catch (e) {
      return some(left(const CartFailures.createError()));
    }
  }

  @override
  Future<Option<Either<CartFailures, Unit>>> removeToCart(
      CartProduct item) async {
    final userDoc = await _firestore.userDocument();
    try {
      final cartReference =
          userDoc.collection("cart").document(item.id.getOrCrash());
      final quantity =  item.quantity - 1;
      if (quantity <= 0) {
        await cartReference.delete();
      } else {
        cartReference.updateData({"quantity": quantity});
      }
      return some(right(unit));
    } catch (e) {
      return some(left(const CartFailures.createError()));
    }
  }
}
