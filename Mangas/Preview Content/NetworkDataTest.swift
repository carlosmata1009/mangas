//
//  DataInteractorTest.swift
//  Mangas
//
//  Created by Carlos Mata on 8/13/24.
//

import Foundation

class MockDataTest: NetworkProtocol{
  func getBestMangaList(page: Int?, per: Int?) async throws -> Items {
    Items(items: Items.itemsTest.items, metadata: Items.itemsTest.metadata)
  }
  
  func getGenreMangaList(page: Int?, per: Int?) async throws -> Items {
    Items(items: Items.itemsTest.items, metadata: Items.itemsTest.metadata)
  }
  
  func getThemeMangaList(page: Int?, per: Int?) async throws -> Items {
    Items(items: Items.itemsTest.items, metadata: Items.itemsTest.metadata)
  }
  
  func getDemographicMangaList(page: Int?, per: Int?) async throws -> Items {
    Items(items: Items.itemsTest.items, metadata: Items.itemsTest.metadata)
  }
  
  func getAuthorMangaList(page: Int?, per: Int?) async throws -> Items {
    Items(items: Items.itemsTest.items, metadata: Items.itemsTest.metadata)
  }
  
  func getMangaList(page: Int?, per: Int?) async throws -> Items {
    Items(items: Items.itemsTest.items, metadata: Items.itemsTest.metadata)
  }
  
