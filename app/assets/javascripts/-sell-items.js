$(function() {

$(document).on('turbolinks:load', function() {

// -----------------------販売価格表示----------------------------
$(".input-default2").on("keyup", function() {
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
// -----------------------販売価格表示---------------------------

// -----------------------カテゴリ選択ビルド-----------------------
    function selectwrap(){
      var html =
      `<div class='select-wrap'>
      <select class="select-default" name="product[category_ids]" id="child_category_ids2">
      <option value="">---</option>
      </select>
      <i class="fa fa-fas fa-angle-down"></i>
      </div>`
      return html;
    };

    function selectwrap3(){
      var html =
      `<div class='select-wrap'>
      <select class="select-default" name="product[category_ids]" id="child_category_ids3">
      <option value="">---</option>
      </select>
      <i class="fa fa-fas fa-angle-down"></i>
      </div>`
      return html;
    };

    function selectwrap2(child){
      var html =
      `<option value="${child.id}">${child.name}</option>`
      return html;
    };
// -----------------------カテゴリ選択ビルド-----------------------

// -----------------------カテゴリ選択----------------------------
    $(".select-wrap1").on("change", function() {
      $(".select-wrap2").empty();
      $(".select-wrap3").empty();
      var parentValue = document.getElementById("product_category_ids").value;
      $.ajax({
        url: '/products/search',
        type: "GET",
        data: {parent_id: parentValue},
        dataType: 'json' 
      })
      .done(function(child){
        html = selectwrap();
        $(".select-wrap2").append(html);
        child.forEach(function(child){
        HTML = selectwrap2(child);
        $("#child_category_ids2").append(HTML); 
      })
      .fail(function(){
        $(".select-wrap2").empty();
        $(".select-wrap3").empty();
      })
    })
  });

  $(".select-wrap2").on("change", function() {
    $(".select-wrap3").empty();
    var childrenValue = document.getElementById("child_category_ids2").value;
      $.ajax({
        url: '/products/search',
        type: "GET",
        data: {children_id: childrenValue},
        dataType: 'json' 
      })
      .done(function(gdchild){
        html = selectwrap3();
        $(".select-wrap3").append(html);

        gdchild.forEach(function(gdchild){
        HTML = selectwrap2(gdchild);
        $("#child_category_ids3").append(HTML); 
      })
    })
      .fail(function(){
        $(".select-wrap2").empty();
        $(".select-wrap3").empty();
      })
    })
// -----------------------カテゴリ選択----------------------------
  })
});