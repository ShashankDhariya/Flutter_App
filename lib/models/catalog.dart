class Item{
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image); 
}

final products = [Item(
  "Shashank001", 
  "MacBookPro",
  "Apple MacBook Pro with M1 chip",
  151999,
  "Space Grey", 
  "https://s.yimg.com/os/creatr-uploaded-images/2020-12/d37e0460-3eeb-11eb-b7f9-449e864b9135",
)];