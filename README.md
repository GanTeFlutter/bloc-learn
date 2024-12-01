Merhaba arkadaşlar, bu seride Bloc ve Cubit kullanmayı birlikte öğrenmeye odaklanacağız. Ben de bu süreçte hem kendimi geliştirmeyi hem de edindiğim bilgileri sizinle paylaşmayı amaçlıyorum. Öğrenirken aldığım notlarla sizlere rehber olmayı ve birlikte keyifli bir öğrenme yolculuğu yapmayı hedefliyorum.

Resimlerde gözüken demo kısmına <a href="https://github.com/GanTeFlutter/bloc-learn/tree/main/lib/demo/bloc_market_card" target="_self">buraya</a>
 tıklayarak ulaşabilirsiniz diğer sayfalarda kendim öğrenemeye çalışırken yaptığım kısımlar var.


<hr style="border: 2px solid #000; width: 100%; margin: 20px 0;">

<div>
    <img src="https://github.com/user-attachments/assets/24a49075-f7d9-4450-929c-7d4ad342d7b8" alt="2" width="200" style="margin-right: 10px; margin-bottom: 10px;" />
    <img src="https://github.com/user-attachments/assets/73ecb945-6df2-4759-b877-f72820afe1fa" alt="3" width="200" style="margin-bottom: 10px;" />
    <img src="https://github.com/user-attachments/assets/fcbf2db1-3381-4e5c-98f2-474c484e2201" alt="4" width="200" style="margin-right: 10px; margin-bottom: 10px;" />
  </div>



  Sebepte ekleme buttonuna tıklandığında alltaki showSnackBar kullanıcıyı bildiriyoruz bu showSnackBar BlocConsumer ile state dinliyor yani sepete gerçekten eklenirse çalılıyor.
<pre>
BlocConsumer<BasketappBloc, BasketappState>(
                    listener: (context, state) {
                      if (state is BasketState && ModalRoute.of(context)?.isCurrent == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Ürün sepete eklendi'),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is BasketState) {
                        return Text(
                          state.toplamAdet.toString(),
                          style: const TextStyle(color: Colors.white),
                        );
                      }
                      return const Text('0');
                    },
                  ),
</pre>
<hr style="border: 2px solid #000; width: 100%; margin: 20px 0;">
<div>
    <img src="https://github.com/user-attachments/assets/82aaf0a5-1c0f-4f01-984b-f3ddac300e55" alt="6" width="200" style="margin-bottom: 10px;" />
    <img src="https://github.com/user-attachments/assets/2b96b5bc-488d-4f15-8853-370ae6fb1119" alt="5" width="200" style="margin-right: 10px; margin-bottom: 10px;" />
    <img src="https://github.com/user-attachments/assets/6ee253e4-51d8-4f2a-910a-9a2c992c31e8" alt="1" width="200" style="margin-right: 10px; margin-bottom: 10px;" />
</div>





