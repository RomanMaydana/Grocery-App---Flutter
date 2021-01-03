class GroceryProduct {
  const GroceryProduct(
      {this.price, this.name, this.description, this.image, this.weight});
  final double price;
  final String name;
  final String description;
  final String image;
  final String weight;
}

const groceryProducts = <GroceryProduct>[
  GroceryProduct(
      price: 8.30,
      name: 'Ciruela',
      description:
          'La fruta es el fruto comestible obtenido de ciertas plantas cultivadas o silvestres. Suele ser ingerida como postre (es decir, al final de la comida), ya sea fresca o cocinada.',
      image: 'assets/fruits/ciruela.png',
      weight: '300g'),
  GroceryProduct(
      price: 11.30,
      name: 'Durazno',
      description:
          'La fruta es el fruto comestible obtenido de ciertas plantas cultivadas o silvestres. Suele ser ingerida como postre (es decir, al final de la comida), ya sea fresca o cocinada.',
      image: 'assets/fruits/durazno.png',
      weight: '200g'),
  GroceryProduct(
      price: 6.00,
      name: 'Mango',
      description:
          'La fruta es el fruto comestible obtenido de ciertas plantas cultivadas o silvestres. Suele ser ingerida como postre (es decir, al final de la comida), ya sea fresca o cocinada.',
      image: 'assets/fruits/mango.png',
      weight: '150g'),
  GroceryProduct(
      price: 8.00,
      name: 'Manzana',
      description:
          'La fruta es el fruto comestible obtenido de ciertas plantas cultivadas o silvestres. Suele ser ingerida como postre (es decir, al final de la comida), ya sea fresca o cocinada.',
      image: 'assets/fruits/manzana.png',
      weight: '220g'),
  GroceryProduct(
      price: 5.30,
      name: 'Pera',
      description:
          'La fruta es el fruto comestible obtenido de ciertas plantas cultivadas o silvestres. Suele ser ingerida como postre (es decir, al final de la comida), ya sea fresca o cocinada.',
      image: 'assets/fruits/pera.png',
      weight: '100g'),
  GroceryProduct(
      price: 20.30,
      name: 'Piña',
      description:
          'La fruta es el fruto comestible obtenido de ciertas plantas cultivadas o silvestres. Suele ser ingerida como postre (es decir, al final de la comida), ya sea fresca o cocinada.',
      image: 'assets/fruits/pina.png',
      weight: '500g'),
  GroceryProduct(
      price: 12.30,
      name: 'Plátano',
      description:
          'La fruta es el fruto comestible obtenido de ciertas plantas cultivadas o silvestres. Suele ser ingerida como postre (es decir, al final de la comida), ya sea fresca o cocinada.',
      image: 'assets/fruits/platano.png',
      weight: '200g'),
  GroceryProduct(
      price: 30.30,
      name: 'Sandía',
      description:
          'La fruta es el fruto comestible obtenido de ciertas plantas cultivadas o silvestres. Suele ser ingerida como postre (es decir, al final de la comida), ya sea fresca o cocinada.',
      image: 'assets/fruits/sandia.png',
      weight: '500g'),
  GroceryProduct(
      price: 11.30,
      name: 'Uva',
      description:
          'La fruta es el fruto comestible obtenido de ciertas plantas cultivadas o silvestres. Suele ser ingerida como postre (es decir, al final de la comida), ya sea fresca o cocinada.',
      image: 'assets/fruits/uva.png',
      weight: '100g'),
];
