<section class="promo">
        <h2 class="promo__title">Нужен стафф для катки?</h2>
        <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
        <ul class="promo__list">
           <?php
            foreach($categories as $cat) {
                ?><li class="promo__item promo__item--boards">
                <a class="promo__link" href="pages/all-lots.html"><?=$cat?></a>
            </li><?php
            }
            ?>
        </ul>
    </section>
    <section class="lots">
        <div class="lots__header">
            <h2>Открытые лоты</h2>
        </div>
        <ul class="lots__list">
            <?php
            foreach ($announcements as $a){
                ?><li class="lots__item lot">
                <div class="lot__image">
                    <img src="<?=$a['Url']?>" width="350" height="260" alt="">
                </div>
                <div class="lot__info">
                    <span class="lot__category"><?=$a["Category"]?></span>
                    <h3 class="lot__title"><a class="text-link" href="pages/lot.html"><?=$a["Name"] ?></a></h3>
                    <div class="lot__state">
                        <div class="lot__rate">
                            <span class="lot__amount">Стартовая Цена</span>
                            <?=sum_format($a['Cost1']) ?>
                        </div>
                        <div class="lot__timer timer">
                            <?=time_check()?>
                        </div>
                    </div>
                </div>
            </li>
           <?php }?>
        </ul>
    </section>