$(function() {


  // function selectwrap(){
  //     var html =
  //     `<div class='select-wrap'>
  //     <select class="select-default" name="product[category_ids]" id="product_category_ids"><option value="">---</option>
  //     <option value="2">トップス</option>
  //     <option value="3">ジャケット/アウター</option>
  //     <option value="4">パンツ</option>
  //     <option value="5">Tシャツ/カットソー(半袖/袖なし)</option>
  //     <option value="6">キャミソール</option>
  //     </select>
  //     <i class="fa fa-fas fa-angle-down"></i>
  //     </div>`
  //     return html;
  //   };

  // function selectwrap2(){
  //   var html =
  //   `<div class='select-wrap'>
  //   <select class="select-default" name="product[category_ids]" id="product_category_ids"><option value="">---</option>
  //   <option value="19">Tシャツ/カットソー(半袖/袖なし)</option>
  //   <option value="20">ポロシャツ</option>
  //   </select>
  //   <i class="fa fa-fas fa-angle-down"></i>
  //   </div>`
  //   return html;
  //   };

// -----------------------販売価格表示-----------------------
  $(".input-default").on("keyup", function() {
    var val = $(this).val();
    if ( val >= 300 && val <= 9999999) {
      var fee = Math.floor(val / 10)
      var SalesCommission = "¥" + String(fee).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      var SalesProfit  = val - fee
      var profit = "¥" + String(SalesProfit).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
      $(".l-right").text(profit);
      $(".l-right-10").text(SalesCommission);
    } else {
      $(".l-right").text("-");
      $(".l-right-10").text("-");
    }
  });
// -----------------------販売価格表示-----------------------

  // $(".select-default").on("change", function() {

  //   console.log("変更されました")
  //   HTML = selectwrap();
  //   $(".select-wrap2").append(HTML)

  //     $(".select-default").on("change", function() {
  //       console.log('変更されました2')
  //       HTML = selectwrap2();
  //       $(".select-wrap3").append(HTML);
  //   })
  // })
  
});