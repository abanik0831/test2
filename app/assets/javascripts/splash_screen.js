//function updateComments() {
//    var post_id = $(".container_content").attr("data-id");
////
////    $(".container_content").on("focus", function(){
////       var post_id = $(this).attr("data-id");
////        console.log(post_id);
////    });
//
//    var after = $(".comment:last").attr("data-time");
//    $.getScript("/?post_id=" + post_id + "&after=" + after);
//    setTimeout(updateComments, 5000000);
//}
//
//
//var CommentPoller;
//
//CommentPoller = {
//    poll: function() {
//        setTimeout(this.request, 5000);
//        return {
//            request: function() {
//                return $.get($('#comments').data('url'));
//            }
//        };
//    }
//};

//function updateComments(){
//    console.log("hiii");
//}

$.fn.scrollBottom = function() {
    return $(document).height() - this.scrollTop() - this.height();
};

$(document).ready(function(){
    //e.preventDefault();
    // if($(".container").length > 0) {
       // setTimeout(updateComments, 500000000);
   // }

//    $(".close").on('click', function(e){
//        var that = this;
//        $.ajax({
//           type: "GET",
//            url: "/posts",
//            data: {post: {visibility: 0 }},
//            success: function(){
//                $(that).parent().parent().remove();
//            }
//        });
//
//
//    });

//    $(".follow_user").on("click", function(e){
//        alert(1);
//        $(".messageuser").toggleClass("msguser_hide");
//    });


    //if ($('#comments').length > 0) {
       // return CommentPoller.poll();
    //}

    $(".fui-cross").on("click", function(e){
        console.log("h1");
        e.preventDefault();
        var r=confirm("Are you sure you want to delete this comment ?");
        if (r == true) {
        var that = $(this);
            var profile_id = that.siblings(".profileid").attr('data-url');
            console.log(profile_id);
        var post_id_dlt = $(this).siblings(".dlt_postid").val();
        var user_id_dlt = $(".dlt_userid").val();
            console.log(user_id_dlt);
        console.log(post_id_dlt);
        $.ajax({
           type: "POST",
            url: "/deleteposts",
            data: {deletepost : {post_id: post_id_dlt, user_id: user_id_dlt}},
            success: function(){
                that.parent().parent().parent().parent().parent().fadeTo("slow", 0.00, function(){ //fade
                    $(this).slideUp("slow", function() { //slide up
                        $(this).remove(); //then remove from the DOM
                    });
                });

            },
            error: function(error){
                console.log(error);
            }
        });
        if(profile_id == user_id_dlt) {
            $.ajax({
               type: "PUT",
                url: "/posts/"+ post_id_dlt,
                dataType: "JSON",
                data: {post: {visibility: false}}
            }).done(function( msg ) {
                    console.log( "Data Saved: " + msg );
            }).fail(function(msg){
                    console.log("not saved");
                });
        }
        }
        else {
            return false;
        }
    });

   // document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);

    $(document).on("input keyup", ".comment_field", function(e){
        var y = $(this).val();
        console.log(y);
        if(y.length > 0) {
            $(this).parent().find(".comment_splash").removeAttr("disabled");
        }

        if(y.length <= 0) {
            $(this).parent().find(".comment_splash").attr("disabled", true);
        }
    });

    $(document).on("input keyup", ".post_field", function(e){
        var y = $(this).val();
        console.log(y);
        if(y.length > 0) {
            $(this).parent().find(".post_splash").removeAttr("disabled");
        }

        if(y.length <= 0) {
            $(this).parent().find(".post_splash").attr("disabled", true);
        }
    });

    $(".new_comment").on("ajax:complete", function(event,xhr,status){
        $(this).find(".comment_field").val('');
        $(this).find(".comment_splash").attr("disabled", true);
    });

    $(".comment:not(:nth-last-of-type(-n+2))").css("display", "none");

    $(".comment_splash").on("click", ".comments", function(){

        console.log(this);
//        if($(this).parent().parent().parent().find(".comment:not(:nth-last-of-type(-n+2))").css('display') === 'block') {
//            $(this).parent().parent().parent().find(".comment:nth-last-child(2)").css("border-bottom", "5px solid gray", "important");
////            var height = $(this).parent().parent().parent().find(".commentsheight");
////            lastElementTop = $('.comment:last-child').position().top;
////
////            scrollAmount = lastElementTop - 200 ;
////
////            height.animate({scrollTop: scrollAmount},1000);
////            console.log(lastElementTop);
//          //  $(this).parent().parent().parent().find(".comment:not(:nth-last-of-type(-n+2))").show();
//        }

    });

    $(".pagetop").on("click", function(){
        //$('body').scrollTop(0);
        $('body').animate({scrollTop: 0}, 1000);
    });

    $(".view_all_comments").on("click", function(e){
        e.preventDefault();
        $(this).parent().find(".comment:not(:nth-last-of-type(-n+2))").css("display", "block");
        $(this).parent().find(".comment:nth-last-child(2)").css("border-top", "1px solid gray");
    });

//    $('#new_post').fileupload({
//        dataType: "script",
//        add: function(e, data) {
//            var file, types;
//            types = /(\.|\/)(gif|jpe?g|png)$/i;
//            file = data.files[0];
//            if (types.test(file.type) || types.test(file.name)) {
//                data.context = $(tmpl("template-upload", file));
//                $('#new_post').append(data.context);
//                return data.submit();
//            } else {
//                return alert("" + file.name + " is not a gif, jpeg, or png image file");
//            }
//        },
//        progress: function(e, data) {
//            var progress;
//            if (data.context) {
//                progress = parseInt(data.loaded / data.total * 100, 10);
//                return data.context.find('.bar').css('width', progress + '%');
//            }
//        }
//    });


//        $(".post_splash").on('click', function(e){
//           // e.preventDefault();
//            $('#new_post').fileupload({
////                dataType: "script",
//                $.ajax({
//                type: "POST",
//                url:"/post_pics",
//                data: {post_pic: {picture: {picture: {url: "hello.png"}}, post_id: "120"}},
//               data: {post_pic: {picture: "hello.png", post_id: "120"}},
//                async: false,
//    //            processData: false,
//    //            contentType: false,
//    //          contentType: "application/json; charset-utf-8",
//    //           dataType: "json",
//                success: function(data){
//                    //console.log(data);
//                },
//                error: function(data){
//                    console.log(data);
//                    //alert("error");
//                }
//            });
//
////                add: function(e, data) {
////                    alert(1);
////                    var file, types;
////                    types = /(\.|\/)(gif|jpe?g|png)$/i;
////                    file = data.files[0];
////                    if (types.test(file.type) || types.test(file.name)) {
////                        data.context = $(tmpl("template-upload", file));
////                        $('#new_post').append(data.context);
////                        return data.submit();
////                    } else {
////                        return alert("" + file.name + " is not a gif, jpeg, or png image file");
////                    }
////                },
//            });
//        });
//
//    $(".post_splash").on('click', function(e){
//        e.preventDefault();
//        var post_data = $(".post_field").val();
//        var user_id = $(".user_id").val();
//
//
//        $("#new_post_pic").fileupload();
//        var formData = new FormData();
//
//        var inputs = document.getElementsByClassName('input');
//        // alert(inputs.length);
//        for(var i=0;i<inputs.length;i++) {
//            console.log(inputs[i].name + " " + inputs[i].value);
//            formData.append(inputs[i].name, inputs[i].value);
//        }
//
//        console.log(formData);
//        var filename = $(".img_up").val();
//        console.log(filename);
//
//        $.ajax({
//            type: "POST",
//            url:"/post_pics",
//            data: {post_pic: {picture: {picture: "pic.png"}, post_id: "120"}},
          // data: {post_pic: {picture: "hello.png", post_id: "120"}},
//            async: false,
//            processData: false,
//            contentType: false,
//          contentType: "application/json; charset-utf-8",
//           dataType: "json",
//            success: function(data){
//                console.log(data);
//            },
//            error: function(data){
//                console.log(data);
//                //alert("error");
//            }
//        }) ;
//
//        var out = "";
//        $.ajax({
//            type: "POST",
//            url: "/posts",
//            data: {post: {post: post_data, profile_id: user_id }},
//            success: function(){
//                out = "<li class = 'posts_on_dash'>" + post_data + "</li>"  ;
//                $("#post_container").prepend(out);
//                $(".post_field").val("");
//            },
//            error: function(){
//                alert("OOPS! something went wrong!");
//            }
//        });
//    });
}) ;
