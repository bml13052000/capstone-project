import 'package:flutter/material.dart';

class Place {
  final int id;
  final String name;
  final String description;
  final String location;
  final String image;
  final double rating;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.image,
    required this.rating,
  });
}

// demo places

List<Place> demoPlaces = [
  Place(
      id: 1,
      name: 'Bangalore Palace',
      description:
          "An epitome of great architecture and beauty, The Majestic Bangalore Palace "
          "preserves in it the spice of old regal opulence. Currently the central attraction in Bangalore, "
          "the palace was built in the year 1878. Chamarajendra Wadiyar's British Guardians bought the "
          "original property in 1873 from the principal of Bangalore Central High School, Rev, J Garret, "
          "from his funds. The palace is extraordinarily vast and spread across 45,000 square feet. A mixture "
          "of Tudor and Scottish Gothic architecture have resulted into the grand palace that we see today. "
          "The wooden structure of the palace along with the beautiful carvings both inside and outside "
          "showcases the royal culture in different ways.",
      location: 'Bengaluru, Karnataka',
      image: 'assets/bangalore_palace.jpg',
      rating: 4),
  Place(
      id: 2,
      name: 'Nandi Hills',
      description:
          "Located around 60 kilometres away from Bangalore, Nandi Hills is one such tourist "
          "spot that has gradually been discovered by visitors over the years and has now become a well-known "
          "weekend getaway. Featuring beautifully carved arches and majestic pillars with intricately "
          "painted walls and ceilings, Nandi Hills is scattered with shrines and monument and is surrounded "
          "by mesmerizing views, making this place no less than a hidden paradise.  Situated at a height of "
          "4851 feet above sea level, you can see a convoy of weekenders from Bangalore during early hours "
          "catching the glimpse of sunrise.",
      location: 'Bengaluru, Karnataka',
      image: 'assets/nandi_hills.jpg',
      rating: 3),
  Place(
      id: 3,
      name: 'Lal Bagh',
      description:
          "Lalbagh Botanical Garden is located in Bangalore and is nationally and "
          "internationally renowned centre for botanical artwork, scientific study of plants and "
          "also conservation of plants. A haven for all nature lovers, Lal Bagh covers an area 240 "
          "acres in the heart of the city and has nearly 1,854 species of plants. It was commissioned "
          "by Hyder Ali in 1760 and completed by his son Tipu Sultan. The garden features rare plants of "
          "French, Persian and Afghani origin and has attained the status of a Government Botanical Garden. "
          "The Lal Bagh Rock which is over 3000 million years old is found here and is a major tourist "
          "attraction. ",
      location: 'Bengaluru, Karnataka',
      image: 'assets/lalbagh.jpg',
      rating: 5),
  Place(
      id: 4,
      name: 'Tipu Sultan Palace',
      description:
          "Located at the juncture of Albert Victor Road and Krishna Rajendra, is the "
          "magnificent accommodation of the valiant ruler of Mysore- Tipu Sultan. The palace is located "
          "in the Bangalore Fort which is situated in old Bangalore in the south-west Indian state of "
          "Karnataka. An exquisite example of Indo- Islamic architecture, the opulent palace was once used "
          "as a summer retreat by the king and was often referred to as the 'Abode of Happiness' and 'Rash "
          "e Jannat' meaning 'Envy of Heaven'. Amongst one of the most noteworthy creations of the ancient "
          "times, the palace boasts of ornamental frescoes, magnificent arches, protruding balconies and "
          "brilliant motifs. One can take a good leisurely stroll across the balconies before entering the "
          "palace. One is bound to get a glimpse into the royal lifestyle of Tipu Sultan as they explore the "
          "palace.",
      location: 'Bengaluru, Karnataka',
      image: 'assets/tipu_sultan.jpg',
      rating: 4),
  Place(
      id: 5,
      name: 'ISKCON Temple',
      description:
          "Located in the Rajajinagar area, ISKCON Temple is a revered shrine dedicated to "
          "Lord Krishna. The temple, under the guidance of Madhu Pandit Dasa, was inaugurated in the year "
          "1997 by Shankar Dayal Sharma. Apart from a religious shrine, ISKCON temple is a cultural complex "
          "accommodating dedicated deities of Sri Sri Radha Krishnachandra, Sri Sri Krishna Balarama, Sri Sri "
          "Nitai Gauranga, Sri Srinivasa Govinda and Sri Prahlada Narasimha. ISKCON Temple is known for its "
          "activities of engagement involving ardent devotees of Lord Krishna. The temple enrols members "
          "for life and arranges programs in their community centres for Krishna consciousness and awareness "
          "of the Lord. The temple community also organises songs and recitals admiring and praying to Krishna "
          "in public processions. ",
      location: 'Bengaluru, Karnataka',
      image: 'assets/isckon_temple.jpg',
      rating: 8),
  Place(
      id: 6,
      name: 'Vidhana Soudha',
      description:
          "Described by Pandit Jawaharlal Nehru as 'a temple dedicated to the nation', "
          "Vidhana Soudha houses the State Legislature and the Secretariat of Karnataka and is one of "
          "the most popular attractions in the lively and colourful city of Bengaluru. It also proudly "
          "boasts the title of being the largest state legislative building in the country. With four "
          "entrances in all four directions and four floors above the ground level and one below it, we "
          "surely don't doubt the title. Popularly known as the 'Taj Mahal of South India', it is counted "
          "as one of the most magnificent buildings in the city and is sure to impress the onlooker with its "
          "sophisticated poise and glorified grandiose. The entire monument is illuminated on Sundays and "
          "public holidays and is a sight for sore eyes.",
      location: 'Bengaluru, Karnataka',
      image: 'assets/vidhana_soudha.jpg',
      rating: 9),
  Place(
      id: 7,
      name: 'Cubbon Park',
      description:
          "Spread over an area of 300 acres, Cubbon Park in the city of Bangalore is a "
          "major sightseeing attraction rich in green foliage. It is a green belt region of the city and "
          "is an ideal place for nature lovers and those seeking a calm atmosphere. Having been laid down "
          "by Lord Cubbon, the park is named so in his honour. It is home to more than 6,000 trees that "
          "support a vibrant ecosystem. In addition to being a natural sightseeing destination, some of "
          "the major structures of the city such as the Attara Kacheri, Cubbon Park Museum and Sheshadri "
          "Iyer Memorial Park are also situated here. Another famous attraction in the Cubbon Park is The "
          "Bangalore Aquarium, which is the second largest aquarium in India.",
      location: 'Bengaluru, Karnataka',
      image: 'assets/cubbon_park.jpg',
      rating: 5),
  Place(
      id: 8,
      name: 'Visvesvaraya Museum',
      description:
          "Located on the Kasthurba Road in Bangalore, Visvesvaraya Industrial and "
          "Technological Museum was built in the honour of Bharat Ratna recipient Sir M Visvesvaraya. "
          "Spread over an area of 43000 sq. ft., the area is built in the sylvan surroundings of Cubbon "
          "Park and was inaugurated by the first Prime Minister of India- Pandit Jawaharlal Nehru, in 1962. "
          "The first ever gallery exhibition displayed by the museum was based on the principles of Electricity"
          "and was open to public visit on the 27th of July, 1965. Designed on the theme of a Science Museum, "
          "the museum houses four floors dedicated to a scientific discipline each, with the topmost floor "
          "converted into a food court. The outstanding deco of the depository has been inspired by the "
          "ancient scientific tools and machinery like Wright Brothers' Kitty Hawk, flying Stimulator and "
          "other similar objects. The backdrop shows surreal pictures and animations of changing the climate, "
          "various sea and land dynamics and different planetary positions.",
      location: 'Bengaluru, Karnataka',
      image: 'assets/visvesvaraya_museum.jpg',
      rating: 7),
  Place(
      id: 9,
      name: 'Venkatappa Art Gallery',
      description:
          "Located in the premises of Karnataka Government Museum, Venkatappa Art Gallery "
          "situated on Kasturba Road, Cubbon Park flaunts over 600 paintings. Named after the most famous "
          "artist of Bangalore city - K. Venkatappa, the gallery houses resplendent works of the namesake "
          "painter and other renowned artists as well. Sprawling over a vast area, the two-storeyed museum "
          "is further divided in different galleries some of which display antiques from the Indus Valley "
          "Civilization, paintings from the Hoysala, Gandhara and Nolamba periods, exquisite wood carvings, "
          "phenomenally carved sculptures, specimens of geology and art, ancient musical instruments and the "
          "like. Some of the rare artworks displayed are dated back to 2000 BC. Venkatappa Art Gallery is an "
          "insight into the glorious past with its umpteen exhibits and displays. The first floor of the "
          "museum houses incredible works of Venkatappa himself which include the very famous painting of the "
          "Ooty sunrise, the dazzling Nilgiri hills, a scenic Church Hill view etc.",
      location: 'Bengaluru, Karnataka',
      image: 'assets/venkatappa_art.jpg',
      rating: 7),
  Place(
      id: 10,
      name: 'Sankey Tank',
      description:
          "Sankey Tank is a manmade lake, spread across an area of 37.5 acres near Vyalikaval, "
          "Malleshwaram and Sadashivanagar. The State Forest Department takes care of the lake. The Maurya "
          "Sankey Boat Club offers guests a wide variety of boat rides, for example, rowboats, pedal boats "
          "and motorboats. One can enjoy boating and drop to and from the island which is situated in the "
          "middle of the lake at minimum charges. This boat club is overseen by KSTDC. This artificial tank "
          "was built in the year 1882 under the administration of Colonel Richard Hieram Sankey of the Madras "
          "Sappers Regiment. This tank was built in order to cater the water supply demands throughout "
          "Bangalore City at that time. It was also called Gandhadhakotikere at that time as the Government "
          "Sandalwood Depot was situated near it.",
      location: 'Bengaluru, Karnataka',
      image: 'assets/sankey_tank.jpg',
      rating: 7),
];
