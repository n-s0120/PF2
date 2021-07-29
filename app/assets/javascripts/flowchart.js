/*global $*/
document.addEventListener("turbolinks:load"
, function () {
  $(function() {
    let tabs = $(".tab"); // tabのクラスを全て取得し、変数tabsに配列で定義
    $(".tab").on("click", function() { // tabをクリックしたらイベント発火
      $(".active").removeClass("active"); // activeクラスを消す
      $(this).addClass("active"); // クリックした箇所にactiveクラスを追加
      const index = tabs.index(this); // クリックした箇所がタブの何番目か判定し、定数indexとして定義
      $(".content").removeClass("show").eq(index).addClass("show"); // showクラスを消して、contentクラスのindex番目にshowクラスを追加
    });
  });
})

/*global $*/
document.addEventListener("turbolinks:load"
, function () {
  $(function() {
    let tabs = $(".tokyo_tab"); // tabのクラスを全て取得し、変数tabsに配列で定義
    $(".tokyo_tab").on("click", function() { // tabをクリックしたらイベント発火
      $(".tokyo_active").removeClass("tokyo_active"); // activeクラスを消す
      $(this).addClass("tokyo_active"); // クリックした箇所にactiveクラスを追加
      const index = tabs.index(this); // クリックした箇所がタブの何番目か判定し、定数indexとして定義
      $(".tokyo_content").removeClass("show").eq(index).addClass("show"); // showクラスを消して、contentクラスのindex番目にshowクラスを追加
    });
  });
})