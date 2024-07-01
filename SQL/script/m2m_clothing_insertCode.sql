use m2m_clothing
go
-- INSERT INTO Account (username, email, hashed_password, is_admin)
-- VALUES ('m2mClothing', 'kaisamaslain@gmail.com', '$2a$12$en5ZfBVuv44iqK6IktThDOUw3QYoKnbPpRymLs1o1Duc.cy4G7Hy.', 1);
INSERT INTO Account (username, email, hashed_password, is_admin)
VALUES ('khoa', 'vakhoa4875@gmail.com', '$2a$12$en5ZfBVuv44iqK6IktThDOUw3QYoKnbPpRymLs1o1Duc.cy4G7Hy.', 1);
INSERT INTO Account (username, email, hashed_password, is_admin)
VALUES ('phat.teacher', 'hieuphung2211@gmail.com', '$2a$12$en5ZfBVuv44iqK6IktThDOUw3QYoKnbPpRymLs1o1Duc.cy4G7Hy.', 1);
INSERT INTO Account (username, email, hashed_password, is_admin)
VALUES ('ho.phat', 'hophat321@gmail.com', '$2a$12$qTSuT5h7Y3tsXQ/YO63iEecCyKmu.Bgg0K6Lr.lktxdAwxc8MhJE6', 1);
INSERT INTO Account (username, email, hashed_password, is_admin)
VALUES ('m2mClothing.official', 'phatnhps29018@fpt.edu.vn', '$2a$12$qTSuT5h7Y3tsXQ/YO63iEecCyKmu.Bgg0K6Lr.lktxdAwxc8MhJE6', 0);
go

INSERT INTO Category (category_name, logo, description)
VALUES ('Outerwear', 'outerwear_logo.avif', 'Jackets, coats and vests'),
       ('Tops', 'tops_logo.jpg', 'T-shirts, blouses, sweatshirts'),
       ('Bottoms', 'bottoms_logo.png', 'Trousers, jeans, shorts, skirts'),
       ('Jewels & Accessories', 'Jewels_logo.webp', 'Jewelry, handbags, belts'),
       ('Headwear', 'headwear_logo.webp', 'Hats, caps, beanies'),
       ('Footwear', 'footwear_logo.jpg', 'Shoes, boots, sandals');
go
SET IDENTITY_INSERT Product ON;
INSERT INTO product (product_id, product_name, price, quantity, description, average_rate, rate_count, sold, pictures,
                     videos, slug_url, category_id)
