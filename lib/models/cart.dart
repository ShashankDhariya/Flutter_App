import 'package:first_app/models/catalog.dart';

class CartModel{

    static final cartModel = CartModel._internal();

    CartModel._internal();

    factory CartModel() => cartModel;

//  Catalog Field
    CatalogModel _catalog = CatalogModel();

//  Ids
    final List<int> _itemIds = [];

//  Get catalog
    CatalogModel get catalog => _catalog;

//  Get items in the cart
    set catalog(CatalogModel newCatalog){
      assert(newCatalog != null);
      _catalog = newCatalog;
    }

    List<Item> get items => _itemIds.map((id) => _catalog.getByID(id)).toList();

//  Get Total 
    num get tatalPrice => 
      items.fold(0, (total, current) => total + current.price);

//  Add items
    void add(Item item){
      _itemIds.add(item.id);
    }

    void remove(Item item){
      _itemIds.remove(item.id);
    }
}