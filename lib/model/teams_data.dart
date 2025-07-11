import 'dart:ui';

final List<Map<String, dynamic>> teams = [
  {
    'name': 'Red Bull Racing',
    'fullName': 'Oracle Red Bull Racing',
    'teamColor': Color(0xFF1E41FF),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/redbullracing/2025redbullracinglogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/redbullracing/2025redbullracingcarright.webp',
    'drivers': [
      {
        'name': 'Max Verstappen',
        'number': 1,
        'country': 'https://flagcdn.com/w40/nl.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/redbullracing/maxver01/2025redbullracingmaxver01right.webp',
      },
      {
        'name': 'Yuki Tsunoda',
        'number': 22,
        'country': 'https://flagcdn.com/w40/jp.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/redbullracing/yuktsu01/2025redbullracingyuktsu01right.webp',
      },
    ],
    'base': 'Milton Keynes, United Kingdom',
    'teamChief': 'Laurent Mekies',
    'technicalChief': 'Pierre Waché',
    'chassis': 'RB21',
    'powerUnit': 'Honda RBPT',
    'firstTeamEntry': '1997',
    'worldChampionships': 6,
    'polePositions': 107,
    'fastestLaps': 98,
    'description':
        'Red Bull Racing has been a dominant force in Formula 1 for over a decade, known for their aggressive design philosophy and strong driver pairings. Under the leadership of Christian Horner and the technical brilliance of their design team, they have secured multiple World Constructors\' and Drivers\' Championships.',
  },
  {
    'name': 'Ferrari',
    'fullName': 'Scuderia Ferrari',
    'teamColor': Color(0xFFDC143C),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/ferrari/2025ferrarilogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/ferrari/2025ferraricarright.webp',
    'drivers': [
      {
        'name': 'Charles Leclerc',
        'number': 16,
        'country': 'https://flagcdn.com/w40/mc.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/ferrari/chalec01/2025ferrarichalec01right.webp',
      },
      {
        'name': 'Lewis Hamilton',
        'number': 44,
        'country': 'https://flagcdn.com/w40/gb.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/ferrari/lewham01/2025ferrarilewham01right.webp',
      },
    ],
    'base': 'Maranello, Italy',
    'teamChief': 'Frédéric Vasseur',
    'technicalChief': 'Loic Serra / Enrico Gualtieri',
    'chassis': 'SF-25',
    'powerUnit': 'Ferrari',
    'firstTeamEntry': '1950',
    'worldChampionships': 16,
    'polePositions': 253,
    'fastestLaps': 260,
    'description':
        'Scuderia Ferrari is the oldest and most successful team in Formula 1 history, competing since the inaugural season in 1950. Their rich legacy, passionate Tifosi, and iconic red cars make them a cornerstone of the sport. They consistently aim for championship glory.',
  },
  {
    'name': 'Mercedes',
    'fullName': 'Mercedes-AMG PETRONAS F1 Team',
    'teamColor': Color(0xFF00D2BE),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/mercedes/2025mercedeslogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/mercedes/2025mercedescarright.webp',
    'drivers': [
      {
        'name': 'George Russell',
        'number': 63,
        'country': 'https://flagcdn.com/w40/gb.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/mercedes/georus01/2025mercedesgeorus01right.webp',
      },
      {
        'name': 'Andrea Kimi Antonelli',
        'number': 12,
        'country': 'https://flagcdn.com/w40/it.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/mercedes/andant01/2025mercedesandant01right.webp',
      },
    ],
    'base': 'Brackley, United Kingdom',
    'teamChief': 'Toto Wolff',
    'technicalChief': 'James Allison',
    'chassis': 'W16',
    'powerUnit': 'Mercedes',
    'firstTeamEntry': '1970',
    'worldChampionships': 8,
    'polePositions': 134,
    'fastestLaps': 100,
    'description':
        'Mercedes-AMG PETRONAS F1 Team dominated the hybrid era of Formula 1, securing an unprecedented run of Constructors\' Championships. With state-of-the-art facilities and a strong leadership, they continue to be a top contender in the sport, pushing boundaries in technology and performance.',
  },
  {
    'name': 'McLaren',
    'fullName': 'McLaren F1 Team',
    'teamColor': Color(0xFFFF8700),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/mclaren/2025mclarenlogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/mclaren/2025mclarencarright.webp',
    'drivers': [
      {
        'name': 'Oscar Piastri',
        'number': 81,
        'country': 'https://flagcdn.com/w40/au.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/mclaren/oscpia01/2025mclarenoscpia01right.webp',
      },
      {
        'name': 'Lando Norris',
        'number': 4,
        'country': 'https://flagcdn.com/w40/gb.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/mclaren/lannor01/2025mclarenlannor01right.webp',
      },
    ],
    'base': 'Woking, United Kingdom',
    'teamChief': 'Andrea Stella',
    'technicalChief': 'Peter Prodromou / Neil Houldey',
    'chassis': 'MCL39',
    'powerUnit': 'Mercedes',
    'firstTeamEntry': '1966',
    'worldChampionships': 9,
    'polePositions': 171,
    'fastestLaps': 161,
    'description':
        'McLaren is one of the most iconic names in Formula 1, with a rich history of success and innovation. Known for their distinctive orange livery, the team is on a journey to return to championship-winning form with a talented driver lineup and renewed focus.',
  },
  {
    'name': 'Aston Martin',
    'fullName': 'Aston Martin Aramco F1 Team',
    'teamColor': Color(0xFF00665F),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/astonmartin/2025astonmartinlogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/astonmartin/2025astonmartincarright.webp',
    'drivers': [
      {
        'name': 'Lance Stroll',
        'number': 18,
        'country': 'https://flagcdn.com/w40/ca.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/astonmartin/lanstr01/2025astonmartinlanstr01right.webp',
      },
      {
        'name': 'Fernando Alonso',
        'number': 14,
        'country': 'https://flagcdn.com/w40/es.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/astonmartin/feralo01/2025astonmartinferalo01right.webp',
      },
    ],
    'base': 'Silverstone, United Kingdom',
    'teamChief': 'Andy Cowell',
    'technicalChief': 'Eric Blandin',
    'chassis': 'AMR25',
    'powerUnit': 'Mercedes',
    'firstTeamEntry': '1959',
    'worldChampionships': 0,
    'polePositions': 1,
    'fastestLaps': 0,
    'description':
        'Aston Martin Aramco F1 Team, with its iconic British racing green, is an ambitious team striving for success in Formula 1. With significant investment and a growing infrastructure, they are aiming to become a front-running contender in the coming years.',
  },
  {
    'name': 'Alpine',
    'fullName': 'BWT Alpine F1 Team',
    'teamColor': Color(0xFF0090FF),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/alpine/2025alpinelogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/alpine/2025alpinecarright.webp',
    'drivers': [
      {
        'name': 'Pierre Gasly',
        'number': 10,
        'country': 'https://flagcdn.com/w40/fr.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/alpine/piegas01/2025alpinepiegas01right.webp',
      },
      {
        'name': 'Franco Colapinto',
        'number': 43,
        'country': 'https://flagcdn.com/w40/ar.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/alpine/fracol01/2025alpinefracol01right.webp',
      },
    ],
    'base': 'Enstone, United Kingdom',
    'teamChief': 'Flavio Briatore',
    'technicalChief': 'David Sanchez',
    'chassis': 'A525',
    'powerUnit': 'Renault',
    'firstTeamEntry': '1986',
    'worldChampionships': 2,
    'polePositions': 20,
    'fastestLaps': 16,
    'description':
        'BWT Alpine F1 Team, representing the Renault Group, embodies French motorsport heritage. They are a constructor with a strong focus on developing their own power units and chassis, aiming to climb the ranks and consistently challenge for podiums.',
  },
  {
    'name': 'Williams',
    'fullName': 'Williams Racing',
    'teamColor': Color(0xFF005AFF),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/williams/2025williamslogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/williams/2025williamscarright.webp',
    'drivers': [
      {
        'name': 'Alexander Albon',
        'number': 23,
        'country': 'https://flagcdn.com/w40/th.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/williams/alealb01/2025williamsalealb01right.webp',
      },
      {
        'name': 'Carlos Sainz',
        'number': 55,
        'country': 'https://flagcdn.com/w40/es.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/williams/carsai01/2025williamscarsai01right.webp',
      },
    ],
    'base': 'Grove, United Kingdom',
    'teamChief': 'James Vowles',
    'technicalChief': 'Pat Fry',
    'chassis': 'FW47',
    'powerUnit': 'Mercedes',
    'firstTeamEntry': '1978',
    'worldChampionships': 9,
    'polePositions': 128,
    'fastestLaps': 133,
    'description':
        'Williams Racing is one of the most successful and historically significant teams in Formula 1. After challenging years, they are undergoing a rebuilding phase, aiming to restore their former glory and become a competitive force once again under new leadership.',
  },
  {
    'name': 'Racing Bulls',
    'fullName': 'Visa Cash App RB Formula One Team',
    'teamColor': Color(0xFF6692FF),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/racingbulls/2025racingbullslogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/racingbulls/2025racingbullscarright.webp',
    'drivers': [
      {
        'name': 'Liam Lawson',
        'number': 30,
        'country': 'https://flagcdn.com/w40/nz.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/racingbulls/lialaw01/2025racingbullslialaw01right.webp',
      },
      {
        'name': 'Isack Hadjar',
        'number': 6,
        'country': 'https://flagcdn.com/w40/fr.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/racingbulls/isahad01/2025racingbullsisahad01right.webp',
      },
    ],
    'base': 'Faenza, Italy',
    'teamChief': 'Alan Permane',
    'technicalChief': 'Tim Goss',
    'chassis': 'VCARB 02',
    'powerUnit': 'Honda RBPT',
    'firstTeamEntry': '1985',
    'worldChampionships': 0,
    'polePositions': 1,
    'fastestLaps': 0,
    'description':
        'Visa Cash App RB Formula One Team (formerly AlphaTauri and Toro Rosso) serves as Red Bull\'s sister team, providing a platform for young drivers to develop their skills. They aim to be a strong midfield contender, often leveraging synergies with Red Bull Racing.',
  },
  {
    'name': 'Kick Sauber',
    'fullName': 'Stake F1 Team Kick Sauber',
    'teamColor': Color(0xFF52E252),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/kicksauber/2025kicksauberlogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/kicksauber/2025kicksaubercarright.webp',
    'drivers': [
      {
        'name': 'Nico Hulkenberg',
        'number': 27,
        'country': 'https://flagcdn.com/w40/de.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/kicksauber/nichul01/2025kicksaubernichul01right.webp',
      },
      {
        'name': 'Gabriel Bortoleto',
        'number': 5,
        'country': 'https://flagcdn.com/w40/br.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/kicksauber/gabbor01/2025kicksaubergabbor01right.webp',
      },
    ],
    'base': 'Hinwil, Switzerland',
    'teamChief': 'Jonathan Wheatley',
    'technicalChief': 'James Key',
    'chassis': 'C45',
    'powerUnit': 'Ferrari',
    'firstTeamEntry': '1993',
    'worldChampionships': 0,
    'polePositions': 1,
    'fastestLaps': 0,
    'description':
        'Stake F1 Team Kick Sauber, with its long-standing presence in Formula 1 as Sauber, is known for its strong technical foundation and development of young talent. They are currently transitioning and looking to improve their performance ahead of Audi\'s full entry into the sport.',
  },
  {
    'name': 'Haas',
    'fullName': 'MoneyGram Haas F1 Team',
    'teamColor': Color(0xFF888888),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/haas/2025haaslogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/haas/2025haascarright.webp',
    'drivers': [
      {
        'name': 'Esteban Ocon',
        'number': 31,
        'country': 'https://flagcdn.com/w40/fr.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/haas/estoco01/2025haasestoco01right.webp',
      },
      {
        'name': 'Oliver Bearman',
        'number': 50,
        'country': 'https://flagcdn.com/w40/gb.png',
        'imageUrl':
            'https://media.formula1.com/image/upload/c_lfill,w_440/q_auto/v1740000000/common/f1/2025/haas/olibea01/2025haasolibea01right.webp',
      },
    ],
    'base': 'Kannapolis, United States',
    'teamChief': 'Ayao Komatsu',
    'technicalChief': 'Andrea de Zordo',
    'chassis': 'VF-25',
    'powerUnit': 'Ferrari',
    'firstTeamEntry': '2016',
    'worldChampionships': 0,
    'polePositions': 1,
    'fastestLaps': 0,
    'description':
        'MoneyGram Haas F1 Team is the only American-owned team on the Formula 1 grid. They operate with a unique model, relying heavily on partnerships with Ferrari for power units and other components. They aim to be a consistent points-scoring team and challenge the midfield.',
  },
];
