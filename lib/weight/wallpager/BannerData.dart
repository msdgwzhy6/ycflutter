class BannerData {
  BannerData({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final sampleItems = <BannerData>[
  new BannerData(title: '潇湘剑雨', category: '', imageUrl: 'lib/image/image1.jpg',),
  new BannerData(title: '小杨逗比', category: '', imageUrl: 'lib/image/image2.jpg',),
  new BannerData(title: '我的GitHub', category: '', imageUrl: 'lib/image/image3.jpg',),
  new BannerData(title: '掘金博客', category: '', imageUrl: 'lib/image/image4.jpg',),
  new BannerData(title: '技术博客', category: '', imageUrl: 'lib/image/image5.png',),
];