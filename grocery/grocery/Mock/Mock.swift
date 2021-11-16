//
//  Mock.swift
//  grocery
//
//  Created by Szymon Gęsicki on 03/08/2021.
//

import Foundation
import SGSwiftExtensions

enum CategoryType {
    case fruits
    case vegetables
    case drinks
    case bakery
}

class Mock {
    static var shared = Mock()
    
    func fetchProducts(type: CategoryType) -> [Product] {
        switch type {
        case .fruits: return fruits
        case .vegetables: return vegetables
        case .drinks: return drinks
        case .bakery: return bakery
        }
    }
    
    func fetchTopProducts() -> [Product] {
        return [
            fruits[(0..<fruits.count).randomElement() ?? 0],
            vegetables[(0..<vegetables.count).randomElement() ?? 0],
            drinks[(0..<drinks.count).randomElement() ?? 0],
            bakery[(0..<bakery.count).randomElement() ?? 0]
        ]
    }
    
    func fetchCategories() -> [Category] {
        return [
            Category(image: "fruits", backgroundColor: UIColor(hex: 0xA9B2A9), title: "Fruits", type: .fruits),
            Category(image: "vegetables", backgroundColor: UIColor(hex: 0xE9FFD2), title: "Vegetables", type: .vegetables),
            Category(image: "drinks", backgroundColor: UIColor(hex: 0x8CAF35), title: "Drinks", type: .drinks),
            Category(image: "bakery", backgroundColor: UIColor(hex: 0xD6FFDA), title: "Bakery", type: .bakery)
        ]
    }
    
    private let vegetables = [
        Product(image: "tomato", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Tomato", cost: 1.5,
                text: "Tomatoes are a significant source of umami flavor. The tomato is consumed in diverse ways, raw or cooked, in many dishes, sauces, salads, and drinks. While tomatoes are fruits—botanically classified as berries—they are commonly used as a vegetable ingredient or side dish."),
        Product(image: "pumpkin", backgroundColor: UIColor(hex: 0xFFF48F), titleColor: UIColor(hex: 0xFFF7AC), title: "Pumpkin", cost: 1.5,
                text: "A pumpkin is a cultivar of winter squash that is round with smooth, slightly ribbed skin, and is most often deep yellow to orange in coloration. The thick shell contains the seeds and pulp. The name is most commonly used for cultivars of Cucurbita pepo, but some cultivars of Cucurbita maxima, C. argyrosperma, and C. moschata with similar appearance are also sometimes called \"pumpkin\"."),
        Product(image: "broccoli", backgroundColor: UIColor(hex: 0xBCFEBF), titleColor: UIColor(hex: 0xCCFFCE), title: "Broccoli", cost: 1.5,
                text: "Broccoli (Brassica oleracea var. italica) is an edible green plant in the cabbage family (family Brassicaceae, genus Brassica) whose large flowering head, stalk and small associated leaves are eaten as a vegetable. Broccoli is classified in the Italica cultivar group of the species Brassica oleracea. Broccoli has large flower heads, usually dark green, arranged in a tree-like structure branching out from a thick stalk which is usually light green. The mass of flower heads is surrounded by leaves."),
        Product(image: "beetroot", backgroundColor: UIColor(hex: 0xFBD8E0), titleColor: UIColor(hex: 0xFFEBEF), title: "Beetroot", cost: 1.5,
                text: "The beetroot is the taproot portion of a beet plant, usually known in Canada and the United States as beets while the vegetable is referred to as beetroot in British English, and also known as the table beet, garden beet, red beet, dinner beet or golden beet."),
        Product(image: "cauliflower", backgroundColor: UIColor(hex: 0xEBF8EE), titleColor: UIColor(hex: 0xFBFEFB), title: "Cauliflower", cost: 1.5,
                text: "Cauliflower is one of several vegetables in the species Brassica oleracea in the genus Brassica, which is in the Brassicaceae (or Mustard) family. It is an annual plant that reproduces by seed. Typically, only the head is eaten – the edible white flesh sometimes called \"curd\" (with a similar appearance to cheese curd). The cauliflower head is composed of a white inflorescence meristem."),
        Product(image: "eggplant", backgroundColor: UIColor(hex: 0xEEE0F8), titleColor: UIColor(hex: 0xF6EEFC), title: "Eggplant", cost: 1.5,
                text: "Eggplant (US, Australia, New Zealand, anglophone Canada), aubergine (UK, Ireland, Quebec, and most of mainland Western Europe) or brinjal (South Asia, Singapore, Malaysia, South Africa) is a plant species in the nightshade family Solanaceae. Solanum melongena is grown worldwide for its edible fruit.")
    ]
    