values (1, 'Hanes mens Ecosmart Hoodie', 16, 1083012, '"FLEECE TO FEEL GOOD ABOUT - Hanes EcoSmart men-s hoodie is made with cotton sourced from American farms.
HOODED DESIGN - Classic hoodie styling featuring a dyed-to-match drawstring for the perfect fit.
KANGAROO POCKET - Front kangaroo pocket keeps hands warm and holds small, everyday essentials.
COMFY COZY - Midweight fleece keeps you warm without the bulk.
HANES QUALITY - Sporty ribbed cuffs and hem hold its shape.
MADE TO LAST - Double-needle stitching at the neck and armholes for added sturdiness."', 4.5, 180502, 361004,
        '1-1.jpg,1-2.jpg,1-3.jpg', '1.mp4', 'hanes-mens-ecosmart-hoodie', 1),

       (2, 'Fruit of the Loom Eversoft Fleece Hoodies', 35, 353118, '"Male Model is 6’0” wearing a Size Medium.
Female Model is 5’9” wearing size Small
Eversoft fabric provides premium softness was after wash Double-needle stitching on the neck and hems for durability
Ribbed cuffs and waistband that hold their shape Shoulder-to-shoulder neck tape for comfort and durability"', 4.6,
        58853, 117706, '2-1.jpg,2-2.jpg,2-3.jpg', '2.mp4', 'fruit-of-the-loom-eversoft-fleece-hoodies', 1),

       (3, 'Gildan Fleece Hoodie Sweatshirt', 18, 724074,
        'preshrunk 50% cotton/50% dryblend polyester moisture-wicking fabric air-jet yarn for softer feel and no pilling double-lined hood with matching drawstring double-needle stitching',
        4.7, 120679, 241358, '3-1.jpg,3-2.jpg,3-3.jpg', '3.mp4', 'gildan-fleece-hoodie-sweatshirt', 1),

       (4, 'Columbia Men-s Glennaker Rain Jacket', 65, 1278, '"WATERPROOF TECHNOLOGY: You’ll love our Columbia Men-s Glennaker Lake Rain Jacket, it features our Hydroplus waterproof nylon fabric for the ultimate in lightweight, wet weather, protection and comfort.
COMPACT AND PACKABLE: A versatile waterproof jacket with an attached hood to ensure complete rain coverage, while its packable design lets you stow it away into its own chest pocket. Perfect for when the last drizzle subsides.
HANDY FEATURES: Featuring a convenient stow-away hood, zippered hand pockets, adjustable sleeve cuffs, and a drawcord adjustable hem locks in the dry and keeps out the wet.
VERSATILE FIT: This rain jacket features a timeless, versatile fit, that-s perfect functional rainy-day wear.
BUILT TO LAST: Columbia’s attention to detail is what sets our apparel apart. Specifying only the highest quality materials, expert stitching and craftsmanship. This is a long-lasting jacket you will enjoy for seasons to come. Sleeve : Start at the center back of your neck and measure across the shoulder and down to the wrist. Round up to the next even number."',
        4.6, 213, 426, '4-1.jpg,4-2.jpg,4-3.jpg', NULL, 'columbia-mens-glennaker-rain-jacket', 1),

       (5, 'Champion Men-s Jacket', 66, 35244, '"THE FIT - This unisex jacket has a standard fit that-s perfect for layering.
THE FEEL - Made from a 2.8 oz. lightweight fabric blend with a slick, wind and water-resistant coating that shields you from the elements.
THE LOOK - Half-zip jacket with a bungee cord scuba-style hood, elastic cuffs, front pocket, and an open bottom hem with a bungee cord that protects against the elements. All over prints brings a stylish edge.
PACKABLE - This rain jacket can be packed up into the front pocket and easily stowed away.
SPOT THE C - This raincoat features the iconic C logo at the wrist. Note: C logo patch color may vary from image."',
        4.6, 5874, 11748, '5-1.jpg,5-2.jpg,5-3.jpg', '5.mp4', 'champion-mens-jacket', 1),

       (6, 'Columbia Men-s Flashback Windbreaker', 50, 6384, '"COMFORTABLE WINDBREAKER: The Columbia Men’s Flashback Windbreaker is a water resistant shell, designed to shield you and keep you warm on cool blustery days.
WATER RESISTANT SHELL: Created from our matte face wind-breaking material, the 100% polyester plain weave shell, is water repellent and can handle most elements while keeping you warm.
VERSATILE USE: This jacket is an excellent outer layer to help take the edge off cool mornings – even better for wind-chilled days – this windbreaker is an everyday staple for those in between seasons.
FULL HOOD: Designed to protect your head and trap the warmth, the hood on this coat is the perfect element when the wind chill outside becomes a nuisance.
BUILT TO LAST: Columbia’s attention to detail is what sets our apparel apart. Specifying only the highest quality materials, expert stitching and craftsmanship. This is a long-lasting jacket you will enjoy for seasons to come."',
        4.4, 1064, 2128, '6-1.jpg,6-2.jpg,6-3.jpg', NULL, 'columbia-mens-flashback-windbreaker', 1),

       (7, 'Charles River Apparel Pack-n-go Windbreaker Pullover Hooded Jacket', 37, 11316, '"Packable Style- Our lightweight windbreaker folds into its own front pouch pocket with zipper closure for easy packing on the go. An essential for backpacking, exercise, or casual use
Lightweight Pullover Windbreaker - Made with 100% Softex Polyester, our breathable fabric features underarm grommets for added ventilation and protects against rain and wind
Running Rain Gear Features - Unisex Anorak-style half-zip has a durable design with a large front pocket, reinforced hood with adjustable shockcord drawstring, elasticized cuffs, and an adjustable shockcord hem
Travel Essential – This jacket is compact for your luggage or backpack and is a perfect choice for traveling and vacations any time of the year. Machine washable material; available in a large variety of sizes and colors
For 40 years and three generations, we have been guided by our roots. Inspired by the change of seasons, and the abundance of natural beauty around us, Charles River Apparel creates timeless styles that weather the elements as well as the trends"',
        4.6, 1886, 3772, '7-1.jpg,7-2.jpg,7-3.jpg', '7.mp4',
        'charles-river-apparel-pack-n-go-windbreaker-pullover-hooded-jacket', 1),

       (8, 'Tommy Hilfiger Women-s Casual Band Jacket', 109, 2328, '"Classic Tommy Hilfiger style: If you’re into blazer jackets for women perfect for fall no need to look further; with brass-style buttons and band style fashion detailing, this jacket is a fashion statement must-have for any wardrobe
Designer detailing: This jacket features a tailored fit, decorative buttons on both lapels, a stylish collar you can fold down or pop-up and an open front with two, small side pockets
Fashion meets function: Made of soft French terry cloth, this coat is thick enough to ward off the chill, but thin enough to keep it dressy if paired with the right items
Match with: Slip into your favorite pair of jeans and add a light camisole for women or tank top under the jacket; dress it up with a pair of slacks for business casual, add a tennis skirt, maxi skirt, midi skirt, or skirt of any length for date night
Fall into Winter: Add a sweater under your jacket when it gets cold; on your feet, wear booties for women with pants, knee high boots with skinnies or a classic pair of high heeled pumps to complete the look for day or night"',
        4.4, 388, 776, '8-1.jpg,8-2.jpg,8-3.jpg', NULL, 'tommy-hilfiger-womens-casual-band-jacket', 1),

       (9, 'Calvin Klein Women-s One Button Lux Blazer', 71, 1320, '"Universal match: Dress up or down no matter the season, great for spring, summer, fall and winter; easily transition from day to night by pairing with a blouse, shirt, jacket, cardigan, heels or sandals
Year-round luxury: Wear a coat over these women’s blazer in the winter, cardigan in the spring and summer or wear them to relax around the home"',
        4.5, 220, 440, '9-1.jpg,9-2.jpg', NULL, 'calvin-klein-womens-one-button-lux-blazer', 1),

       (10, 'Calvin Klein Women-s Two Button Lux Blazer (Petite, Standard, & Plus)', 99, 8736, '"Lapel collar
Flap pockets"', 4.3, 1456, 2912, '10-1.jpg,10-2.jpg,10-3.jpg', NULL,
        'calvin-klein-womens-two-button-lux-blazer-petite-standard-plus', 1),

       (11, 'Men-s Duck Work Vest', 46, 240, '"Durable work duck vest with 100% duck cotton shell for lasting performance and 100% polyester lining for added comfort
Patented tape measure patch and Cardura welt pocket for convenient storage Functional media pocket to keep your devices secure
Pen pocket opening for easy access to your writing instruments
Rugged metal zipper and zipper pull for a durable and stylish look"', 4.7, 40, 80, '11-1.jpg,11-2.jpg,11-3.jpg', NULL,
        'mens-duck-work-vest', 1),

       (12, 'Columbia Men-s Steens Mountain Vest', 39, 342, '"DEEP PILE FLEECE: The Columbia Collegiate Men-s Flanker Vest II is crafted of deep and cozy 250g MTR filament fleece for ultimate warmth and college flair
ULTIMATE COMFORT: With a collared neck and full zip closure, your core will stay warm, while freeing up the arms for active use. The perfect layering piece for ultimate range of motion and comfort during cold winter days
COLLEGE STYLE, CLASSIC FIT: Designed with a stylish cut, this vest shows off your college pride and is super comfortable for those chilly outdoor events
HANDY FEATURES: This fleece vest provides two well positioned zippered side pockets to keep hands and small items warm and secure
BUILT TO LAST: Columbia’s attention to detail is what sets our apparel apart. Specifying only the highest quality materials, expert stitching and craftsmanship. This is a long-lasting vest you will enjoy for seasons to come"',
        4.2, 57, 114, '12-1.jpg,12-2.jpg,12-3.jpg', NULL, 'columbia-mens-steens-mountain-vest', 1),

       (13, 'Calvin Klein Men-s Lightweight Packable Hooded Puffer Vest', 49, 3654, '"Quality performance: Vest for men with front center zipper that extends into the hood with an adjustable bungee system to maintain warmth; keep your valuables safe with 2 side zipper pockets
Keeping warm: Interior insulation and water-resistant outer fabric provide added warmth and block out cold temperatures, so you’re ready for whatever the weather throws your way
Structured design: Features elastic binding at the armholes and cord piping along the zipper to add structure to the vest while still allowing for full range of motion
Travel-friendly: Easily pack and store these men’s outerwear vests; lightweight fabric and interior insulation allow the vest to fit where you need it
Comfort and style: This men’s vest is sure to become a staple in your closet; bring it along in your work bag, wear it for a night out, on vacation or as part of your daily outfit"',
        4.6, 609, 1218, '13-1.jpg,13-2.jpg,13-3.jpg', NULL, 'calvin-klein-mens-lightweight-packable-hooded-puffer-vest',
        1),

       (14, 'Columbia Women-s Flash Forward Windbreaker', 89, 162, '"Water resistant fabric
Draw cord adjustable hood
Zippered hand pockets
Elastic cuffs
Draw cord adjustable hem"', 4.1, 27, 54, '14-1.jpg,14-2.jpg,14-3.jpg', '14.mp4',
        'Columbia-Womens-Flash-Forward-Windbreaker', 1),

       (15, 'Legendary Whitetails Men-s Buck Camp Flannel', 36, 72, '"100% Cotton
Imported
[Relaxed Fit]: Refer to our size chart for the ideal fit; The Buck Camp Flannel is designed to highlight the chest and waist, offering a comfortable yet stylish shape; Its double-pleated back ensures ease of movement without any pulling or tugging; Adhere to care instructions for optimal shrinkage management
[Quality of Material]: Legendary Whitetails flannel shirt for men, recognized for its top-tier quality, is crafted from 100% soft brushed cotton flannel and promises warmth and breathability; This 5.1 ounce Buck Camp Flannel Shirt is ideally weighted for layering or standalone wear, indoors and out; Beyond its softness, its pill-resistant premium fabric quality ensures a consistently sharp look and lasting comfort
[Authentic Designs]: Our plaid shirt men-s designs stay true to their images, ensuring you get exactly what you see; immediate out of box comfort with no need for a ""break-in"" period; Its fade-resistant fabric ensures your men-s flannel long sleeve shirt looks as vibrant as day one, wash after wash
[Traditional Style]: The classic single pocket design gives you a clean look while providing an option for storage; use the pencil slot to hold your pencil when scoring on the range or safeguarding your sunglasses
[Corduroy Lined Cuffs & Collar]: Experience the classic touch of quintessential corduroy lining in our flannel shirt for men; not only does it enhance durability, but it also ensures the collar and cuffs maintain their shape"',
        3.9, 12, 24, '15-1.jpg,15-2.jpg', NULL, 'legendary-whitetails-mens-buck-camp-flannel', 1),

       (16, 'Amazon Essentials Men-s Regular-Fit Long-Sleeve Henley Shirt', 16, 79122, '"REGULAR FIT: Comfortable, easy fit through the shoulders, chest, and waist
LIGHTWEIGHT T-SHIRT JERSEY: Soft and comfortable knit fabric for a go-to lightweight t-shirt.
HENLEY T-SHIRT: The perfect alternative to your favorite t shirt. Pair this super soft henley with jeans or chinos for comfortable everyday style.
DETAILS: Ribbed neck and sleeve hem trim, raglan sleeve with sturdy overlock stitching, and shirttail hem."', 4.4,
        13187, 26374, '16-1.jpg,16-2.jpg,16-3.jpg', NULL, 'amazon-essentials-mens-regular-fit-long-sleeve-henley-shirt',
        2),

       (17, 'Hanes Men’s X-Temp Short Sleeve Polo Shirt', 13, 147618, '"SO SOFT - Midweight pique fabric feels super-soft up against your skin.
KEEPS YOU COMFORTABLE - X-Temp technology is designed to keep you cool and dry, no matter what the day brings.
ODOR CONTROL - FreshIQ advanced odor protection technology attacks the odor-causing bacteria in your clothing.
STAY-FLAT COLLAR - Classic polo style featuring a ribbed stay-flat collar.
FRONT BUTTON PLACKET – Men’s shirts are accented with a tailored 3-button placket.
TEARAWAY TAG - Simply remove the tearaway tag for itch-free comfort."', 4.4, 24603, 49206, '17-1.jpg,17-2.jpg,17-3.jpg',
        NULL, 'hanes-mens-x-temp-short-sleeve-polo-shirt', 2),

       (18, 'Russell Athletic Men-s Dri-Power Long Sleeve Tees', 8, 84870, '"Lightweight cotton blend provides premium softness wash after wash
Dri-Power moisture wicking technology keeps you cool and dry
Odor protection helps to keep fabric fresh
UPF 30+ provides protection from harmful UV rays
Tag free for comfort"', 4.4, 14145, 28290, '18-1.jpg,18-2.jpg,18-3.jpg', NULL,
        'russell-athletic-mens-dri-power-long-sleeve-tees', 2),

       (19, 'Amazon Essentials Men-s Regular-Fit Long-Sleeve T-Shirt', 14, 48264, '"REGULAR FIT: Comfortable, easy fit through the shoulders, chest, and waist
LIGHTWEIGHT T-SHIRT JERSEY: Soft and comfortable knit fabric for a go-to lightweight t-shirt.
CLASSIC T-SHIRT: This wardrobe staple features classic t-shirt construction, a pull-on crew neckline, and short-sleeves.
DETAILS: Ribbed neck trim, tagless printed label for comfort, and soft jersey-knit taping on neck seam.
LENGTH: 29"" from side neck on US size M."', 4.2, 8044, 16088, '19-1.jpg,19-2.jpg,19-3.jpg', '19.mp4',
        'Amazon-Essentials-Mens-Regular-Fit-Long-Sleeve-T-Shirt', 2),

       (20, 'Amazon Essentials Men-s Tech Stretch Tank T-Shirt', 13, 37554, '"RELAXED FIT: Comfortable, relaxed fit through shoulders, chest, and waist
TECH STRETCH FABRIC: An ultra-light weight and breathable fabric, with a soft smooth sheen finish. Made with quick dry and moisture-wicking finishes, helping you stay comfortable and cool while you workout. This knit fabric has a 4 way gentle stretch for full flexibility during wear.
ACTIVE TANK TOP: Train in confidence with this staple workout tank t-shirt. Designed with a longer body length for added coverage during workouts. Whether you-re heading out for a jog, a quick game of basketball or running errands with the kids, our apparel is made to work out, live in, and lounge.
DETAILS: Featuring a pull-on crew neckline and a sleeveless racer back design for added mobility during workouts."',
        4.3, 6259, 12518, '20-1.jpg,20-2.jpg,20-3.jpg', '20.mp4', 'Amazon-Essentials-Mens-Tech-Stretch-Tank-T-Shirt',
        2),

       (21, 'Kanu Surf Men-s UPF 50+ Long Sleeve Rashguard Swim Shirt', 18, 9102, '"Loose-fit rashguard in solid tone featuring long sleeves and crew neckline
UPF 50+ protection
Comfortable and versatile"', 4.5, 1517, 3034, '21-1.jpg,21-2.jpg,21-3.jpg', NULL,
        'Kanu-Surf-Mens-UPF-50-Long-Sleeve-Rashguard-Swim-Shirt', 2),


       (22, 'Clique Men-s Parma Colorblock Polo', 17, 264, '"Colorblocked polo with three button placket
Self collar and coverstitch detailing"', 4.4, 44, 88, '22-1.jpg,22-2.jpg,22-3.jpg', '22.mp4',
        'Clique-Mens-Parma-Colorblock-Polo', 2)
        ,
       (23, 'Gildan Adult Fleece Crewneck Sweatshirt', 13, 5142, '"Classic fit for loose comfort
Brushed interior provides superior cozy softness
Rib cuffs and bottom band with spandex for enhanced stretch and recovery
Durable double-needle stitching at shoulders, armholes, neck, waistband, and cuffs
Tear away label for customizable comfort
Screen printing, embroidery, heat transfer, patches and DTG"', 4.8, 857, 1714, '23-1.jpg,23-2.jpg,23-3.jpg', NULL,
        'Gildan-Adult-Fleece-Crewneck-Sweatshirt', 2),


       (24, 'Hanes Men’s Tank Top 2-Pack', 12, 57756, '"Either tagless or with easily removed tearaway tag for comfort
X-Temp technology is designed to adapt to your temperature and activity to keep you cool and dry for all day comfort
Performance tank features 40+ UPF rating
Moisture wicking with dynamic vapor control
Black satin label easily removed for comfort
Either or with easily removed tearaway tag for comfort"', 4.5, 9626, 19252, '24-1.jpg,24-2.jpg,24-3.jpg', NULL,
        'Hanes-Men’s-Tank-Top-2-Pack', 2),


       (25, 'Amazon Essentials Men-s Slim-Fit Tank Top', 10, 38142, '"SLIM FIT: Slim fit fit through chest, and waist.
LIGHTWEIGHT JERSEY: Soft and comfortable fabric for your go-to lightweight tank. Solids are 100% cotton and heathers are a cotton-poly blend.
TANK TOP: This tank top is your perfect hot wather closet staple. Layer it with a collared shirt or pair it with shorts, jeans, or even chinos for those extra hot days.
DETAILS: Jesey binding at armholes and neck for a clean look. Tagless printed label at back neck for extra comfort. Straight hem."',
        4.4, 6357, 12714, '25-1.jpg,25-2.jpg,25-3.jpg', '25.mp4', 'Amazon-Essentials-Mens-Slim-Fit-Tank-Top', 2),


       (26, 'Wrangler Authentics Men-s Long Sleeve Heavyweight Fleece Shirt', 27, 238578, '"BUILT FOR COMFORT: Made with comfort and function in mind, this two-sided brushed fleece will keep you warm all season long. Your new wardrobe favorite.
VERSATILE FIT: Perfect for layering in the winter or during cool fall evenings, this relaxed fit flannel doesn-t restrict movement so you can keep warm and keep moving on those colder days.
FUNCTIONAL STYLE: Made with 100% Polyester, this brushed fleece shirt is designed with style and function in mind. Wear it on the job or out to lunch with friends, this essential staple can be worn for many occasions.
DURABLE FINISHINGS: Finished with heavy-duty plastic buttons, this fleece is built to last. Button cuff closure and collar lined with Polyester designed to keep the warmth in, and the cold air out.
ADDED STORAGE: Constructed with (2) button front pockets, this fleece shirt has easy-access storage for all your basic necessities."',
        4.6, 39763, 79526, '26-1.jpg,26-2.jpg,26-3.jpg', '26.mp4',
        'Wrangler-Authentics-Mens-Long-Sleeve-Heavyweight-Fleece-Shirt', 2),


       (27, 'Amazon Essentials Men-s V-Neck Sweater (Available in Big & Tall)', 25, 150990, '"REGULAR FIT: Comfortable, easy fit through the shoulders, chest, and waist
COTTON YARN: Knit from a 100% cotton yarn with a soft hand and natural stretch.
EVERYDAY SWEATER: A go-to layering piece, this v-neck pullover sweater is lightweight enough to layer and soft enough to wear on its own.
DETAILS: Ribbed at the v-neckline, sleeve cuffs and bottom hem.
OFFICIAL LICENSED PRODUCT: Amazon Essentials offers one-of-a-kind products featuring your favorite characters to add wonder to your wardrobe! All products are officially licensed and designed in-house."',
        4.5, 25165, 50330, '27-1.jpg,27-2.jpg,27-3.jpg', '27.mp4',
        'amazon-essentials-mens-v-neck-sweater-available-in-big-tall', 2),


       (28, 'Hanes Mens Originals Tri-Blend Tank Top', 10, 2634, '"BASICS THAT ARE FAR FROM BASIC - A stylish collection of cool, modern essentials designed for comfort, made for every body. Be yourself in Hanes Originals.
SOFT & COMFY FEEL - Our best cotton, polyester and rayon come together to make this soft and comfy men-s muscle tee.
RECYCLED MATERIALS - Made with recycled polyester for a soft, and lightweight feel.
HANES QUALITY - Banded collar, armholes, and double-needle stitching on the hem.
COLD WATER WASH - Hanes recommends machine washing in cold water to reduce energy consumption."', 4.3, 439, 878,
        '28-1.jpg,28-2.jpg,28-3.jpg', NULL, 'hanes-mens-originals-tri-blend-tank-top', 2),


       (29,
        'Legendary Whitetails Men-s Tough as Buck Double Layer Thermal Henley Shirt-Casual Long Sleeve Waffle Knit Regular Fit',
        44, 84, '"VINTAGE STYLE: Since the 19th Century, hardworking men of all classes including loggers and hunters have been wearing thermal undershirts as cold weather essentials, our updated thermal henley shirt will fulfill your need for both function and fashion
WARM & COMFORTABLE: Made from 11 oz cotton/poly double layer thermal fabric; bonded construction traps air between the layers to retain warmth
VERSATILE: Our three button henley is easy to pull on and off for variable temperature control, thick enough to be worn alone or as a baselayer
RELAXED FIT: This henley includes the right amount of room in all the right places, layers perfectly under the Tough as Buck vests and jackets and the split hem allows it to be worn tucked in or untucked
DURABLE QUALITY: Triple needle stitching dual layer shirt"', 4.5, 14, 28, '29-1.jpg,29-2.jpg,29-3.jpg', NULL,
        'legendary-whitetails-mens-tough-as-buck-double-layer-thermal-henley-shirt-casual-long-sleeve-waffle-knit-regular-fit',
        2),


       (30, 'Champion, Classic and Comfortable Tee', 25, 109332, '"THE FIT - Standard fit long-sleeve t-shirt for men.
THE FEEL - Comfortable, 5.5 oz. ring-spun cotton or cotton blend that feels great on the skin.
THE LOOK - Classic long-sleeve t-shirt with a ribbed crewneck collar and sturdy stitchwork.
SPOT THE C - This long-sleeve tee has an embroidered C patch on the chest and a C logo patch on the sleeve.
EASY CARE - Machine wash this long-sleeve men-s t-shirt on cold with like colors to reduce energy."', 4.6, 18222, 36444,
        '30-1.jpg,30-2.jpg,30-3.jpg', '30.mp4', 'champion-classic-and-comfortable-tee', 2),


       (31, 'Wrangler Women-s Retro High Rise Trumpet Flare Jean', 50, 3462, '"TRUMPET FLARE. Bell bottoms are making a comeback. Combining classic retro details with the dramatic silhouette of decades past, we created an extreme flare jean fit for the contemporary cowgirl.
CLASSIC RETRO STYLE. You can-t beat the original, unless you are the original. With the new Wrangler Retro jeans, we enhanced our 1947 innovations with today-s premium standards of engineering and design.
GREEN MATERIALS. Every piece of clothing we make starts with respect for the planet we love. From recycled labels and patches to organic buttons and pocketing, our Green Jeans are 100% polyester free and made from a variety of natural fibers.
SUSTAINABLE DESIGN. Thoughtfully grown, responsibly made and respectfully engaged. Our Green Jeans are produced in factories that meet worker health and safety standards, using sustainable wash and finishing techniques.
ICONIC FINISHES. This high-waisted jean is finished with our iconic Wrangler ""W"" stitching, leather Wrangler patch on the back pocket, and 1947 rivet on the front pocket. Maintain that effortless classic style with a touch of Retro."',
        4.2, 577, 1154, '31-1.jpg,31-2.jpg,31-3.jpg', NULL, 'wrangler-womens-retro-high-rise-trumpet-flare-jean', 3),


       (32, 'Hanes ComfortSoft EcoSmart Men-s Fleece Sweatpants', 15, 315150, '"FLEECE FOR THE FUTURE - EcoSmart mid-weight, year-round cotton/poly fleece with up to 5% of the poly fibers.
RELAXED SILHOUETTE - For warming up, cooling down, or kicking back, these sweats have a relaxed fit with a straight leg and an open hem.
SOFT, PLUSH, AND MADE TO STAY THAT WAY - Pill-resistant durable fleece stays warm and cozy.
HANDY POCKETS - Side-seam pockets hold essentials.
EASE AT THE WAIST - An inside drawstring assures the fit you want at the waist.
TAG-FREE AND ITCH-FREE - Tagless design means no annoying tag to itch or bunch up."', 4.4, 52525, 105050,
        '32-1.jpg,32-2.jpg,32-3.jpg', NULL, 'hanes-comfortsoft-ecosmart-mens-fleece-sweatpants', 3),


       (33, 'Hanes Essentials Sweatpants', 15, 159174, '"OPEN BOTTOM STYLING – Men’s activewear features a 33” inseam and classic open bottom hem.
HANES QUALITY – These comfortable sweatpants for men are bolstered by sturdy details such as double-needle stitching at leg openings.
POCKET IT – Store the essentials in handy side-seam pockets.
THE DETAILS – Men’s lounge pants feature a covered elastic waistband with interior quick-drawcord loop.
COTTON GOODNESS – Made from 100% ring-spun cotton, Hanes jersey pants are soft and cozy. (Light Steel and Charcoal Heather are cotton/polyester blend.)
HOME GROWN – Cotton used in this product is sustainably grown on U.S. farms."', 4.3, 26529, 53058,
        '33-1.jpg,33-2.jpg,33-3.jpg', NULL, 'hanes-essentials-sweatpants', 3),


       (34, 'Fruit of the Loom mens Yarn-dye Woven Flannel Pajama Pant', 19, 32574, '"Two deep side seam pockets
Button-thru fly
Elastic waistband and a twill draw cord for a personalized fit"', 4.2, 5429, 10858, '34-1.jpg,34-2.jpg,34-3.jpg', NULL,
        'fruit-of-the-loom-mens-yarn-dye-woven-flannel-pajama-pant', 3),


       (35, 'Gildan Adult Fleece Open Bottom Sweatpants with Pockets', 11, 158148, '"Classic fit with seamless sides for easier printability
Brushed interior provides superior cozy softness
Jersey-lined pockets
Differential rise for better fit
Slightly tapered leg with open bottom
Tear away label for customizable comfort"', 4.3, 26358, 52716, '35-1.jpg,35-2.jpg,35-3.jpg', NULL,
        'gildan-adult-fleece-open-bottom-sweatpants-with-pockets', 3),


       (36, 'Amazon Essentials Men-s Fleece Sweatpant ', 17, 286122, '"56% Cotton, 44% Polyester
Imported
Drawstring closure
Machine Wash"', 4.5, 47687, 95374, '36-1.jpg,36-2.jpg,36-3.jpg', NULL, 'amazon-essentials-mens-fleece-sweatpant', 3),


       (37, 'Fruit of the Loom Eversoft Fleece Elastic Bottom Sweatpants with Pockets', 13, 288396, '"Male Model is 6’0” wearing a Size Medium. Female Model is 5’9” wearing size Small.
Eversoft fabric provides premium softness wash after wash
Comfort waistband with inner exposed quick cord for adjustable waist
Double-needle stitching on the hems for added durability
Relaxed banded bottom with Deep Pockets to keep Items secure"', 4.4, 48066, 96132, '37-1.jpg,37-2.jpg,37-3.jpg', NULL,
        'fruit-of-the-loom-eversoft-fleece-elastic-bottom-sweatpants-with-pockets', 3),


       (38, 'Russell Athletic Dri-Power Fleece Sweatpants & Joggers', 13, 225450, '"Medium-weight 9 oz fleece keeps in body heat so you can stay warm
Dri-Power moisture wicking technology keeps you warm and dry
Elastic waistband with inside quick cord, for an adjustable fit
Hemmed elastic bottom that stays securely in place
No pockets for a clean sleek look"', 4.3, 37575, 75150, '38-1.jpg,38-2.jpg,38-3.jpg', NULL,
        'russell-athletic-dri-power-fleece-sweatpants-and-joggers', 3),


       (39, 'Amazon Essentials Men-s Straight-Fit Woven Pajama Pant', 19, 147186, '"REGULAR FIT: Comfortable, easy fit through the hip and thigh with a straight leg. Sits below the waist.
COTTON POPLIN: Lightweight, crisp and cool cotton poplin provides ultimate comfort and breathability while sleeping.
COTTON POPLIN PAJAMA PANT: Our pajama pant provides a comfortable and cool night-s sleep.
DETAILS: Featuring an elasticated waistband with an adjustable drawcord for ease and comfort, button fly closure, and side pockets to hold your small essentials."',
        4.4, 24531, 49062, '39-1.jpg,39-2.jpg,39-3.jpg', NULL, 'amazon-essentials-mens-straight-fit-woven-pajama-pant',
        3),


       (40, 'Champion mens Pants', 24, 235572, '"THE FIT - Standard-fit men-s pants with a 32.5"" inseam.
THE FEEL -These pants are made from soft 6.1 oz. cotton or a cotton blend that is perfect for everyday wear.
THE LOOK - Open-bottom hem creates a laid-back, roomy fit you-ll love.
ADDED COMFORT - Pants with internal drawcord for adjustability and comfort.
POCKETS - Two deep side pockets hold lightweight tech."', 4.3, 39262, 78524, '40-1.jpg,40-2.jpg,40-3.jpg', NULL,
        'champion-mens-pants', 3),


       (41, 'Jerzees Men-s NuBlend Fleece Joggers & Sweatpants', 11, 69090, '"Mid-weight fleece sweatpant featuring elasticized waist and cuffs
Closure_type: Pull On
Care_instructions: Machine Wash
Style: Fleece Sweatpants"', 4.3, 11515, 23030, '41-1.jpg,42-2.jpg,43-3.jpg', NULL, '
jerzees-men-s-nublend-fleece-joggers-&-sweatpants', 3),


       (42, 'Amazon Essentials Women-s Flannel Sleep Pant', 10, 34584, '"RELAXED FIT: Relaxed, comfortable fit through hip, thigh and leg. Mid rise, sits below the natural waist.
SOFTLY BRUSHED FLANNEL: Soft, breathable, and tightly woven, this flannel is comfy and durable. Made with 100% brushed cotton.
ESSENTIAL SLEEP PANT: The perfect sleep pant for snuggling up and relaxing whether you are sleeping or lounging around the house. Style back to Amazon Essentials Women-s Slippers to keep your feet cozy and warm.
DETAILS: Featuring an elasticated waistband with an adjustable drawcord for ease and comfort.
INSEAM: 30 1/2"" on US size S."', 4.2, 5764, 11528, '42-1.jpg,42-2.jpg,42-3.jpg', NULL,
        'amazon-essentials-women-s-flannel-sleep-pant', 3),


       (43, 'Champion Women-s Sports Bra', 24, 106008, '"THE FIT – Standard-fit men-s open-bottom sweatpants with an elastic waistband, adjustable drawcord, and 32"" inseam.
THE FEEL – Midweight, 9 oz. warm and durable fleece that’s been brushed for softness.
THE LOOK – classic men-s sweatpants with two side pockets and sturdy stitch details.
LOW PILL, LOW SHRINK – High-quality fleece fabrication designed to reduce pilling and shrinkage.
SPOT THE C – Iconic C logo hits at the hip of these men-s sweatpants.
THE POWERBLEND COLLECTION – A powerhouse fabric blend that’s made for the daily with a stay-true fit and comfort that never quits."',
        4.5, 17668, 35336, '43-1.jpg,43-2.jpg,43-3.jpg', NULL, 'champion-women-s-sports-bra', 3),


       (44, 'Champion Sweatpants', 21, 3972, '"MID RISE. Show the world a thing or two about being the fashionable legend you already know you are with these mid rise flares. Hitting comfortably at the waist that gives way to a flare leg, these jeans are flattering and on-trend.
LEGENDARY DETAILS. These flare jeans are finished with our iconic logo patch, spade pockets and hardware that make Lee jeans unique.
STRETCH DENIM. Strut with confidence in these flattering flare jeans. Made from authentic stretch denim, they move with you for all-day comfort.A LIFETIME OF QUALITY. For over 100 years, Lee has produced quality apparel with durability and long-lasting construction in mind. Lee is committed to designing clothing that conforms to your body, allowing you to move through life freely.
SPECIFICATIONS. 5 pockets. Zipper fly with button closure. Inseam: 31"" short, 33"" medium, 35"" long. Rise: 9.5"". Bottom Leg Opening: 23"". Destruction details may vary by colorway."',
        4.1, 662, 1324, '44-1.jpg,44-2.jpg,44-3.jpg', NULL, 'champion-sweatpants', 3),


       (45, 'CHAMPRO Boys Open-Bottom Loose-Fit Baseball Pant with Adjustable Inseam and Reinforced Sliding Area', 20,
        10692, '"COMFORTABLE: These loose-fit, straight-leg pants have open bottoms to circulate air and provide a free, relaxed, and comfortable feel
NON-ABRASIVE STRETCH FABRIC: Made with 100% highly abrasion-resistant TEK-KNIT polyester, the 14 oz. pro-weight fabric allows four-way stretch and adapts to the wearer’s movements
ADJUSTABLE INSEAM: Adjust the inseam length up to 4 inches shorter with hook-and-loop straps to get the perfect fit for each athlete. Customize for comfort and freedom of movement on the field
DURABLE: A sliding seat and knees reinforced with double-ply fabric create a more durable pant that withstands sliding action and lasts longer through the season"',
        4.5, 1782, 3564, '45-1.jpg,45-2.jpg,45-3.jpg', NULL,
        'champro-boys-open-bottom-loose-fit-baseball-pant-with-adjustable-inseam-and-reinforced-sliding-area', 3),


       (46, 'Lucky Brand Womens Pearl Delicate Necklace', 22, 3840,
        'Double-layered necklace featuring faux-pearl halo pedant and Y-shaped strand with faceted-bead finish', 4.2,
        640, 1280, '46-1.jpg,46-2.jpg,46-3.jpg', '46.mp4', 'lucky-brand-womens-pearl-delicate-necklace', 4),


       (47, 'Lucky Brand Silver-Tone Statement Link Bracelet', 25, 5454, '"Lucky Brand Silver Link Bracelet
Set in silver-tone mixed metal
Approx. length: 7-1/4"" + 1/2"" extender"', 4.5, 909, 1818, '47-1.jpg,47-2.jpg,47-3.jpg', '47.mp4',
        'lucky-brand-silver-tone-statement-link-bracelet', 4),

       (48, 'Betsey Johnson Womens Butterfly Charms Layered Necklace', 48, 30192, '"TRENDY NECKLACES: Delicate layered chain necklace features mixed faceted beads, delicate stone accents, lovely flowers and heart embellished with woven mixed multi-colored charms. Hand crafted from polished gold-tone metal, glass and plastic
LIGHTWEIGHT NECKLACES : Effortless and lightweight necklaces easy to put on and take off. Necklace has an adjustable lobster clasp closure
MEASUREMENTS : 16in length with adjustable 3in extender chain, 3.5in total frontal drop
PERFECT FOR GIFTING : Wonderful gift for all year-round especially as Birthday Gifts, Bridesmaid-s Gifts, Anniversary Gifts, Mother-s Day Gifts, Wedding Gifts, Christmas Gifts or any other holiday gifts. Perfect statement piece for any ensemble!HYPOALLERGENIC JEWELRY: Made with nickel and lead free metal that is less likely to cause any allergic reaction"',
        4.4, 5032, 10064, '48-1.jpg,48-2.jpg', '48.mp4', 'betsey-johnson-womens-butterfly-charms-layered-necklace', 4),


       (49, 'Amazon Essentials 14k Yellow Gold 8mm ', 125, 48, '"This product was previously sold as Amazon Collection and now as Amazon Essentials.
STYLE: The minimal necklace for women is 18"" long and is equipped with 8mm cushion-cut gemstone; ideal for elevating your everyday style
MATERIAL: This dainty chain with spring ring clasp is crafted from 14K yellow gold; studded with heat-treated white sapphire gemstone for an elegant appeal
DETAILS: Available in a range of birthstones, perfect for personalized gifting; the natural properties and composition of mined gemstones define the unique beauty of each piece; image may show slight differences to the actual stone in color and texture.
CARE: Gemstone pendant necklace with anti-tarnish coating should be stored in a cool, dry place in its own box; limit exposure to extreme temperatures, perfume, and household cleaning products"',
        3.6, 8, 16, '49-1.jpg,49-2.jpg,49-3.jpg', '49.mp4', 'amazon-essentials-14k-yellow-gold-8mm', 4),


       (50, 'Swarovski Millenia Crystal Pendant Necklace Collection', 94, 88, '"Measurements: 14 7/8 inches, Pendant size: 14 7/8 x 3/8 inches
A world of wonder awaits: A true centerpiece to any look, the pink, octagon-cut crystal is framed by smaller crystals and suspended from a delicate, rose gold-tone finish chain, for timeless style
Versatile and eye-catching: An elegant accessory that can be worn alone or paired with other pieces from the Millenia collection to lend a feminine flourish to any look
Refined artistry: Dynamic engineering and timeless elegance collide in this mesmerizing Swarovski pendant necklace; a dazzling addition to any collection or a beautiful gift for friends and loved ones
Designed to last: Swarovski jewelry maintains its brilliance when simple care practices are observed; remove before contact with water, lotions, or perfumes and polish with a lint-free cloth
Items delivered: (1) Swarovski Millenia pendant necklace with pink, octagon-cut Swarovski crystal and white crystal frame on a rose gold-tone finish chain, complete with Swarovski necklace box"',
        4.6, 88, 176, '50-1.jpg,50-2.jpg,50-3.jpg', '50.mp4', 'swarovski-millenia-crystal-pendant-necklace-collection',
        4),


       (51, 'Carhartt Casual Rugged Canvas Duck Belts for Men', 29, 1626, '"CANVAS DUCK BELT: Rugged and Reliable accessory crafted for those who appreciate both form and function. Made from a substantial 12-ounce firm-hand 100% ringspun cotton duck with a corduroy backing, this belt is a true testament to durability and quality.
DURABLE STICHING: robust construction is evident in its durable stiching. Able to withstand all day wear and tear. This belt was built to be a relaible accessory for any task.ANTIQUE BRASS BUCKLE: the classic antique brass buckle adds a unique vintage charm while allowing for a customizable fit, ensuring comfort and style.
CARHARTT WOVEN LABEL: Made with our iconic Carhartt label, our Canvas Duck Belt showcases its heritage and commitment to excellence.
WIDTH: 1 1/2"""', 4.5, 271, 542, '51-1.jpg,51-2.jpg,51-3.jpg', NULL, 'carhartt-casual-rugged-canvas-duck-belts-for-men',
        4),


       (52, 'Dickies Men-s 1 1/2 inch Solid Straight Clip Adjustable X Back Suspender', 22, 252444, '"PERFECT STYLE: High quality, heavy duty X-back shape design. Enjoy a great fit with our four metal clips that attach to any kind of pants, jeans or trousers. These clasps will grip on securely without unintentional unbuckling.
UNIQUE DESIGN: Suit up and add style to your business attire with this solid X-back clip suspender brace. Classic and timeless in style, these suspenders will elevate your wardrobe to the next level.
FULLY ADJUSTABLE: These classic solid suspenders are 1 1 by 2""wide. They feature an embossed leather patch with the Dickies logo. One size fits up to 42. We also have an extended size for Big & Tall.
HOW TO USE: Just quickly and easily release the two side clips when needed. Ideal for work, occasions, or to dress up a casual look. This accessory works best with dress pants, trousers, or jeans."',
        4.5, 42074, 84148, '52-1.jpg,52-2.jpg,52-3.jpg', NULL,
        'dickies-men-s-1-1-2-inch-solid-straight-clip-adjustable-x-back-suspender', 4),


       (53, 'Dickies Men-s No-Scratch Leather Mechanic Belt', 19, 77088, '"UNIQUE: At first you may think ""how does this belt work?"" Well, bear with us for a minute. This no-metal visible belt is a must-have if you are looking to hold your pants subtly. Its unique design makes the extra length of the belt sits on the inside.
GREAT FEATURE: A metal plate is sewn into the belt strap which includes a metal pin that sticks out toward you, closing your belt within discretion. This belt does NOT set off metal detectors, keep your belt on when passing metal detectors at the airport.
DICKIES QUALITY: When you see a Dickies product you know that it is going to last. We make our belt for hard workers, dedicated men who need a belt that they can rely on, all day long. This no-buckle belt is no exception and is your new go-to belt.
SIZING: For best fit, select a belt size 2 inches larger than your pant size. For example, if your pant size is 34, shop belt size Medium (36-38). Strap is 1.4 inches wide for a standard fit that will fit all of the belt loops in your closet."',
        4.5, 12848, 25696, '53-1.jpg,53-2.jpg,53-3.jpg', NULL, 'dickies-men-s-no-scratch-leather-mechanic-belt', 4),


       (54, 'Under Armour Men-s Performance Headband', 5, 91800, '"Headband/sweatband constructed in multi-channel performance fibers
Moisture Transport System wicks sweat away from the body
Embroidered UA logo"', 4.5, 15300, 30600, '54-1.jpg,54-2.jpg', '54.mp4', 'under-armour-men-s-performance-headband', 4),


       (55, 'Puma Golf Men-s Reversible Web Belt (One Size)', 14, 24408, '"Metal Clamp Buckle
Reversible Web Strap
Bottle Opener On Back Of Buckle
Country Of Origin: China"', 4.6, 4068, 8136, '55-1.jpg,55-2.jpg,55-3.jpg', '55.mp4',
        'puma-golf-men-s-reversible-web-belt-one-size', 4),


       (56, 'Carhartt Men-s Rugged Leather Triple Stitch Wallet', 39, 13002, '"Carhartt Men-s Leather Triple-Stitched Trifold Wallet. Men-s leather wallet with a protective patch
Keep essential cards and cash secure and organized. This men-s trifold wallet is made of rugged top-grain leather with a sweat-resistant patch to keep it dry and reduce wear
Top grain leather, cotton duck lining, and reinforced spine with stitching provides extra durability
Six credit card pockets, two side pockets, bill pocket lined with brown cotton duck fabric, ID window with thumb slide, triple needle contrast stitching
Dimensions: 4.5"" x 3.5"" x 0.75"""', 4.7, 2167, 4334, '56-1.jpg,56-2.jpg,56-3.jpg', '56.mp4',
        'carhartt-men-s-rugged-leather-triple-stitch-wallet', 4),

       (57, 'Under Armour Men-s 3-inch Performance Wristband 2-Pack', 6, 41748, '"Headband/sweatband constructed in multi-channel performance fibers
Material wicks sweat & dries really fast
Embroidered UA logo
Sold in pairs
Width: 3"""', 4.7, 6958, 13916, '57-1.jpg,57-2.jpg,57-3.jpg', NULL,
        'under-armour-men-s-3-inch-performance-wristband-2-pack', 4),


       (58, 'Carhartt Men-s Flip It', 25, 19140, '"Mossy Oak camo fleece shell; synthetic palm; flip mitt construction
Synthetic reinforced palm and thumb
Magnetic mitt; open fingers and thumbs
Elastic wrist
Lycra binding hem"', 4.4, 3190, 6380, '58-1.jpg,58-2.jpg,58-3.jpg', '58.mp4', 'carhartt-men-s-flip-it', 4),


       (59, 'Under Armour Mens Clean Up Baseball Gloves', 30, 0, '"87% Nylon, 13% Elastane
Imported
Synthetic palm provides durability & grip
Built with HeatGear fabric to keep your hands cool, dry & light all game
Synthetic overlays add support in all the right places
Perforations built over the fingers for extra breathability
Adjustable elastic wrist cuffs provide support & a locked-in, powerful feel
Sold in pairs"', 4.7, 33, 66, '59-1.jpg,59-2.jpg', NULL, 'under-armour-mens-clean-up-baseball-gloves', 4),


       (60, 'Amscan Striking Skull Bandana - Black & White', 4, 2742, '"BOLD PIRATE DESIGN: Stand out with the Striking Skull Bandana, featuring a pirate-s skull and crossbones printed design on a black background, perfect for adding some edge to your next event or costume.
HIGH-QUALITY POLYESTER: Crafted with lightweight and comfortable polyester, this bandana ensures durability and a comfortable fit while showcasing your unique style.
REUSABLE & EASY-TO-CLEAN: Our Striking Skull Bandana is both washable and reusable, ensuring that you can enjoy its eye-catching design and comfort at multiple events.
VERSATILE COSTUME ACCESSORY: Ideal for role-playing games, Halloween events, and pirate-themed costumes, this Striking Skull Bandana will add an authentic touch to your ensemble.BOOST YOUR LOOK WITH CONFIDENCE: Make a powerful statement with this black and white skull bandana that combines fashion, function, and versatility for an unforgettable look."',
        3.9, 457, 914, '60-1.jpg,60-2.jpg', NULL, 'amscan-striking-skull-bandana-black-&-white', 4),

       (61, 'Flexfit Unisex Adult Cotton Twill Fitted Cap Hat', 11, 111672, '"Great-Looking Baseball Hats for Men and Women: These blank 6-panel Flexfit hats feature a mid-profile cotton-twill texture that provides all-day casual comfort with a rounded athletic shape and stretch band to fit all sizes
Men-s and Women-s Hats with Sun Protection: These fitted hats for men and women feature our signature Permacurv technology that supports the visor-s durability while a silver undervisor provides an additional dose of style and shade
Quality Construction: These women-s and men-s baseball caps are made of 98% Cotton and 2% Spandex for a cool twill texture that-s ideal for all of your team sports needs
Hat Care: Our women-s and men-s hats and caps are suitable for hand wash only; Please note that excessive heating, sunlight exposure, or sweat perspiration may alter the color
The Flexfit Mission: Born from a vision to redefine the ordinary, we-re committed to constant evolution; Leveraging 40 years of manufacturing expertise, we aim to produce the highest quality caps in styles, colors, and sizes for all"',
        4.5, 18612, 37224, '61-1.jpg,61-2.jpg,61-3.jpg', '61.mp4', 'flexfit-unisex-adult-cotton-twill-fitted-cap-hat',
        5),


       (62, 'Achiou Ski Mask for Men Women', 7, 152868, '"ULTIMATE PROTECTION – Achiou balaclava face mask is made of high-quality breathable UPF 50+ mesh fabric, super comfortable, lightweight, and durable. Protect your head and face from UV rays, dust, and wind
WARM BREATHABLE & KEEP DRY – Achiou ski face masks are tailored to your head and face to ensure that the part to cover the nose not falls down easily. Complete head face neck mask for summer and winter. The balaclava mesh material is breathable, absorbs sweat and will keep you dry. It also fit nicely under your helmet and goggles and keep your face and head warm
VERSATILITY & BEST GIFTS – Can be worn as full face mask or hat, open balaclava, sun shield masks, half ski mask , neck gaiter or saharan style & ninja hoodie. Wear your balaclava on its own or under a helmet. People use Achiou balaclava for skiing, running, riding, fishing, snowboarding, motorcycling, hiking, Climbing. Perfect fit for Women, Men and Children. It is best gift for your friends and family etc
ULTIMATE COMFORT: Achiou ski mask provides all-day comfort by keeping you warm and dry. It has a stretchy, lightweight and breathable fabric that protects your face while wicking away moisture. Thermal Dry fabric provides optimal moisture transfer, dry time
GREAT TO SHARE (GREAT GIFT IDEA TOO!) – while you are enjoy it, send it to your family, friends, or people you loved as a gift for Christmas, New Years, Valentine-s Day, Father-s day, Mother-s Day etc! Also,it-s a great gift to runners, athletes, fitness workouts, hiking, cycling, or anyone who need it"',
        4.5, 25478, 50956, '62-1.jpg,62-2.jpg,62-3.jpg', '62.mp4', 'achiou-ski-mask-for-men-women', 5),


       (63, 'MEANBEAUTY 27 Square Silk Like Head Scarf for Women', 9, 3846, '"【MATERIAL】: This Neck Scarf made of premium satin fabric, silk feeling, soft, comfortable, breathable, skin-friendly, cozy, fashionable and stylish. Meanwhile, an array of colors and patterns allow you to match easily with daily outfits.
【MULTIFUNCTIONAL】: The head scarf is about 27inch (70cm) square size.The square scarf can be worn in multiple ways according to different preferences and daily needs. It can be tied around neck, head, wrist, hair, handbag, hat or any other parts.
【VERSATILE】: The elegant scarf suits to spring, summer, fall, and winter, keep you chic and decent all the year in four seasons.And make you stay gorgeous when attending big events like Wedding, Graduation, and any other important occassions.
【GIFTING】: Equipped with custom exquisite gift box packaging,Ideal gifts for your friend, girlfriend, mother, sister, wife on big events or festivals, Valentine-s Day, Thanksgiving Day or Christmas.Create a sweet surprise for you loved ones now!
HOW TO MAINTAIN: The winter set is easy to clean and maintain.Hand wash gently in cold water below 30 degree with a neutral detergent or dry cleaning. Do not scrub or wring hard."',
        4.5, 641, 1282, '63-1.jpg,63-2.jpg,63-3.jpg', null, 'meanbeauty-27"-square-silk-like-head-scarf-for-women', 5),


       (64, 'KBETHOS Vintage Washed Distressed Cotton', 12, 98448, '"Vintage Distressed Washed Style Mesh Back
Adjustable Snapback Closure
Great Fit for Most Head Sizes; Dad Hat Low Profile Unconstructed
WHY CUSTOMERS LOVE KBETHOS:✔️As one of the top headwear choice for Amazon, KBETHOS is a headwear brand you can TRUST.✔️With hundreds of styles & looks, it is a great & fun experience.✔️Moreover, our customer support is unmatchable and unbeatable.✔️Contact us for anything!✔️Warm your heads today!✔️"',
        4.6, 16408, 32816, '64-1.jpg,64-2.jpg,64-3.jpg', NULL, 'reef-womens-kbethos-vintage-washed-distressed-cotton',
        5),

       (65, 'TopHeadwear 3-Hole Ski Face Mask Balaclava', 20, 21138, '"Availabel in a variety of colors
3-Hole Style Ski Mask
One Size Fits Most"', 4.2, 3523, 7046, '65-1.jpg,65-2.jpg,65-3.jpg', null, 'kbethos-vintage-washed-distressed-cotton',
        5),


       (66, 'Classic Plain Ponytail Messy High Bun Headwear Adjustable Cotton', 15, 25920, '"Features ponytail slot that is perfect for pulling your bun or high ponytail through
Adjustable to fit most sizes
Everyday cap for all occasions
Available in various colors to choose from"', 4.6, 4320, 8640, '66-1.jpg,66-2.jpg,66-3.jpg', null,
        'classic-plain-ponytail-messy-high-bun-headwear-adjustable-cotton', 5),


       (67, 'Bell Qualifier DLX Full-Face Blackout Helmet', 160, 8652, '"Communications port no longer built in to helmet. Picture incorrect
Lightweight polycarbonate/ABS shell construction with removable interior, padded wind collar drastically reduces wind and road noise
Velocity Flow Ventilation system with FlowAdjust
This colorway comes with 2 shields, the clear (on the helmet) and dark smoke is included in the box.DOT approved. Meets the FMVSS 218 Standard"',
        4.5, 1442, 2884, '67-1.jpg,67-2.jpg,67-3.jpg', null, 'bell-qualifier-dlx-full-face-blackout-helmet', 5),


       (68, 'Volcom Men-s Full Stone Flexfit Hat', 29, 18402, '"Six-panel flex-fit baseball cap featuring logo embroidery at front crown
The fitted hat is made with soft cotton twill, with embroidery at the front, a curved-to-perfection brim, and a metal back clasp to customize the fit.
Machine wash.
Get dressed for your care-free days and wear the lightweight and comfortable with your outfits.
Signature-soft blend of lightweight and breathable fabric is designed for all-day comfort"', 4.7, 3067, 6134,
        '68-1.jpg,68-2.jpg,68-3.jpg', null, 'volcom-men-s-full-stone-flexfit-hat', 5),


       (69, 'Callaway Golf Relaxed Retro Collection Headwear', 31, 372, '"Low Profile
Retro Patch Design
Cooling Sweatband"', 4.6, 62, 124, '69-1.jpg,69-2.jpg,69-3.jpg', null,
        'callaway-golf-relaxed-retro-collection-headwear', 5),


       (70, 'Coal Uniform Acyrlic Workwear Knit Cuff Beanie', 27, 4764, '"Material: 100% acrylic
Style: cuff
Activity: casual
Manufacturer : 1 year
Age range descriptionAdult"', 4.8, 794, 1588, '70-1.jpg,70-2.jpg,70-3.jpg', null,
        'coal-uniform-acyrlic-workwear-knit-cuff-beanie', 5),


       (71, 'Pacific Headwear Waxed Cotton Dad Cap', 16, 42, '"Waxed cotton
Low profile
Curved visor
Matching eyelets; Pro-stitched finish
Self-fabric strap with brass buckle clasp"', 4.6, 7, 14, '71-1.jpg,71-2.jpg,71-3.jpg', null,
        'pacific-headwear-waxed-cotton-dad-cap', 5),


       (72, 'Timberland Men-s Baseball', 25, 9534, '"Timberland Men-s baseball cap with leather strap
Adjustable leather strap closure
Curved Brim
Item package weight: 0.6 pounds"', 4.5, 1589, 3178, '72-1.jpg,72-2.jpg,72-3.jpg', null, 'timberland-men-s-baseball', 5),


       (73, 'Timberland Men-s Cotton Canvas Baseball Cap', 28, 9888, '"Adjustable back strap
Curved brim
3D embroidered tree logo
Slide closure buckle
Special Size-Standard"', 4.6, 1648, 3296, '73-1.jpg,73-2.jpg,73-3.jpg', null,
        'timberland-men-s-cotton-canvas-baseball-cap', 5),


       (74, 'Timberland Women-s Classic Tall Beanie', 22, 1398, '"COLD WEATHER HAT: Timberland Women-s Classic Tall Beanie, featuring logo on cuff.
THOUGHTFUL DESIGN: Featuring an adjustable foldable cuff to wear either way displaying the Timberland logo in the front.
SOFT AND WARM: Made of 100% Soft Acrylic, this soft & beautifully designed Timberland-s cuff hat is stylish yet practical and provides comfort and protection from the winter cold.
WEAR ANYWHERE: Perfect for daily wearing, this warm beanie is perfect for everyday wear, hiking, skiing, jogging, and other winter outdoor activities.
COZY GIFT: An ideal gift for family, loved ones and friends for Christmas, Birthdays, Valentine-s Day, New Year’s Days, Wedding Anniversary, Thanksgiving, Holidays and more"',
        4.6, 233, 466, '74-1.jpg,74-2.jpg,74-3.jpg', null, 'timberland-women-s-classic-tall-beanie', 5),


       (75, 'Concept One U.s Polo Assn', 19, 1050, '"BASEBALL HAT: Officially licensed U.S Polo Association adjustable golf cap with an embroidered horse logo on the frontONE SIZE FITS ALL: Features an adjustable silver metal buckle closure embossed with an American flag to allow for easy resizing for a comfortable fit on heads of all shapes and sizes
CURVED BRIM: Features a curved brim with stitching to keep the Sun-s UV rays out of your eyes
100% COTTON: Lightweight and durable cotton fabric allows for instant comfort when worn HAND WASH ONLY: Recommended for hand washing only, lay flat to dry, do not iron"',
        4.5, 175, 350, '75-1.jpg,75-2.jpg,75-3.jpg', null, 'concept-one-u.s-polo-assn', 5),


       (76, 'Under Armour Men-s Ignite Pro Slide', 29, 270, '"Adjustable synthetic strap with soft foam lining for added comfort & perforations for breathability
Textured foam footbed for unprecedented comfort
EVA outsole built with durable traction pods in heel for lightweight cushioning & comfort
Water Resistance Level: not_water_resistant"', 4.2, 45, 90, '76-1.jpg,76-2.jpg,76-3.jpg', null,
        'under-armour-men-s-ignite-pro-slide', 6),


       (77, 'YOKI Women-s Heels Platform', 39, 168, '"Open Round Toe
Padded Inner Footbed
4"" Chunky Heel
Adjustable Upper Ankle Buckle Strap"', 3.7, 28, 56, '77-1.jpg,77-2.jpg,77-3.jpg', null, 'yoki-women-s-heels-platform',
        6),


       (78, 'Skechers Men-s Nampa Food Service Shoe', 39, 74124, '"Memory Foam Footbed
Relaxed Fit
Slip Resistant
Electrical Hazard
Food Service
Lace up duty
"', 4.4, 12354, 24708, '78-1.jpg,78-2.jpg,78-3.jpg', null, 'skechers-men-s-nampa-food-service-shoe', 6),


       (79, 'Blowfish Malibu Unisex-Child Fashion Sneaker', 33, 18918, '"Velcro enclosure
Fabric linings
Manmade outsole
Canvas fabric upper with metal grommet accents"', 4.6, 3153, 6306, '79-1.jpg,79-2.jpg,79-3.jpg', null,
        'blowfish-malibu-unisex-child-fashion sneaker', 6),


       (80, 'Columbia Men-s Bonehead PFG Boat Shoe
', 73, 3006, '"Omni-Grip non-marking wet grip outsole with razor siping
Lower durometer EVA for the ultimate in comfort and shock absorbency; Treatment on footbed
Combination open mesh and synthetic upper; Soft heel material for added comfort; Blood -n Guts water and stain resistant treatment
Combination open mesh and synthetic upper; Soft heel material for added comfort; Blood -n Guts water and stain resistant treatment"',
        4.5, 501, 1002, '80-1.jpg,80-2.jpg,80-3.jpg', null, 'columbia-men-s-bonehead-pfg-boat-shoe', 6),


       (81, 'Chooka Women-s Waterproof Plush Chelsea Bootie Chelsea Boot', 41, 39516, '"durable waterproof boots, fashion meets function with these ankle high booties. 100% waterproof with a fashionable matte finish
comfort, all day wear with the moisture- absorbent plush lining, elastic gore for easy on and off
traction, rubber outsole with added traction, self-cleaning tread pattern
ankle bootie, approx 5.5 inch height allows for year round wear
cleaning, use a damp cloth with water and soap to clean your boots"', 4.3, 6586, 13172, '81-1.jpg,81-2.jpg,81-3.jpg',
        '81.mp4', 'chooka-womens-waterproof-plush-chelsea-bootie-chelsea-boot', 6),


       (82, 'DUNLOP Protective Footwear MD0HD01.13 Dane', 28, 3348, '"LIGHTWEIGHT: The Dane boots are made to be lightweight, up to 25% lighter than classic PVC boots.
WATERPROOF: These lightweight boots feature an injection molded seamless construction that provides 100% waterproof protection.
COMFORTABLE: Our boots are comfortable and lightweight, great for everyday use.
APPLICATIONS: Our Dane Boots work well for leisure use. Please review our size charts in the image section to find the correct sizing. Made in the USA.
DUNLOP PROTECTIVE FOOTWEAR: We are Dunlop Protective Footwear, the world’s leading manufacturer of protective footwear. In more than 75 countries worldwide, we provide comfortable and protective footwear for workers across multiple industries."',
        4.4, 558, 1116, '82-1.jpg,82-2.jpg,82-3.jpg', NULL, 'dunlop-protective-footwear-md0hd01-13-dane', 6),


       (83, 'GUESS Women-s Avin Wedge Sandal', 59, 11970, '"Logo graphic straps elevated on a chunky platform heel lend warm-weather lift to casual style in the Avin sandals from GUESS.
Hook and Loop closure
Open Toe
Guess detailing on straps"', 4.6, 1995, 3990, '83-1.jpg,83-2.jpg,83-3.jpg', NULL, 'guess-women-s-avin-wedge-sandal', 6),


       (84, 'Crocs Unisex-Adult Classic Clogs', 49, 3410562, '"Crocs For Women And Men: The Crocs Classic Clogs Are Not Only The Most Comfortable Shoes For Women And Men But Also Easy To Clean Just Using Soap And Water And Allowing For A Quick Dry.
Lightweight And Fun: The Crocs For Men And Women Feature Lightweight Iconic Crocs Comfort. Ventilation Ports Add Breathability And Help Shed Water And Debris Quickly.
What Size Should I Buy?: These Men-S And Women-S Crocs Offer A Roomy Fit And We Recommend Ordering A Size Down To The Next Largest Whole Size.
Designed To Fit: These Slip-On Clogs Are Easy To Take On And Off, While Being Extremely Durable. These Crocs Even Offer Pivoting Heel Straps For A More Secure Fit.
Shop with Confidence: Crocs products are backed by our 90-day manufacturer-s warranty for high quality and authenticity. Terms and conditions apply"',
        4.8, 568427, 1136854, '84-1.jpg,84-2.jpg', '84.mp4', 'crocs-unisex-adult-classic-clogs', 6),


       (85, 'OshKosh Unisex-Child Hilda Sneaker', 40, 12, '"Toddler-s fashion eyelet sneakers in an easy slip-on style
Machine washable (yes, way!)
Speedy slip-on design
Eyelet material upper
Pretty knotted bow detail"', 4, 2, 4, '85-1.jpg,85-2.jpg,85-3.jpg', NULL, 'oshkosh-unisex-child-hilda-sneaker', 6),


       (86, 'Reef Women-s Bliss Nights Flip-Flop', 23, 67182, '"VEGAN LEATHER + RUBBER SOLE: The freshness of vegan leather paired with the comfort of the flexible sponge outsole keeps you on trend and your feet happy. The stylish design and versatility means you can seamlessly go from brunch to a walk on the beach.
ANIMAL FRIENDLY PRODUCT: Crafted with animal friendly alternative materials and 100% PCV free. Better for the environment and your feet!
NO BREAK-IN PERIOD: Packed with the comfort and support the soft EVA footbed, Bliss flip flops will keep your feet comfortable no matter where they take you.
AMAZING TRACTION: Packed with the superior comfort and traction of the flexible rubber outsole, you don’t have to worry about a little water bringing you down.
BEACH FREELY: REEF encourages people around the world to embrace the spirit of the beach while living by one simple rule: Beach Freely. Our products are designed to make you feel comfortable in any environment, whether you-re at the beach or not."',
        4.3, 11197, 22394, '86-1.jpg,86-2.jpg,86-3.jpg', NULL, 'reef-womens-bliss-nights-flip-flop', 6),


       (87, 'Bloch womens Eclipse Canvas Contemporary Ballet Shoe S0619l', 44, 8850, '"Soft canvas upper
Vamp cut hugs the foot without restricting movement
Silicone backing on elastic strap to prevent strap from slipping while on foot
Cotton terry lining under foot for comfort
Leather front outsole with traditional ballet shoe pleating for turning eas"', 4.6, 1475, 2950,
        '87-1.jpg,87-2.jpg,87-3.jpg', NULL, 'bloch-womens-eclipse-canvas-contemporary-ballet-shoe-s0619l', 6),


       (88, 'Bloch Women-s Jason Samuels Smith Ballet Flat', 220, 5226, '"TAP SPECIFIC : Our Shoe is specifically designed for tap dancers, with a focus on producing clear and precise sounds. The shoe is engineered to achieve maximum tap plate contact with the floor for a crisp sound.
SUPPORTIVE ARCH: The Jason Samuels Smith Dance Shoe features a supporting arch that helps to maintain proper foot alignment and reduce strain on the feet. This is important for preventing injuries and maintaining good form.
COMFORTABLE AND FLEXIBLE: The shoe has an absorbing stable heel that helps to reduce the impact on the feet and joints during high-impact dance routines. This feature is particularly important for tap dancers who perform routines with a lot of jumping and stomping.
DURABILITY: The shoe is made from high-quality leather that is durable and long-lasting to withstand frequent use. The leather also conforms to the foot for a comfortable and secure fit use, making them an excellent investment for those who want a reliable and stable Dance shoe
STYLISH and VERSATILE : The Jason Samuels Smith Dance Shoe for Women has a sleek and elegant design that is popular among serious dancers. The shoe is available in various colors and styles, making it easy for dancers to find one that suits their style and preferences."',
        4.7, 871, 1742, '88-1.jpg,88-2.jpg,88-3.jpg', NULL, 'reef-womens-bloch-womens-jason-samuels-smith-ballet-flat',
        6),


       (89, 'Capezio Women-s Cadence Oxford', 84, 1170, '"Women: Begin with street shoe size - 1/2 size up. Men: Begin 2 sizes up from street shoe size.
Soft leather upper, Leather sole
Tele Tone toe and heel taps, Polyester lining
Lightly padded footbed and collar for comfort, Strong toe box
Tapered heel, Scored rubber sole patch for traction"', 4.5, 195, 390, '89-1.jpg,89-2.jpg,89-3.jpg', NULL,
        'bloch-womens-jason-samuels-smith-ballet-flat', 6),


       (90, 'Capezio Girl-s Jr. Tyette Tap Shoe Dance', 57, 79866, '"PVC (black patent) and PU leather (caramel and white) uppers
Flexible outsole with foam padded footbed and Brushed lining is moisture absorbent.
Tele Tone toe and heel taps mounted on fiberboard, Scored rubber non-skid pad.
Achilles notch with padded collar for comfort, Eyerows are attached with elastic, Grosgrain ribbon tie
Light toe box, Lower vamp and sides and a Firm heel counter
Begin with street shoe size"', 4.7, 13311, 26622, '90-1.jpg,90-2.jpg,90-3.jpg', NULL,
        'capezio-girls-jr-tyette-tap-shoe-dance', 6)
go
delete
from Sale
where 1 = 1
go
INSERT INTO m2m_clothing.dbo.Sale (sale_Name, sale_Percent, sale_Start, sale_End)
VALUES (N'4/4', 20, N'2024-04-13', N'2024-04-14'),
       (N'5/5', 30, N'2024-04-17', N'2024-04-17')
go

-- update sale for product
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 28
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 5
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 24
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 1
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 14
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 37
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 36
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 33
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 32
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 10
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 13
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 39
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 25
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 27
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 29
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 20
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 18
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 23
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 21
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 9
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 22
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 8
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 38
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 11
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 7
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 16
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 26
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 30
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 35
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 3
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 15
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 12
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 4
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 19
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 17
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 2
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 31
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 1
WHERE product_id = 6
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 34
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 40
UPDATE m2m_clothing.dbo.Product
SET sale_ID = 2
WHERE product_id = 41

INSERT INTO Comment(comment, product_id, user_id, create_date)
VALUES (N'That shirt is so beautiful', 1, 1, N'2024-04-15'),
       (N'That is so great', 1, 3, N'2024-04-15'),
       (N'That is so great', 2, 1, N'2024-04-15'),
       (N'So beautiful', 2, 2, N'2024-04-15')


INSERT INTO Voucher (voucher_name, reduce, quantity, start_day, end_day)
VALUES (N'Spring flowering', 15, 15, '2024-03-01', '2024-07-31'),
       (N'Summer hot hot', 10, 15, '2024-06-01', '2024-08-30'),
       (N'Autumn chill chill', 20, 15, '2024-09-01', '2024-11-30'),
       (N'Winter on ice', 25, 15, '2024-12-01', '2025-02-28'),
       (N'Happy lunar new year', 30, 15, '2025-01-01', '2025-01-30');

INSERT INTO voucher_details
VALUES (1, 1),
       (2, 1),
       (3, 2),
       (4, 3),
       (5, 4)
select *
from [user] u
where u.id not in (select distinct v.user_id from voucher_details v where v.voucher_id = 1)









