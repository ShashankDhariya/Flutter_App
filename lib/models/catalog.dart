import 'dart:convert';

class CatalogModel{
  static List<Item> items = [
    Item(
      id: 1, 
      name: "Macbook Pro",
      desc: "Apple MacBook Pro with M1 chip",
      price: 999,
      rooms: 100, 
      image: "https://rukminim1.flixcart.com/image/832/832/khdqnbk0/computer/f/y/t/apple-original-imafxfyqydgvrkzv.jpeg?q=70",
    )];

    Item getByID(int id) => 
      items.firstWhere((element) => element.id == id, orElse: null);
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final num rooms;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.rooms,
    required this.image,
  });

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    num? rooms,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      rooms : rooms ?? this.rooms,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'rooms': rooms,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      rooms: map['rooms'] as num,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, rooms: $rooms, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.price == price &&
      other.rooms == rooms &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      rooms.hashCode ^
      image.hashCode;
  }
}