    private let fruits = [
        Product(image: "watermelon", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Watermelon", cost: 1.5,
                text: "Watermelon (Citrullus lanatus) is a flowering plant species of the Cucurbitaceae family and the name of its edible fruit. A scrambling and trailing vine-like plant, it was originally domesticated in Africa. It is a highly cultivated fruit worldwide, with more than 1,000 varieties."),
        Product(image: "pineapple", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Pineapple", cost: 1.5,
                text: "The pineapple (Ananas comosus) is a tropical plant with an edible fruit and the most economically significant plant in the family Bromeliaceae. The pineapple is indigenous to South America, where it has been cultivated for many centuries. The introduction of the pineapple to Europe in the 17th century made it a significant cultural icon of luxury. Since the 1820s, pineapple has been commercially grown in greenhouses and many tropical plantations."),
        Product(image: "pear", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Pear", cost: 1.5,
                text: "Pears are fruits produced and consumed around the world, growing on a tree and harvested in the Northern Hemisphere in late summer into October. The pear tree and shrub are a species of genus Pyrus /ˈpaɪrəs/, in the family Rosaceae, bearing the pomaceous fruit of the same name. Several species of pears are valued for their edible fruit and juices, while others are cultivated as trees."),
        Product(image: "orange", backgroundColor: UIColor(hex: 0xFFF48F), titleColor: UIColor(hex: 0xFFF7AC), title: "Orange", cost: 1.5,
                text: "The orange is the fruit of various citrus species in the family Rutaceae (see list of plants known as orange); it primarily refers to Citrus × sinensis, which is also called sweet orange, to distinguish it from the related Citrus × aurantium, referred to as bitter orange. The sweet orange reproduces asexually (apomixis through nucellar embryony); varieties of sweet orange arise through mutations."),
        Product(image: "grenade", backgroundColor: UIColor(hex: 0xBCFEBF), titleColor: UIColor(hex: 0xCCFFCE), title: "Grenade", cost: 1.5,
                text: "A grenade is an explosive weapon typically thrown by hand (also called by the retronym hand grenade), but can also refer to a shell (explosive projectile) shot out by a rifle (as a rifle grenade) or a grenade launcher. The user pulls the safety pin before throwing, and once thrown the safety lever gets released, allowing the striker to trigger a primer that ignites a fuze (sometimes called the delay element), which burns down to the detonator and explodes the main charge."),
        Product(image: "banana", backgroundColor: UIColor(hex: 0xEBF8EE), titleColor: UIColor(hex: 0xFBFEFB), title: "Banana", cost: 1.5,
                text: "A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa. In some countries, bananas used for cooking may be called \"plantains\", distinguishing them from dessert bananas. The fruit is variable in size, color, and firmness, but is usually elongated and curved, with soft flesh rich in starch covered with a rind, which may be green, yellow, red, purple, or brown when ripe. The fruits grow in clusters hanging from the top of the plant."),
        Product(image: "apple", backgroundColor: UIColor(hex: 0xEEE0F8), titleColor: UIColor(hex: 0xF6EEFC), title: "Apple", cost: 1.5,
                text: "An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today. Apples have been grown for thousands of years in Asia and Europe and were brought to North America by European colonists. Apples have religious and mythological significance in many cultures, including Norse, Greek, and European Christian tradition.")
    ]
    
