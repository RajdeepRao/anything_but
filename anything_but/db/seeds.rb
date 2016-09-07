# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
nyc=City.create(name: "New York City")
dc=City.create(name: "Washington, D.C.")
london=City.create(name: "London")

williamsburg=Neighborhood.create(name:"Williamsburg")
les=Neighborhood.create(name: "Lower East Side")
village=Neighborhood.create(name: "Greenwich Village")

nyc.neighborhoods<<williamsburg
nyc.neighborhoods<<les
nyc.neighborhoods<<village

georgetown=Neighborhood.create(name:"Georgetown")
dupont=Neighborhood.create(name: "Dupont")
pet=Neighborhood.create(name: "Petworth")

dc.neighborhoods<<georgetown
dc.neighborhoods<<dupont
dc.neighborhoods<<pet

islington=Neighborhood.create(name: "Islington")
garden=Neighborhood.create(name: "Covent Garden")
nottinghill=Neighborhood.create(name: "Notting Hill")

london.neighborhoods<<islington
london.neighborhoods<<garden
london.neighborhoods<<nottinghill

nightlife=Activity.create(name: "Nightlife")
entertainment=Activity.create(name:"Live Entertainment")
adventure=Activity.create(name:"Adventure")

## WILLIAMSBURG RECOMMENDATIONS
output=Recommendation.create(name: "Output")
sawdust=Recommendation.create(name: "National Sawdust")
brooklynbowl=Recommendation.create(name: "Brooklyn Bowl")

output.activities<<nightlife
williamsburg.recommendations<<output

sawdust.activities<<entertainment
williamsburg.recommendations<<sawdust

brooklynbowl.activities<<adventure
williamsburg.recommendations<<brooklynbowl
#
##LES RECOMMENDATIONS
dropoff=Recommendation.create(name: "Drop Off Service")
guesthouse=Recommendation.create(name: "Elvis Guesthouse")
lowline=Recommendation.create(name: "The Lowline")

dropoff.activities<<nightlife
les.recommendations<<dropoff

guesthouse.activities<<entertainment
les.recommendations<<guesthouse

lowline.activities<<adventure
les.recommendations<<lowline

##GREENWICH VILLAGE RECOMMENDATIONS

tiger=Recommendation.create(name: "The Blind Tiger")
bitterend=Recommendation.create(name: "The Bitter End")
wsp=Recommendation.create(name: "Washington Square Park")

tiger.activities<<nightlife
village.recommendations<<tiger

bitterend.activities<<entertainment
village.recommendations<<bitterend

wsp.activities<<adventure
village.recommendations<<wsp

##GEORGE TOWN RECOMMENDATIONS
piano=Recommendation.create(name: "Piano Bar")
gypsy=Recommendation.create(name: "Gypsy Sally\'s")
oaks=Recommendation.create(name: "Dumbarton Oaks Gardens")

piano.activities<<nightlife
georgetown.recommendations<<piano

gypsy.activities<<entertainment
georgetown.recommendations<<gypsy

oaks.activities<<adventure
georgetown.recommendations<<oaks

##DUPONT RECOMMENDATIONS
arnolds=Recommendation.create(name: "St. Arnold\'s")
eighteenthstreet=Recommendation.create(name: "Eighteenth Street Lounge")
scientology=Recommendation.create(name: "The L. Ron Hubbard House")

arnolds.activities<<nightlife
dupont.recommendations<<arnolds

eighteenthstreet.activities<<entertainment
dupont.recommendations<<eighteenthstreet

scientology.activities<<adventure
dupont.recommendations<<scientology

##PETWORTH RECOMMENDATIONS
derby=Recommendation.create(name: "Red Derby")
bloom=Recommendation.create(name: "BloomBars")
zoo=Recommendation.create(name: "National Zoological Park")

derby.activities<<nightlife
pet.recommendations<<derby

bloom.activities<<entertainment
pet.recommendations<<bloom

zoo.activities<<adventure
pet.recommendations<<zoo

##ISLINGTON RECOMMENDATIONS
beatone=Recommendation.create(name: "Be At One Islington")
assembly=Recommendation.create(name: "Islington Assembly Hall")
foodcycle=Recommendation.create(name: "FoodCycle")

beatone.activities<<nightlife
islington.recommendations<<beatone

assembly.activities<<entertainment
islington.recommendations<<assembly

foodcycle.activities<<adventure
islington.recommendations<<foodcycle

##COVENT GARDEN RECOMMENDATIONS
cellar=Recommendation.create(name: "Cellar Door")
donmar=Recommendation.create(name: "Donmar Warehouse")
market=Recommendation.create(name: "Jubilee Market")

cellar.activities<<nightlife
garden.recommendations<<cellar

donmar.activities<<entertainment
garden.recommendations<<donmar

market.activities<<adventure
garden.recommendations<<market


##NOTING HILL RECOMMENDATIONS
portobello=Recommendation.create(name: "Portobello Gold")
artsclub=Recommendation.create(name: "Notting Hill Arts Club")
flower=Recommendation.create(name: "Notting Hill Flower Show")

portobello.activities<<nightlife
nottinghill.recommendations<<portobello

artsclub.activities<<entertainment
nottinghill.recommendations<<artsclub

flower.activities<<adventure
nottinghill.recommendations<<flower
