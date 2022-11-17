class CatalogModels{
  static final items = [
    Item(
      1, 
      "Macbook Pro",
      "Apple MacBook Pro with M1 chip",
      999,
      "Space Grey", 
      "https://rukminim1.flixcart.com/image/832/832/khdqnbk0/computer/f/y/t/apple-original-imafxfyqydgvrkzv.jpeg?q=70",
    )];
}

class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image); 
}