    private let drinks = [
        Product(image: "coffee", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Coffe", cost: 1.5,
                text: "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. From the coffee fruit, the seeds are separated to produce a stable, raw product: unroasted green coffee. The seeds are then roasted, a process which transforms them into a consumable product: roasted coffee, which is ground into a powder and typically steeped in hot water before being filtered out, producing a cup of coffee."),
        Product(image: "cola", backgroundColor: UIColor(hex: 0xFFF48F), titleColor: UIColor(hex: 0xFFF7AC), title: "Cola", cost: 1.5,
                text: "Cola is a carbonated soft drink flavored with vanilla, cinnamon, citrus oils and other flavorings. Cola became popular worldwide after pharmacist John Pemberton invented Coca-Cola, a trademarked brand, in 1886—which was later imitated by other manufacturers. Most colas contain caffeine, which was originally sourced from the kola nut, leading to the drink's name, though other sources are now also used. The original cola drink by Pemberton contained caffeine from coca leaves as well."),
        Product(image: "drink", backgroundColor: UIColor(hex: 0xBCFEBF), titleColor: UIColor(hex: 0xCCFFCE), title: "Drink", cost: 1.5,
                text: "A drink (or beverage) is a liquid intended for human consumption. In addition to their basic function of satisfying thirst, drinks play important roles in human culture. Common types of drinks include plain drinking water, milk, juice and soft drinks. Traditionally warm beverages include coffee, tea, and hot chocolate. Caffeinated drinks that contain the stimulant caffeine have a long history."),
        Product(image: "orange_juice", backgroundColor: UIColor(hex: 0xFBD8E0), titleColor: UIColor(hex: 0xFFEBEF), title: "Orange juice", cost: 1.5,
                text: "Orange juice is a liquid extract of the orange tree fruit, produced by squeezing or reaming oranges. It comes in several different varieties, including blood orange, navel oranges, valencia orange, clementine, and tangerine. How juicy these vesicles are depend upon many factors, such as species, variety, and season."),
        Product(image: "tea", backgroundColor: UIColor(hex: 0xEBF8EE), titleColor: UIColor(hex: 0xFBFEFB), title: "Tea", cost: 1.5,
                text: "Tea is an aromatic beverage prepared by pouring hot or boiling water over cured or fresh leaves of Camellia sinensis, an evergreen shrub native to China and East Asia. After water, it is the most widely consumed drink in the world. There are many different types of tea; some, like Chinese greens and Darjeeling, have a cooling, slightly bitter, and astringent flavour, while others have vastly different profiles that include sweet, nutty, floral, or grassy notes."),
        Product(image: "water", backgroundColor: UIColor(hex: 0xEEE0F8), titleColor: UIColor(hex: 0xF6EEFC), title: "Water", cost: 1.5,
                text: "Water is an inorganic, transparent, tasteless, odorless, and nearly colorless chemical substance, which is the main constituent of Earth's hydrosphere and the fluids of all known living organisms. It is vital for all known forms of life, even though it provides no calories or organic nutrients.")
    ]
    
    private let bakery = [
        Product(image: "bread", backgroundColor: UIColor(hex: 0xFDA397), titleColor: UIColor(hex: 0xFB9082), title: "Bread", cost: 1.5,
                text: "Bread is a staple food prepared from a dough of flour and water, usually by baking. Throughout recorded history, it has been a prominent food in large parts of the world. It is one of the oldest human-made foods, having been of significant importance since the dawn of agriculture, and plays an essential role in both religious rituals and secular culture."),
        Product(image: "cake", backgroundColor: UIColor(hex: 0xFFF48F), titleColor: UIColor(hex: 0xFFF7AC), title: "Cake", cost: 1.5,
                text: "Cake is a form of sweet food made from flour, sugar, and other ingredients, that is usually baked. In their oldest forms, cakes were modifications of bread, but cakes now cover a wide range of preparations that can be simple or elaborate, and that share features with other desserts such as pastries, meringues, custards, and pies."),
        Product(image: "cookie", backgroundColor: UIColor(hex: 0xBCFEBF), titleColor: UIColor(hex: 0xCCFFCE), title: "Cookie", cost: 1.5,
                text: "A cookie is a baked or cooked snack or dessert that is typically small, flat and sweet. It usually contains flour, sugar, egg, and some type of oil, fat, or butter. It may include other ingredients such as raisins, oats, chocolate chips, nuts, etc."),
        Product(image: "croissant", backgroundColor: UIColor(hex: 0xFBD8E0), titleColor: UIColor(hex: 0xFFEBEF), title: "Croissant", cost: 1.5,
                text: "A croissant is a buttery, flaky, viennoiserie pastry of Austrian origin, but mostly associated with France. Croissants are named for their historical crescent shape and, like other viennoiserie, are made of a layered yeast-leavened dough. The dough is layered with butter, rolled and folded several times in succession, then rolled into a thin sheet, in a technique called laminating. The process results in a layered, flaky texture, similar to a puff pastry."),
        Product(image: "cupcake", backgroundColor: UIColor(hex: 0xEBF8EE), titleColor: UIColor(hex: 0xFBFEFB), title: "Cupcake", cost: 1.5,
                text: "A cupcake (also British English: fairy cake; Hiberno-English: bun; Australian English: fairy cake or patty cake) is a small cake designed to serve one person, which may be baked in a small thin paper or aluminum cup. As with larger cakes, frosting and other cake decorations such as fruit and candy may be applied."),
        Product(image: "donut", backgroundColor: UIColor(hex: 0xEEE0F8), titleColor: UIColor(hex: 0xF6EEFC), title: "Donut", cost: 1.5,
                text: "A doughnut or donut is a type of leavened fried dough. It is popular in many countries and is prepared in various forms as a sweet snack that can be homemade or purchased in bakeries, supermarkets, food stalls, and franchised specialty vendors. 'Doughnut' is the traditional spelling, whilst 'donut' is the simplified version.")
    ]
}
