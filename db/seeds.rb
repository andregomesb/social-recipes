# Admins
master = User.create(name: 'Master',
                     email: 'master@admin.com',
                     password: 'foobar',
                     password_confirmation: 'foobar',
                     city: 'Sao Paulo - SP',
                     admin: true)

chef = User.create(name: 'Chef',
                   email: 'chef@admin.com',
                   password: 'foobar',
                   password_confirmation: 'foobar',
                   city: 'Rio de Janeiro - RJ',
                   # facebook: '',
                   # twitter: '',
                   admin: true)

# Users
bob = User.create(name: 'Bob',
                  email: 'bob@example.com',
                  password: 'foobar',
                  password_confirmation: 'foobar',
                  city: 'New York City - NY',
                  facebook: 'BobsBurgers',
                  twitter: 'bobsburgersfox')

john = User.create(name: 'John Doe',
                   email: 'john@example.com',
                   password: 'foobar',
                   password_confirmation: 'foobar',
                   city: 'Recife - PE')

# Cuisines
brazilian = Cuisine.create(name: 'Brasileira')
portuguese = Cuisine.create(name: 'Portuguesa')
Cuisine.create(name: 'Italiana')
Cuisine.create(name: 'Francesa')

# Meals
main_dish = Meal.create(name: 'Prato Principal')
dessert = Meal.create(name: 'Sobremesa')
breakfast = Meal.create(name: 'Café da manhã')
Meal.create(name: 'Sopa')

