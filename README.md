# Bloc ve Cubit ile Öğrenme Serisi

Merhaba arkadaşlar, bu seride Bloc ve Cubit kullanımını birlikte öğrenmeye odaklanacağız. Bu süreçte hem kendimi geliştirmeyi hem de öğrendiklerimi sizlerle paylaşmayı amaçlıyorum. Öğrenirken sürekli norlar bırakacağım umarım sizinde işinize yarar.


---

## Demo1
Resimlerde görünen demo1 kısmına [buraya](https://github.com/GanTeFlutter/bloc-learn/tree/main/lib/demo/bloc_market_card) tıklayarak ulaşabilirsiniz.

<div style="display: flex; flex-wrap: wrap;">
  <img src="https://github.com/user-attachments/assets/24a49075-f7d9-4450-929c-7d4ad342d7b8" alt="2" width="200" style="margin-right: 10px; margin-bottom: 10px;" />
  <img src="https://github.com/user-attachments/assets/73ecb945-6df2-4759-b877-f72820afe1fa" alt="3" width="200" style="margin-bottom: 10px; margin-right: 10px;" />
  <img src="https://github.com/user-attachments/assets/fcbf2db1-3381-4e5c-98f2-474c484e2201" alt="4" width="200" style="margin-right: 10px; margin-bottom: 10px;" />
</div>

<div style="display: flex; flex-wrap: wrap;">
  <img src="https://github.com/user-attachments/assets/82aaf0a5-1c0f-4f01-984b-f3ddac300e55" alt="6" width="200" style="margin-bottom: 10px;" />
  <img src="https://github.com/user-attachments/assets/2b96b5bc-488d-4f15-8853-370ae6fb1119" alt="5" width="200" style="margin-right: 10px; margin-bottom: 10px;" />
  <img src="https://github.com/user-attachments/assets/6ee253e4-51d8-4f2a-910a-9a2c992c31e8" alt="1" width="200" style="margin-right: 10px; margin-bottom: 10px;" />
</div>

### Sepet İşlemleri

Sepete ekleme butonuna tıklandığında, alt kısımda yer alan `showSnackBar` ile kullanıcıya bildirim yapıyoruz. `BlocConsumer` ile de state dinleniyor, yani gerçekten sepete bir öğe eklendiğinde bildirim tetikleniyor.


### Sepet Fonksiyonları

Sepet işlemleri için ekleme, çıkarma, adet arttırma, tümünü silme gibi fonksiyonlar ekledim.  
Demo1, bu kadar arkadaşlar.Anlamadığınız veya benim yanlış yaptığı bir yer olursa veya şu kısmı şu şekilde yapsan daha güzel olurdu dediğiniz bir yer varsa lütfen söyleyin bende öğrenmiş olurum.

------
  

## Demo2
Amacımız, homepage'deki kategorilere göre Bloc yapısında gerekli state'leri emit etmek. Bu sayede, kategorilerimizi anlık olarak veritabanından çekip kullanıcıya ulaştıracağız.
Bu örnekte basitlik adına cacheleme işlemi yapmayacağım. Ancak demo3'te, 1 ve 2'yi birleştirip ek olarak cacheleme özelliği ekleyeceğiz.
