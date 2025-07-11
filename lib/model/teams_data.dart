// Data tim F1 2025
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
    'drivers': ['Max Verstappen', 'Yuki Tsunoda'],
    'country': 'Austria',
  },
  {
    'name': 'Ferrari',
    'fullName': 'Scuderia Ferrari',
    'teamColor': Color(0xFFDC143C),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/ferrari/2025ferrarilogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/ferrari/2025ferraricarright.webp',
    'drivers': ['Charles Leclerc', 'Lewis Hamilton'],
    'country': 'Italy',
  },
  {
    'name': 'Mercedes',
    'fullName': 'Mercedes-AMG PETRONAS F1 Team',
    'teamColor': Color(0xFF00D2BE),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/mercedes/2025mercedeslogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/mercedes/2025mercedescarright.webp',
    'drivers': ['George Russell', 'Kimi Antonelli'],
    'country': 'Germany',
  },
  {
    'name': 'McLaren',
    'fullName': 'McLaren F1 Team',
    'teamColor': Color(0xFFFF8700),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/mclaren/2025mclarenlogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/mclaren/2025mclarencarright.webp',
    'drivers': ['Oscar Piastri', 'Lando Norris'],
    'country': 'United Kingdom',
  },
  {
    'name': 'Aston Martin',
    'fullName': 'Aston Martin Aramco F1 Team',
    'teamColor': Color(0xFF00665F),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/astonmartin/2025astonmartinlogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/astonmartin/2025astonmartincarright.webp',
    'drivers': ['Lance Stroll', 'Fernando Alonso'],
    'country': 'United Kingdom',
  },
  {
    'name': 'Alpine',
    'fullName': 'BWT Alpine F1 Team',
    'teamColor': Color(0xFF0090FF),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/alpine/2025alpinelogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/alpine/2025alpinecarright.webp',
    'drivers': ['Pierre Gasly', 'Franco Colapinto'],
    'country': 'France',
  },
  {
    'name': 'Williams',
    'fullName': 'Williams Racing',
    'teamColor': Color(0xFF005AFF),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/williams/2025williamslogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/williams/2025williamscarright.webp',
    'drivers': ['Alexander Albon', 'Carlos Sainz'],
    'country': 'United Kingdom',
  },
  {
    'name': 'Racing Bulls',
    'fullName': 'Visa Cash App RB Formula One Team',
    'teamColor': Color(0xFF6692FF),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/racingbulls/2025racingbullslogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/racingbulls/2025racingbullscarright.webp',
    'drivers': ['Liam Lawson', 'Isak Hadjar'],
    'country': 'Italy',
  },
  {
    'name': 'Kick Sauber',
    'fullName': 'Stake F1 Team Kick Sauber',
    'teamColor': Color(0xFF52E252),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/kicksauber/2025kicksauberlogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/kicksauber/2025kicksaubercarright.webp',
    'drivers': ['Niko Hulkenberg', 'Gabriel Bortoleto'],
    'country': 'Switzerland',
  },
  {
    'name': 'Haas',
    'fullName': 'MoneyGram Haas F1 Team',
    'teamColor': Color(0xFF888888),
    'logoUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_48/q_auto/v1740000000/common/f1/2025/haas/2025haaslogowhite.webp',
    'carUrl':
        'https://media.formula1.com/image/upload/c_lfill,w_800/q_auto/v1740000000/common/f1/2025/haas/2025haascarright.webp',
    'drivers': ['Esteban Ocan', 'Ollie Bearman'],
    'country': 'United States',
  },
];