# Recipes
recipe1 = bob.recipes
             .create(name: 'Macarrão com cogumelo e sálvia',
                     cuisine_id: portuguese.id,
                     meal_id: main_dish.id,
                     portion: 2,
                     preparation_time: 40,
                     difficulty: 'easy',
                     ingredients: "pacote de espaguete integral, 1/2 \r\n
                         cogumelo fresco fatiado, 230g\r\n
                         sálvia fresca picada, 1~2 colheres de sopa\r\n
                         dente de alho picado, 2\r\n
                         Azeite extravirgem, a gosto\r\n
                         Sal, a gosto\r\n",
                     instructions:
"Cozinhe o macarrão em água como de costume. Escorra e reserve.\r\n
Enquanto isso, aqueça uma quantidade generosa de azeite numa frigideira e \
refogue o alho com a sálvia até o alho dourar ligeiramente.\r\n
Adicione o cogumelo, sal e refogue até o cogumelo soltar água e dourar.\r\n
Misture o macarrão escorrido com o cogumelo até ficar bem revestido com o \
azeite, acrescentando mais, se quiser. Tempere com sal a gosto e \
sirva quente.\r\n")

recipe2 = john.recipes
              .create(name: 'Tagine de frango com pera caramelizada',
                      cuisine_id: brazilian.id,
                      meal_id: main_dish.id,
                      portion: 6,
                      preparation_time: 75,
                      difficulty: 'medium',
                      ingredients: "cebolas, 2\r\n
                        azeite de oliva, 7 colheres (sopa)\r\n
                        frango cortado em pedaços, 1\r\n
                        açafrão, 1 colher (chá)\r\n
                        cominho em pó, 1 colher (chá)\r\n
                        coentro em pó, 1 colher (chá)\r\n
                        sal, 1 colher (chá)\r\n
                        paus de canela, 2-3\r\n
                        folhas de louro esmagadas, 2\r\n
                        maço de coentro picado, 1\r\n
                        gengibre picado, 2 colheres (sopa)\r\n
                        xícara de água, 1/2\r\n
                        manteiga, 30g\r\n
                        peras fatiadas, 2\r\n
                        mel, 2 colheres (sopa)\r\n",
                      instructions:
"Preaqueça o forno em temperatura média (180˚C).\r\n
Descasque e fatie as cebolas e refogue por 2 minutos com 2 colheres (sopa) de \
azeite, até ficarem macias. Transfira-as para o fundo de uma panela de tagine \
e coloque os pedaços de frango por cima.\r\n
Misture o açafrão, o cominho, o coentro em pó e o sal numa tigela e junte o \
restante do azeite. Misture bem e pincele sobre o frango.\r\n
Em seguida, coloque a canela e polvilhe o louro esmagado, o coentro fresco \
picado e o gengibre sobre o frango. Despeje a água por cima, tampe e leve ao \
forno por 50 minutos.\r\n
Derreta a manteiga em uma panela e junte a pera e o mel. Cozinhe por 5 minutos \
ou até caramelizar bem a pera.\r\n
Retire o frango do forno, misture a pera e volte ao forno por mais 10 minutos \
  antes de servir.\r\n")

recipe3 = bob.recipes
             .create(name: 'Pudim de laranja',
                     cuisine_id: brazilian.id,
                     meal_id: dessert.id,
                     portion: 8,
                     preparation_time: 300,
                     difficulty: 'hard',
                     ingredients: "açúcar, 1 xícara\r\n
                         leite integral, 1 xícara\r\n
                         leite condensado, 1 lata\r\n
                         ovos, 3\r\n
                         gemas de ovo, 3\r\n
                         suco de laranja, 4 colheres (sopa)\r\n
                         raspas de laranja, 1 colher (sopa)\r\n
                         baunilha, 1 colher (sopa)\r\n
                         maisena, 1 colher (sopa)\r\n
                         creme de leite fresco, 1 xícara\r\n",
                     instructions:
"Derreta o açúcar numa panela em fogo médio, mexendo sempre, até virar \
caramelo (cerca de 10 minutos), com cuidado para não queimar. Unte uma forma \
de pudim com esse caramelo e deixe esfriar.\r\n
Preaqueça o forno em temperatura média (180ºC).\r\n
Bata todos os ingredientes (menos o creme de leite) no liquidificador até \
ficar homogêneo. Coloque então o creme de leite e pulse algumas vezes até \
incorporar. Despeje o creme na forma.\r\n
Coloque uma toalha úmida no fundo de uma assadeira grande, coloque a forma \
de pudim sobre ela e encha a assadeira com água fervente até bater na metade \
da forma de pudim.\r\n
Leve o pudim ao forno em banho-maria por cerca de 45-60 minutos, ou até \
firmar. Retire, deixe esfriar na forma e depois leve à geladeira por \
4 horas.\r\n
Para desenformar, passe uma faca em torno do pudim na forma e vire num \
prato grande.\r\n")

john.recipes
    .create(name: 'Tortilha',
            cuisine_id: portuguese.id,
            meal_id: breakfast.id,
            portion: 2,
            preparation_time: 35,
            difficulty: 'easy',
            ingredients: "ovos, 4\r\n
                         leite, 1/4 xícara\r\n
                         Sal e pimenta, a gosto\r\n
                         água, 1/4 xícara\r\n
                         azeite de oliva, 1 colher (sopa)\r\n
                         alho picado, 2 dentes\r\n
                         batatas médias cortadas em fatias finas, 2\r\n
                         cubo de caldo de legumes, 1\r\n
                         abobrinha média fatiada, 1\r\n
                         Grãos de espiga de milho, 1 espiga\r\n
                         pimentão verde, 1\r\n
                         queijo cheddar ralado, 125g\r\n",
            instructions:
"Em uma tigela, bata os ovos com o leite, o sal e a pimenta. Reserve.\r\n
Aqueça o azeite em uma frigideira, de tamanho médio e de fundo pesado, em fogo \
médio. \r\n
Frite o alho e as fatias de batata até ficarem douradas, por cerca de 2 \
minutos. \r\n
Acrescente a água e o cubo de caldo de legumes. Com a frigideira destampada, \
cozinhe por 10 minutos. Boa parte da água deverá ter evaporado, mas ainda \
haverá um pouco.\r\n
Despeje a mistura de ovo. Por cima, arrume as fatias de abobrinha e de \
pimentão, além dos grãos de milho. \r\n
Polvilhe com queijo ralado. Em seguida, reduza o fogo para médio-baixo e tampe \
a frigideira. Cozinhe por 10-15 minutos.\r\n
De vez em quando, verifique se apareceram bolhas grandes na tortilha \
e desmanche-as com uma faca. Passe também uma faca cega nas bordas. \r\n
Mexa a frigideira sobre a chama para se certificar de que a fritada ficará \
homogênea.\r\n
Quando a parte de cima da tortilha estiver toda sólida, coloque a frigideira \
no forno preaquecido por alguns minutos para terminar o preparo.\r\n
Deixe-o descansar por alguns minutos. Em seguida, sirva-o em pedaços.\r\n")

# Favorites
master.favorites << recipe1
master.favorites << recipe2
master.favorites << recipe3

chef.favorites << recipe2
chef.favorites << recipe3

bob.favorites << recipe1
bob.favorites << recipe2

john.favorites << recipe2