  func getManga() async throws -> Manga{
    return Items.itemsTest.items.first!
  }
  
}
extension Items{
  static let itemsTest: Items = {
    
    let JSONTest = """
{
    "metadata": {
        "page": 1,
        "total": 64833,
        "per": 10
    },
    "items": [
        {
            "title": "Monster",
            "background": "Monster won the Grand Prize at the 3rd annual Tezuka Osamu Cultural Prize in 1999, as well as the 46th Shogakukan Manga Award in the General category in 2000. The series was published in English by VIZ Media under the VIZ Signature imprint from February 21, 2006 to December 16, 2008, and again in 2-in-1 omnibuses (subtitled The Perfect Edition) from July 15, 2014 to July 19, 2016. The manga was also published in Brazilian Portuguese by Panini Comics/Planet Manga from June 2012 to April 2015, in Polish by Hanami from March 2014 to February 2017, in Spain by Planeta Cómic from June 16, 2009 to September 21, 2010, and in Argentina by LARP Editores.",
            "genres": [
                {
                    "genre": "Award Winning",
                    "id": "4C13067F-96FF-4F14-A1C0-B33215F24E0B"
                },
                {
                    "genre": "Drama",
                    "id": "4312867C-1359-494A-AC46-BADFD2E1D4CD"
                },
                {
                    "genre": "Mystery",
                    "id": "97C8609D-856C-419E-A4ED-E13A5C292663"
                }
            ],
            "themes": [
                {
                    "id": "4394C99F-615B-494A-929E-356A342A95B8",
                    "theme": "Psychological"
                },
                {
                    "id": "840867E7-6C60-49CE-8C47-A99AA71A2113",
                    "theme": "Adult Cast"
                }
            ],
            "volumes": 18,
            "sypnosis": "Kenzou Tenma, a renowned Japanese neurosurgeon working in post-war Germany, faces a difficult choice: to operate on Johan Liebert, an orphan boy on the verge of death, or on the mayor of Düsseldorf. In the end, Tenma decides to gamble his reputation by saving Johan, effectively leaving the mayor for dead.As a consequence of his actions, hospital director Heinemann strips Tenma of his position, and Heinemann's daughter Eva breaks off their engagement. Disgraced and shunned by his colleagues, Tenma loses all hope of a successful career—that is, until the mysterious killing of Heinemann gives him another chance.Nine years later, Tenma is the head of the surgical department and close to becoming the director himself. Although all seems well for him at first, he soon becomes entangled in a chain of gruesome murders that have taken place throughout Germany. The culprit is a monster—the same one that Tenma saved on that fateful day nine years ago.[Written by MAL Rewrite]",
            "status": "finished",
            "url": "https://myanimelist.net/manga/1/Monster",
            "id": 1,
            "mainPicture": "https://cdn.myanimelist.net/images/manga/3/258224l.jpg",
            "demographics": [
                {
                    "id": "CE425E7E-C7CD-42DB-ADE3-1AB9AD16386D",
                    "demographic": "Seinen"
                }
            ],
            "score": 9.15,
            "authors": [
                {
                    "firstName": "Naoki",
                    "id": "54BE174C-2FE9-42C8-A842-85D291A6AEDD",
                    "lastName": "Urasawa",
                    "role": "Story & Art"
                }
            ],
            "titleEnglish": "Monster",
            "startDate": "1994-12-05T00:00:00Z",
            "titleJapanese": "MONSTER",
            "endDate": "2001-12-20T00:00:00Z",
            "chapters": 162
        },
        {
            "title": "Berserk",
            "background": "Berserk won the Award for Excellence at the sixth installment of Tezuka Osamu Cultural Prize in 2002. The series has over 50 million copies in print worldwide and has been published in English by Dark Horse since November 4, 2003. It is also published in Italy, Germany, Spain, France, Brazil, South Korea, Hong Kong, Taiwan, Thailand, Poland, México and Turkey. In May 2021, the author Kentaro Miura suddenly died at the age of 54. Chapter 364 of Berserk was published posthumously on September 10, 2021. Miura would often share details about the series' story with his childhood friend and fellow mangaka Kouji Mori. Berserk resumed on June 24, 2022, with Studio Gaga handling the art and Kouji Mori's supervision.",
            "genres": [
                {
                    "genre": "Action",
                    "id": "72C8E862-334F-4F00-B8EC-E1E4125BB7CD"
                },
                {
                    "genre": "Adventure",
                    "id": "BE70E289-D414-46A9-8F15-928EAFBC5A32"
                },
                {
                    "genre": "Award Winning",
                    "id": "4C13067F-96FF-4F14-A1C0-B33215F24E0B"
                },
                {
                    "genre": "Drama",
                    "id": "4312867C-1359-494A-AC46-BADFD2E1D4CD"
                },
                {
                    "genre": "Fantasy",
                    "id": "B3E8D4B2-7EE4-49CD-8DB0-9897619B3F62"
                },
                {
                    "genre": "Horror",
                    "id": "3B6A9037-3F61-4483-AD8A-E43365C5C953"
                },
                {
                    "genre": "Supernatural",
                    "id": "AE80120B-6659-4C0E-AEB2-227EC25EC4AF"
                }
            ],
            "themes": [
                {
                    "theme": "Gore",
                    "id": "82728A80-0DBE-4B64-A295-A25555A4A4A5"
                },
                {
                    "theme": "Military",
                    "id": "AD119CBB-2CCE-42FE-BD89-32D42C46462F"
                },
                {
                    "theme": "Mythology",
                    "id": "AD7A66B1-D066-4BC0-8AEE-7B97904F003A"
                },
                {
                    "theme": "Psychological",
                    "id": "4394C99F-615B-494A-929E-356A342A95B8"
                }
            ],
            "volumes": null,
            "sypnosis": "Guts, a former mercenary now known as the Black Swordsman is out for revenge. After a tumultuous childhood, he finally finds someone he respects and believes he can trust, only to have everything fall apart when this person takes away everything important to Guts for the purpose of fulfilling his own desires. Now marked for death, Guts becomes condemned to a fate in which he is relentlessly pursued by demonic beings.Setting out on a dreadful quest riddled with misfortune, Guts, armed with a massive sword and monstrous strength, will let nothing stop him, not even death itself, until he is finally able to take the head of the one who stripped him—and his loved one—of their humanity.[Written by MAL Rewrite] Included one-shot:Volume 14: Berserk: The Prototype",
            "status": "currently_publishing",
            "demographics": [
                {
                    "demographic": "Seinen",
                    "id": "CE425E7E-C7CD-42DB-ADE3-1AB9AD16386D"
                }
            ],
            "id": 2,
            "mainPicture": "https://cdn.myanimelist.net/images/manga/1/157897l.jpg",
            "url": "https://myanimelist.net/manga/2/Berserk",
            "score": 9.47,
            "authors": [
                {
                    "firstName": "Kentarou",
                    "lastName": "Miura",
                    "id": "6F0B6948-08C4-4761-8BE1-192E68AB0A2F",
                    "role": "Story & Art"
                },
                {
                    "firstName": "",
                    "lastName": "Studio Gaga",
                    "id": "0304C4E9-2D89-463A-8FDD-EEAB5B9D57B3",
                    "role": "Art"
                }
            ],
            "titleEnglish": "Berserk",
            "startDate": "1989-08-25T00:00:00Z",
            "titleJapanese": "ベルセルク",
            "endDate": null,
            "chapters": null
        },
        {
            "title": "20th Century Boys",
            "background": "20th Century Boys won the Kodansha Manga Award in the general category in 2001, an Excellence Prize at the Japan Media Arts Festival in 2002, and the Shogakukan Manga Award in the general category in 2003. The series' combined storyline won the Grand Prize at the 37th Japan Cartoonist Awards on May 9, 2008. VIZ Media published the series in English under the VIZ Signature imprint from February 17, 2009 to September 18, 2012. VIZ Media licensed the series in 2005; however, at Urasawa's request, it was rescheduled for release after Monster finished its English publication due to a change in art style over time. The series has also been published in Brazilian Portuguese by Panini Comics/Planet Manga since September 2012. The series was adapted into a trilogy of live-action films which released in Japan between August 30, 2008 and August 29, 2009.",
            "genres": [
                {
                    "genre": "Award Winning",
                    "id": "4C13067F-96FF-4F14-A1C0-B33215F24E0B"
                },
                {
                    "genre": "Drama",
                    "id": "4312867C-1359-494A-AC46-BADFD2E1D4CD"
                },
                {
                    "genre": "Mystery",
                    "id": "97C8609D-856C-419E-A4ED-E13A5C292663"
                },
                {
                    "genre": "Sci-Fi",
                    "id": "2DEDC015-82DA-4EF4-B983-F0F58C8F689E"
                }
            ],
            "themes": [
                {
                    "theme": "Psychological",
                    "id": "4394C99F-615B-494A-929E-356A342A95B8"
                },
                {
                    "theme": "Historical",
                    "id": "3CF0EDA7-5856-40F7-A0CF-EC676B4A842C"
                }
            ],
            "volumes": 22,
            "sypnosis": "As the 20th century approaches its end, people all over the world are anxious that the world is changing. And probably not for the better.Kenji Endo is a normal convenience store manager who's just trying to get by. But when he learns that one of his old friends going by the name Donkey has suddenly committed suicide, and that a new cult led by a figure known as Friend is becoming more notorious, Kenji starts to feel that something isn't right. With a few key clues left behind by his deceased friend, Kenji realizes that this cult is much more than he ever thought it would be—not only is this mysterious organization directly targeting him and his childhood friends, but the whole world also faces a grave danger that only the friends have the key to stop.Kenji's simple life of barely making ends meet is flipped upside down when he reunites with his childhood friends, and together they must figure out the truth of how their past is connected to the cult, as the turn of the century could mean the possible end of the world.[Written by MAL Rewrite]",
            "status": "finished",
            "demographics": [
                {
                    "demographic": "Seinen",
                    "id": "CE425E7E-C7CD-42DB-ADE3-1AB9AD16386D"
                }
            ],
            "id": 3,
            "mainPicture": "https://cdn.myanimelist.net/images/manga/5/260006l.jpg",
            "url": "https://myanimelist.net/manga/3/20th_Century_Boys",
            "score": 8.95,
            "authors": [
                {
                    "role": "Story & Art",
                    "lastName": "Urasawa",
                    "firstName": "Naoki",
                    "id": "54BE174C-2FE9-42C8-A842-85D291A6AEDD"
                }
            ],
            "titleEnglish": "20th Century Boys",
            "startDate": "1999-09-27T00:00:00Z",
            "titleJapanese": "20世紀少年",
            "endDate": "2006-04-24T00:00:00Z",
            "chapters": 249
        },
        {
            "title": "Yokohama Kaidashi Kikou",
            "background": "Three drama CDs were released in 2002. In all three, Alpha is voiced by Hekiru Shiina and Kokone by Akiko Nakagawa. Both of whom voiced the same characters in the two OVA series. A novel based on Yokohama Kaidashi Kikou called Yokohama Kaidashi Kikou Novel: Seeing, Walking, Being Glad, written by Teriha Katsuki, was published by Kodansha on 23 October 2008. Set long after the conclusion of the manga series, it tells the story of a boy robot named Omega and his search for the legendary Cafe Alpha. (Source: Wikipedia) In 2007, the series won the Seiun Award for Best Manga. Yokohama Kaidashi Kikou has been published in English by Seven Seas Entertainment as omnibus volumes since August 9, 2022.",
            "genres": [
                {
                    "id": "4C13067F-96FF-4F14-A1C0-B33215F24E0B",
                    "genre": "Award Winning"
                },
                {
                    "id": "4312867C-1359-494A-AC46-BADFD2E1D4CD",
                    "genre": "Drama"
                },
                {
                    "id": "2DEDC015-82DA-4EF4-B983-F0F58C8F689E",
                    "genre": "Sci-Fi"
                },
                {
                    "id": "536445E3-CEF5-49F7-B22B-6CD9807F0744",
                    "genre": "Slice of Life"
                }
            ],
            "themes": [
                {
                    "id": "263559F4-574F-4BA8-8840-2AEB445CD6BD",
                    "theme": "Iyashikei"
                }
            ],
            "volumes": 14,
            "sypnosis": "In a post-apocalyptic world where an environmental disaster led to the eruption of Mt. Fuji and the inundation of Yokohama, the age of humans is in its twilight. Alpha Hatsuseno is an android and the namesake of a small cafe outside Yokohama. As her owner is away on a trip indefinitely, she has been left responsible for running the cafe. Although she rarely gets any customers, Alpha remains outgoing and cheerful.While Alpha awaits her owner's homecoming, she explores the vicinity with her scooter and camera. Throughout her journeys, she meets new people and other androids, making memories along the way.Yokohama Kaidashi Kikou is a beautiful, laid-back story centered around Alpha's daily activities, emphasizing the passing of time in everyday life.[Written by MAL Rewrite]",
            "status": "finished",
            "url": "https://myanimelist.net/manga/4/Yokohama_Kaidashi_Kikou",
            "id": 4,
            "mainPicture": "https://cdn.myanimelist.net/images/manga/1/171813l.jpg",
            "demographics": [
                {
                    "id": "CE425E7E-C7CD-42DB-ADE3-1AB9AD16386D",
                    "demographic": "Seinen"
                }
            ],
            "score": 8.68,
            "authors": [
                {
                    "id": "EC4982FD-4793-4A1A-B956-D2E57895BB57",
                    "firstName": "Hitoshi",
                    "lastName": "Ashinano",
                    "role": "Story & Art"
                }
            ],
            "titleEnglish": "Yokohama Kaidashi Kikou",
            "startDate": "1994-04-25T00:00:00Z",
            "titleJapanese": "ヨコハマ買い出し紀行",
            "endDate": "2006-02-25T00:00:00Z",
            "chapters": 142
        },
        {
            "title": "Hajime no Ippo",
            "background": "Hajime no Ippo has sold over 94 million copies as of October 2013 and won the 15th Kodansha Manga Award for Best Shounen Manga in 1991.",
            "genres": [
                {
                    "id": "4C13067F-96FF-4F14-A1C0-B33215F24E0B",
                    "genre": "Award Winning"
                },
                {
                    "id": "914A2BD5-5A1F-4D6F-9EA5-A839D5A8176B",
                    "genre": "Sports"
                }
            ],
            "themes": [
                {
                    "id": "C7019504-0497-4EAE-A9A7-F5ACF7C9B0EA",
                    "theme": "Combat Sports"
                }
            ],
            "volumes": null,
            "sypnosis": "Makunouchi Ippo is a 16-year-old high school student who helps his mother run the family business. His hefty workload impedes on his social life, making him an easy target for bullies. One day, while being beaten up by a group of high school students, Ippo is saved by a boxer named Mamoru Takamura, and is brought to the Kamogawa Boxing Gym. This afterschool bullying session turns his life around for the better as Ippo discovers his latent talent for boxing and decides to practice the sport professionally. However, Mamoru doubts Ippo's determination and assigns him a task deemed impossible to complete, but the resolute Ippo trains tirelessly to fulfill his mission. Along the way, he finds out what it means to attain true strength while making new friends and fighting formidable foes.[Written by MAL Rewrite]",
            "status": "currently_publishing",
            "url": "https://myanimelist.net/manga/7/Hajime_no_Ippo",
            "id": 7,
            "mainPicture": "https://cdn.myanimelist.net/images/manga/2/250313l.jpg",
            "demographics": [
                {
                    "id": "5E05BBF1-A72E-4231-9487-71CFE508F9F9",
                    "demographic": "Shounen"
                }
            ],
            "score": 8.71,
            "authors": [
                {
                    "id": "E6BFD854-D51D-46AB-8506-6AA58D719DFC",
                    "firstName": "George",
                    "role": "Story & Art",
                    "lastName": "Morikawa"
                }
            ],
            "titleEnglish": null,
            "startDate": "1989-09-27T00:00:00Z",
            "titleJapanese": "はじめの一歩",
            "endDate": null,
            "chapters": null
        },
        {
            "title": "Full Moon wo Sagashite",
            "background": "Full Moon wo Sagashite was published in English by VIZ Media under the Shojo Beat imprint from July 5, 2005 to October 3, 2006; and in Spanish by Glénat from October 2006 to April 2007.",
            "genres": [
                {
                    "genre": "Comedy",
                    "id": "F974BCB6-B002-44A6-A224-90D1E50595A2"
                },
                {
                    "genre": "Drama",
                    "id": "4312867C-1359-494A-AC46-BADFD2E1D4CD"
                },
                {
                    "genre": "Fantasy",
                    "id": "B3E8D4B2-7EE4-49CD-8DB0-9897619B3F62"
                },
                {
                    "genre": "Romance",
                    "id": "D8E1E0A9-DDC2-4520-BED7-745DD8DAD076"
                },
                {
                    "genre": "Supernatural",
                    "id": "AE80120B-6659-4C0E-AEB2-227EC25EC4AF"
                }
            ],
            "themes": [
                {
                    "theme": "Showbiz",
                    "id": "7F64CF82-6EE6-4F14-9DE2-FD6322B9798E"
                },
                {
                    "theme": "Music",
                    "id": "2BA6A0CA-AB07-480F-942D-68061E786565"
                }
            ],
            "volumes": 7,
            "sypnosis": "At the tender age of twelve, Mitsuki Kouyama has a sarcoma in her throat. Though this rare cancer can be cured by removing her vocal cords, Mitsuki refuses because of her desire to become a pop singer and keep her childhood promise to Eichi Sakurai, her first love who left for America. Unable to both heal and keep her voice, she allows her health to deteriorate as she accepts her tragic fate.One day, while escaping the home of her music-hating grandmother to attend an audition, Mitsuki meets two shinigami Takuto Kira and Meroko Yui. Realizing that Mitsuki can see them, Takuto and Meroko reveal to her that she will die in a year. Moved by her plight, Takuto allows Mitsuki the chance to pursue her dream by giving her the ability to transform into a healthy sixteen-year-old girl. After being chosen for a contract with Seed Records, Mitsuki makes her debut under the stage name Full Moon and chooses to pursue her dream music career before her life's end.[Written by MAL Rewrite]Included one-shot: Volume 2: Ginyuu Meika",
            "status": "finished",
            "demographics": [
                {
                    "id": "C217B404-7691-4090-9775-9E63375EBF5B",
                    "demographic": "Shoujo"
                }
            ],
            "id": 8,
            "url": "https://myanimelist.net/manga/8/Full_Moon_wo_Sagashite",
            "mainPicture": "https://cdn.myanimelist.net/images/manga/3/175970l.jpg",
            "score": 8.04,
            "authors": [
                {
                    "firstName": "Arina",
                    "id": "DC4661A0-C3B1-4975-8A60-5F3D7059140C",
                    "lastName": "Tanemura",
                    "role": "Story & Art"
                }
            ],
            "titleEnglish": "Full Moon wo Sagashite",
            "startDate": "2001-12-01T00:00:00Z",
            "titleJapanese": "満月〈フルムーン〉をさがして",
            "endDate": "2004-04-30T00:00:00Z",
            "chapters": 35
        },
        {
            "title": "Tsubasa: RESERVoir CHRoNiCLE",
            "background": "Tsubasa: RESERVoir CHRoNiCLE was published in English by Del Rey from April 27, 2004 to November 23, 2010. Kodansha Comics USA republished the series in 10 omnibuses from August 19, 2014 to October 18, 2016.",
            "genres": [
                {
                    "genre": "Action",
                    "id": "72C8E862-334F-4F00-B8EC-E1E4125BB7CD"
                },
                {
                    "genre": "Adventure",
                    "id": "BE70E289-D414-46A9-8F15-928EAFBC5A32"
                },
                {
                    "genre": "Drama",
                    "id": "4312867C-1359-494A-AC46-BADFD2E1D4CD"
                },
                {
                    "genre": "Fantasy",
                    "id": "B3E8D4B2-7EE4-49CD-8DB0-9897619B3F62"
                }
            ],
            "themes": [],
            "volumes": 28,
            "sypnosis": "Warmhearted Syaoran has always been friends with Sakura—the princess of the Clow Kingdom who holds an extraordinary power capable of changing the world. When a mysterious man attempts to monopolize Sakura's ability, her memories scatter throughout different worlds in the form of feathers. To save Sakura, Syaoran seeks help from the Dimensional Witch and meets two other travelers—Kurogane and Fai D. Flourite.Kurogane, a capable fighter and ninja, has been banished from his homeworld and wishes to return. In contrast, Fai, a magician from Celes, wants to traverse different worlds to avoid his home and past. As the price to cross dimensions, each of the three must sacrifice their most valued possession. For Sakura's sake, Syaoran agrees to give away their relationship as payment to the Dimensional Witch. And with firm determination, Syaoran, Kurogane, and Fai begin journeying through numerous worlds to fight against their ill-fated destinies.[Written by MAL Rewrite]",
            "status": "finished",
            "demographics": [
                {
                    "demographic": "Shounen",
                    "id": "5E05BBF1-A72E-4231-9487-71CFE508F9F9"
                }
            ],
            "url": "https://myanimelist.net/manga/9/Tsubasa__RESERVoir_CHRoNiCLE",
            "mainPicture": "https://cdn.myanimelist.net/images/manga/1/272410l.jpg",
            "id": 9,
            "score": 8.3,
            "authors": [
                {
                    "lastName": "CLAMP",
                    "role": "Story & Art",
                    "firstName": "",
                    "id": "425F1E1E-5163-48D6-8F39-C56BDE69ED99"
                }
            ],
            "titleEnglish": "Tsubasa: RESERVoir CHRoNiCLE",
            "startDate": "2003-05-21T00:00:00Z",
            "titleJapanese": "ツバサ -RESERVoir CHRoNiCLE-",
            "endDate": "2009-10-07T00:00:00Z",
            "chapters": 233
        },
        {
            "title": "xxxHOLiC",
            "background": "xxxHOLiC was previously serialized in Young Magazine, but moved to in June 2010. The series was released in English by the now defunct Del Rey from April 27, 2004 to February 21, 2012. Kodansha Comics USA has republished the series in an omnibus edition from March 18, 2014 to September 8, 2015 the final two volumes were 2-in-1, while the previous were all 3-in-1. It was also published in Spanish by Norma Editorial from July 2004 to October 2011.",
            "genres": [
                {
                    "genre": "Comedy",
                    "id": "F974BCB6-B002-44A6-A224-90D1E50595A2"
                },
                {
                    "genre": "Drama",
                    "id": "4312867C-1359-494A-AC46-BADFD2E1D4CD"
                },
                {
                    "genre": "Mystery",
                    "id": "97C8609D-856C-419E-A4ED-E13A5C292663"
                },
                {
                    "genre": "Supernatural",
                    "id": "AE80120B-6659-4C0E-AEB2-227EC25EC4AF"
                }
            ],
            "themes": [],
            "volumes": 19,
            "sypnosis": "Living alone after his parents passed away, Kimihiro Watanuki is a high school student who can see otherworldly creatures that are attracted to him. His days are plagued by these nuisances, and he wishes to rid himself of this inconvenience. One fateful day, as Kimihiro is being chased by a horde of spirits, his feet bring him into a mysterious store to seek shelter. Here he meets Yuuko Ichihara, the mistress of this supposed store, who claims to be able to grant wishes. Yuuko offers to grant Kimihiro's, as long as he pays an appropriate price.Thus begins Kimihiro's time working in her store to earn the payment necessary for his wish. In Yuuko's employ, he must become further involved with spirits and the supernatural before he can leave that world behind. How will he fare in the inexplicable encounters that await him? [Written by MAL Rewrite]",
            "status": "finished",
            "url": "https://myanimelist.net/manga/10/xxxHOLiC",
            "id": 10,
            "mainPicture": "https://cdn.myanimelist.net/images/manga/3/217533l.jpg",
            "demographics": [
                {
                    "demographic": "Seinen",
                    "id": "CE425E7E-C7CD-42DB-ADE3-1AB9AD16386D"
                }
            ],
            "score": 8.38,
            "authors": [
                {
                    "role": "Story & Art",
                    "firstName": "",
                    "lastName": "CLAMP",
                    "id": "425F1E1E-5163-48D6-8F39-C56BDE69ED99"
                }
            ],
            "titleEnglish": "xxxHOLiC",
            "startDate": "2003-02-24T00:00:00Z",
            "titleJapanese": "xxxHOLiC",
            "endDate": "2011-02-09T00:00:00Z",
            "chapters": 213
        },
        {
            "title": "Naruto",
            "background": "Naruto has sold over 250 million copies worldwide as of 2020, making it the 4th highest grossing manga series of all time. It was nominated for the 19th Tezuka Osamu Cultural Prize in 2014, and in the same year Masashi Kishimoto was awarded Rookie of the Year in the media fine arts category by Japan's Agency for Cultural Affairs. Numerous databooks, artbooks, novels, and fanbooks on the series have been released. Eight summary volumes featuring unaltered color pages, larger dimensions, and exclusive interviews, covering the first part of the series were released between November 7, 2008 and April 10, 2009. The series was published in English by VIZ Media under the Shonen Jump imprint from August 16, 2003 to October 6, 2015. In the last four months of 2007, the campaign titled Naruto Nation was launched, in which three volumes were published each month so that US releases would be closer to Japan's, the same practice was done in February through April of 2009 this time titled Generation Ninja. A 3-in-1 omnibus edition was also published from May 3, 2011 to October 2, 2018. A box set containing volumes 1-27 was released on August 6, 2008, another one containing volumes 28-48 on July 7, 2015, and the final box set with volumes 49-72 on January 5, 2016. It was also published in Brazilian Portuguese by Panini Comics/Planet Manga from May 2007 to June 2015, and again as Naruto Gold edition since July 2015.",
            "genres": [
                {
                    "genre": "Action",
                    "id": "72C8E862-334F-4F00-B8EC-E1E4125BB7CD"
                },
                {
                    "genre": "Adventure",
                    "id": "BE70E289-D414-46A9-8F15-928EAFBC5A32"
                },
                {
                    "genre": "Fantasy",
                    "id": "B3E8D4B2-7EE4-49CD-8DB0-9897619B3F62"
                }
            ],
            "themes": [
                {
                    "theme": "Martial Arts",
                    "id": "ADC7CBC8-36B9-4E52-924A-4272B7B2CB2C"
                }
            ],
            "volumes": 72,
            "sypnosis": "Whenever Naruto Uzumaki proclaims that he will someday become the Hokage—a title bestowed upon the best ninja in the Village Hidden in the Leaves—no one takes him seriously. Since birth, Naruto has been shunned and ridiculed by his fellow villagers. But their contempt isn't because Naruto is loud-mouthed, mischievous, or because of his ineptitude in the ninja arts, but because there is a demon inside him. Prior to Naruto's birth, the powerful and deadly Nine-Tailed Fox attacked the village. In order to stop the rampage, the Fourth Hokage sacrificed his life to seal the demon inside the body of the newborn Naruto.And so when he is assigned to Team 7—along with his new teammates Sasuke Uchiha and Sakura Haruno, under the mentorship of veteran ninja Kakashi Hatake—Naruto is forced to work together with other people for the first time in his life. Through undergoing vigorous training and taking on challenging missions, Naruto must learn what it means to work in a team and carve his own route toward becoming a full-fledged ninja recognized by his village.[Written by MAL Rewrite]",
            "status": "finished",
            "url": "https://myanimelist.net/manga/11/Naruto",
            "id": 11,
            "mainPicture": "https://cdn.myanimelist.net/images/manga/3/249658l.jpg",
            "demographics": [
                {
                    "demographic": "Shounen",
                    "id": "5E05BBF1-A72E-4231-9487-71CFE508F9F9"
                }
            ],
            "score": 8.07,
            "authors": [
                {
                    "firstName": "Masashi",
                    "lastName": "Kishimoto",
                    "id": "AC7020D1-D99F-4846-8E23-9C86181959AF",
                    "role": "Story & Art"
                }
            ],
            "titleEnglish": "Naruto",
            "startDate": "1999-09-21T00:00:00Z",
            "titleJapanese": "NARUTO―ナルト―",
            "endDate": "2014-11-10T00:00:00Z",
            "chapters": 700
        },
        {
            "title": "Bleach",
            "background": "Bleach has sold over 130 million copies worldwide as of 2022, making it one of the top 20 best selling manga series of all-time; North American sales have also been significant with 1.7 million copies sold in the region. In 2005, the series won the 50th Shogakukan Manga Award in the shounen demographic category. Many adaptations have also been made of the series, with a 2004 television anime series along with four feature length films, numerous video games, spin-off light novels, databooks, and even a musical. The series was published in English by VIZ Media under the Shonen Jump imprint from July 6, 2004 to October 2, 2018, and as omnibus volumes from June 7, 2011 to March 5, 2019; a hardcover collector's edition for volume one was released by VIZ Media on August 5, 2008, a box set of volumes 1-21 was released on September 16, 2008 as well as volumes 22-48 on July 7, 2015, and the final box set containing volumes 49-72 on November 6, 2018. It has also been published in Portuguese (Brazil) by Panini Comics and Planet Manga since July 2007, and in Spanish by Glénat/EDT since June 2006, publishing 51 volumes before the publisher went defunct, and later was republished by Panini Comics from February 2013 to November 2017. Bleach was adapted into a live-action movie on July 20, 2018.",
            "genres": [
                {
                    "genre": "Action",
                    "id": "72C8E862-334F-4F00-B8EC-E1E4125BB7CD"
                },
                {
                    "genre": "Adventure",
                    "id": "BE70E289-D414-46A9-8F15-928EAFBC5A32"
                },
                {
                    "genre": "Award Winning",
                    "id": "4C13067F-96FF-4F14-A1C0-B33215F24E0B"
                },
                {
                    "genre": "Fantasy",
                    "id": "B3E8D4B2-7EE4-49CD-8DB0-9897619B3F62"
                }
            ],
            "themes": [],
            "volumes": 74,
            "sypnosis": "For as long as he can remember, high school student Ichigo Kurosaki has been able to see the spirits of the dead, but that has not stopped him from leading an ordinary life. One day, Ichigo returns home to find an intruder in his room who introduces herself as Rukia Kuchiki, a Soul Reaper tasked with helping souls pass over. Suddenly, the two are jolted from their conversation when a Hollow—an evil spirit known for consuming souls—attacks. As Ichigo makes a brash attempt to stop the Hollow, Rukia steps in and shields him from a counterattack. Injured and unable to keep fighting, Rukia suggests a risky plan—transfer half of her Soul Reaper powers to Ichigo. He accepts and, to Rukia's surprise, ends up absorbing her powers entirely, allowing him to easily dispatch the Hollow.Now a Soul Reaper himself, Ichigo must take up Rukia's duties of exterminating Hollows and protecting spirits, both living and dead. Along with his friends Orihime Inoue and Yasutora Sado—who later discover spiritual abilities of their own—Ichigo soon learns that the consequences of becoming a Soul Reaper and dealing with the world of spirits are far greater than he ever imagined.[Written by MAL Rewrite]",
            "status": "finished",
            "url": "https://myanimelist.net/manga/12/Bleach",
            "id": 12,
            "mainPicture": "https://cdn.myanimelist.net/images/manga/3/180031l.jpg",
            "demographics": [
                {
                    "demographic": "Shounen",
                    "id": "5E05BBF1-A72E-4231-9487-71CFE508F9F9"
                }
            ],
            "score": 7.84,
            "authors": [
                {
                    "role": "Story & Art",
                    "lastName": "Kubo",
                    "id": "76576CBC-75F3-456C-BD8C-CDB65D47E482",
                    "firstName": "Tite"
                }
            ],
            "titleEnglish": "Bleach",
            "startDate": "2001-08-07T00:00:00Z",
            "titleJapanese": "BLEACH",
            "endDate": "2016-08-22T00:00:00Z",
            "chapters": 705
        }
    ]
}
"""
    
    let decoder = JSONDecoder()

    do {
      let items = try decoder.decode(Items.self, from: JSONTest.data(using: .utf8)!)
        return items
    } catch {
        fatalError("Failed to decode JSON: \(error)")
    }
}()
}
