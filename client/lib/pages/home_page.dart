import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(28, 28, 36, 1),
        centerTitle: true,
        leading: Center(child: Image.network('https://s3-alpha-sig.figma.com/img/b8c8/abba/78cac0eb16b91fbc80c193c33d478bc6?Expires=1655683200&Signature=PDzhYB8q5I4N98Ri6xNOhB6rgcoXCAN32JSYdsQjM4HeCMucd5Z58BG1Gfh8aULAzgkk8P4mXeCEWV4eZF5XBLHTs2-D~2GJHXvAJV8cctInRyQIlfuqB5HVup-cy6zyQ4IjwB8RuiwIkeBQDBITGf34Vbj2EwICrOhqt8RWgcglsomYQNJDIMEYHUJAexGc6TU3uNG5CTpBrZnXBBktkNpm0zwc7fnACqeJgXJ7GVOgOuQGJVTTEAenvJNQMkjkKX0iqk64Ml0NDX9c0LKOXbA1Ca2q304Ayh7imlkiPPaTOAVxCMdh~m6TjBTGjDbVqXaTmlY14SGg6tE39AfyGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA', fit: BoxFit.fill,)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Text('URL')
            ),
            Container(width: 25),
            InkWell(
                onTap: () {},
                child: Text('PDF')
            )
          ],
        ),
        actions: [
          InkWell(
              onTap:() {},
              child: Image.network('https://s3-alpha-sig.figma.com/img/a47e/9e85/ae926760f4b87dbe7ac58e3ddcaf0e89?Expires=1655683200&Signature=U~7e2NP8Gu5Hmsxuis9ffjlTueppaiOgGT-EempaLORpon1YayZdyaXFbsyN18KIPQkftdIzczHLgSdHmI3p1VzFte~hEoitm9mSRHDU3WvI~xp8hkLKD54tNmoXgKyHXzVcnSz7LtuyDNEumZMvwRDee1PSo1A4hUmYLn9u6Nl~FLoLRTxoUxXkE~JASa3bmIBfvB6tLih9OK1nu0~4VCNjkS-pkfBXHVIa-b991~QEVQA~tqVAM-ffd6TjhojbvI7cSwwvas4Mev8Hk0oufTFO46nwrgfK8hp0ErTt0hw7eoqZRwem0T20SCK7O7yG2Otk6TN-FTe9fYigLRa2jw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'))
        ],
      ),
    );
  }
}
