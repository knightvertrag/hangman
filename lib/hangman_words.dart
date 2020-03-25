import 'dart:math';

class GuessWordHelper {
  var _words = [
    'Bhojpur',
    'Dhankuta',
    'Ilam',
    'Jhapa',
    'Khotang',
    'Morang',
    'Okhaldhunga',
    'Panchthar',
    'Sankhuwasabha',
    'Solukhumbu',
    'Sunsari',
    'Taplejung',
    'Terhathum',
    'Udayapur',
    'Saptari',
    'Siraha',
    'Dhanusa',
    'Mahottari',
    'Sarlahi',
    'Bara',
    'Parsa',
    'Rautahat',
    'Sindhuli',
    'Ramechhap',
    'Dolakha',
    'Bhaktapur',
    'Dhading',
    'Kathmandu',
    'Kavrepalanchok',
    'Lalitpur',
    'Nuwakot',
    'Rasuwa',
    'Sindhupalchok',
    'Chitwan',
    'Makwanpur',
    'Baglung',
    'Gorkha',
    'Kaski',
    'Lamjung',
    'Manang',
    'Mustang',
    'Myagdi',
    'Nawalpur',
    'Parbat',
    'Syangja',
    'Tanahun',
    'Kapilvastu',
    'Parasi',
    'Rupandehi',
    'Arghakhanchi',
    'Gulmi',
    'Palpa',
    'Dang Deukhuri',
    'Pyuthan',
    'Rolpa',
    'Eastern Rukum',
    'Banke',
    'Bardiya',
    'Western Rukum',
    'Salyan',
    'Dolpa',
    'Humla',
    'Jumla',
    'Kalikot',
    'Mugu',
    'Surkhet',
    'Dailekh',
    'Jajarkot',
    'Kailali',
    'Achham',
    'Doti',
    'Bajhang',
    'Bajura',
    'Kanchanpur',
    'Dadeldhura',
    'Baitadi',
    'Darchula',
  ];
  


  String generateRandomWord() {

    var randomGenerator = Random();
    var randomIndex = randomGenerator.nextInt(_words.length);
    //print(_words);
    return _words[randomIndex].toUpperCase();
  }
}

