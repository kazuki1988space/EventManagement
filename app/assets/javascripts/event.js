$(document).on('turbolinks:load', function() {

  var searchTitle = $('.mainContainer .search-title');
  var userParticipantShowTitle = $('.mainContainer .userParticipantShow-title');
  var userSponsorShowTitle = $('.mainContainer .userSponsorShow-title');
  var slideSpeed = 500;
  $('.mainContainer .search_form').css('display', 'none');
  $('.mainContainer .form.view.userSponsorShow').css('display', 'none');
  $('.mainContainer .form.view.userParticipantShow').css('display', 'none');

  searchTitle.click(function(){
    $('.mainContainer .search_form').slideToggle(slideSpeed);
    $(this).find('i').toggleClass('fa-angle-double-down');
    $(this).find('i').toggleClass('fa-angle-double-up');
  });

  userSponsorShowTitle.click(function(){
    $('.mainContainer .form.view.userSponsorShow').slideToggle(slideSpeed);
    $(this).find('i').toggleClass('fa-angle-double-down');
    $(this).find('i').toggleClass('fa-angle-double-up');
  });

  userParticipantShowTitle.click(function(){
    $('.mainContainer .form.view.userParticipantShow').slideToggle(slideSpeed);
    $(this).find('i').toggleClass('fa-angle-double-down');
    $(this).find('i').toggleClass('fa-angle-double-up');
  });

  var appendPeople = $('.container.eventShow .appendPeople');
  var appendList = $('.container.eventShow .appendList');
  appendList.css('display', 'none');

  appendPeople.click(function(){
    appendList.slideToggle(slideSpeed);
    $(this).find('i').toggleClass('fa-angle-double-down');
    $(this).find('i').toggleClass('fa-angle-double-up');
  });

  var eventCategory = $('div.event-container div.event-category');
  $('div.event-container div.event-category:contains("セミナー・勉強会")').css('background-color', 'YellowGreen');
  $('div.event-container div.event-category:contains("異業種交流")').css('background-color', 'skyblue');
  $('div.event-container div.event-category:contains("恋活・婚活")').css('background-color', 'violet');
  $('div.event-container div.event-category:contains("スポーツ")').css('background-color', 'gold');
  $('div.event-container div.event-category:contains("趣味")').css('background-color', 'SandyBrown');
  $('div.event-container div.event-category:contains("その他")').css('background-color', '#fff');

  $('div.container.eventShow div.eventShow-category:contains("セミナー・勉強会")').css('background-color', 'YellowGreen');
  $('div.container.eventShow div.eventShow-category:contains("異業種交流")').css('background-color', 'skyblue');
  $('div.container.eventShow div.eventShow-category:contains("恋活・婚活")').css('background-color', 'violet');
  $('div.container.eventShow div.eventShow-category:contains("スポーツ")').css('background-color', 'gold');
  $('div.container.eventShow div.eventShow-category:contains("趣味")').css('background-color', 'SandyBrown');
  $('div.container.eventShow div.eventShow-category:contains("その他")').css('background-color', '#fff');


  var newEvent = $('.form.submit.newEvent');
  var titleCount = newEvent.find('.titleLength span.count');
  var contentCount = newEvent.find('.contentLength span.count');
  var maxTitleLength = 80;
  var maxContentLength = 1000;

  titleCount.text(maxTitleLength);
  contentCount.text(maxContentLength);

  newEvent.find('input.titles').on('keydown keyup keypress change', function(){
    var valueTitleLength = $(this).val().length;
    var titleCountDown = maxTitleLength - valueTitleLength;
    titleCount.text(titleCountDown);

    if (titleCountDown >= 20){
      titleCount.removeClass('yellow');
    }
    if (titleCountDown < 20){
      titleCount.removeClass('red');
      titleCount.addClass('yellow');
    }
    if (titleCountDown < 10){
      titleCount.removeClass('yellow');
      titleCount.addClass('red');
    }

  });

  newEvent.find('textarea.content').on('keydown keyup keypress change', function(){
    var valueContentLength = $(this).val().length;
    var contentCountDown = maxContentLength - valueContentLength
    contentCount.text(contentCountDown);

    if (contentCountDown >= 100){
      contentCount.removeClass('yellow');
    }
    if (contentCountDown < 50){
      contentCount.removeClass('red');
      contentCount.addClass('yellow');
    }
    if (contentCountDown < 50){
      contentCount.removeClass('yellow');
      contentCount.addClass('red');
    }

  });

});
