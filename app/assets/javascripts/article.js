$(function(){

  $('#page').on('click', function(){
    console.log('ok');
    var appendHTML = 
    `- if article.images.count > 0
    = image_tag article.images.first.variant(resize: "450x400").processed, class: "article-img img-fluid shadow-sm"
    .article-description.card-body
      h6.card-title.m-0
        = article.title.truncate(10, omission: '…')
      p.card-text.m-0
        = article.user.nickname
      p.card-text 
        = article.body.truncate(100, omission: '…')
      = link_to "続きを読む", article_path(article), class: "btn btn-outline-dark rounded-pill float-right"`
      
    $('#append_to').html(appendHTML);
  })
})