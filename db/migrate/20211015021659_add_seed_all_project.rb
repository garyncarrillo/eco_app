class AddSeedAllProject < ActiveRecord::Migration[6.1]
  def change
    User.create(email: 'admin@eco-app.com', name: 'Admin eco app', password: '123456')

    Category.create(
      name: 'Carton',
      score: 1,
      rate: 51,
      is_active: true
    )

    Category.create(
      name: 'Cobre',
      score: 1,
      rate: 5000,
      is_active: true
    )

    Category.create(
      name: 'Bronce',
      score: 1,
      rate: 2600,
      is_active: true
    )

    Category.create(
      name: 'Aluminio',
      score: 1,
      rate: 760,
      is_active: true
    )

    Category.create(
      name: 'Hierro',
      score: 1,
      rate: 360,
      is_active: true
    )

    Category.create(
      name: 'Acero',
      score: 1,
      rate: 120,
      is_active: true
    )

    Article.create(
      name: 'RESMA OFICIO 75GR',
      stock: 100,
      rate: 15000,
      score: 1,
    )

    Article.create(
      name: 'ARCHIVADOR AZ 1/2 CARTA',
      stock: 100,
      rate: 12750,
      score: 1,
    )

    Article.create(
      name: 'ALCOHOL 700ML',
      stock: 100,
      rate: 7860,
      score: 1,
    )

    Article.create(
      name: 'ALCOHOL 350 ML',
      stock: 100,
      rate: 4875,
      score: 1,
    )

    Article.create(
      name: 'DESINFECTANTE 1800ML',
      stock: 100,
      rate: 8730,
      score: 1,
    )

    Article.create(
      name: 'LIMPIADOR DE SUPERFICIE 500ML',
      stock: 100,
      rate: 20550,
      score: 1,
    )

    Article.create(
      name: 'TOALLA COCINA X 50 UNID',
      stock: 100,
      rate: 6885,
      score: 1,
    )

    Article.create(
      name: 'TOALLA COCINA X 80 UNID',
      stock: 100,
      rate: 9735,
      score: 1,
    )

    Article.create(
      name: 'TOALLA COCINA X 120 UNID',
      stock: 100,
      rate: 14265,
      score: 1,
    )

    Article.create(
      name: 'JABON LIQUIDO 500ML',
      stock: 100,
      rate: 7425,
      score: 1,
    )

    Article.create(
      name: 'DETERGENTE X 2KG',
      stock: 100,
      rate: 13500,
      score: 1,
    )

    Article.create(
      name: 'DETERGENTE 4KG',
      stock: 100,
      rate: 27000,
      score: 1,
    )

    Article.create(
      name: 'DETERGENTE X 5KG',
      stock: 100,
      rate: 27000,
      score: 1,
    )

    Article.create(
      name: 'AMBIENTADOR 400ML',
      stock: 100,
      rate: 18000,
      score: 1,
    )

    Article.create(
      name: 'ARCHIVADOR AZ 1/2 8CM CARTA',
      stock: 100,
      rate: 13650,
      score: 1,
    )

    Article.create(
      name: 'ARCHIVADOR AZ 1/2 8CM CARTA',
      stock: 100,
      rate: 13650,
      score: 1,
    )

    Article.create(
      name: 'LAPIZ NEGRO X 12',
      stock: 100,
      rate: 1500,
      score: 1,
    )

    Article.create(
      name: 'BOLIGRAFO NEGRO X12',
      stock: 100,
      rate: 1800,
      score: 1,
    )

    Article.create(
      name: 'RESMA CARTA 75GR',
      stock: 100,
      rate: 14000,
      score: 1,
    )

  end
end
