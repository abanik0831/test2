$(document).ready(function(){

   $(".personalprofileinfofollowers").on("click", function(e){
       e.preventDefault();

       $('.personalprofileinfoupdates img').attr("src", "/assets/updates-dark.png");
       $('.personalprofileinfofollowers img').attr("src", "/assets/followers-light.png");
       $('.personalprofileinfofollowing img').attr("src", "/assets/following-dark.png");

       $("#followinguserlisting").hide();
       $("#followeduserlisting").css("display", "inline-block");
       $("#dash_profile_page").hide();
   });

    $(".personalprofileinfofollowing").on("click", function(e){
        e.preventDefault();

        $('.personalprofileinfoupdates img').attr("src", "/assets/updates-dark.png");
        $('.personalprofileinfofollowing img').attr("src", "/assets/following-light.png");
        $('.personalprofileinfofollowers img').attr("src", "/assets/followers-dark.png");

        $("#followinguserlisting").css("display", "inline-block");
        $("#followeduserlisting").hide();
        $("#dash_profile_page").hide();
        });

    $(".personalprofileinfoupdates").on("click", function(e){
        e.preventDefault();
        $(".personalprofileinfoupdates img").attr("src", "/assets/updates-light.png");
        $('.personalprofileinfofollowers img').attr("src", "/assets/followers-dark.png");
        $('.personalprofileinfofollowing img').attr("src", "/assets/following-dark.png");

        $("#followinguserlisting").hide();
        $("#followeduserlisting").hide();
        $("#dash_profile_page").show();
    });

    $(".designclick").on("click mousedown", function(){
        $("#designskillset").show();
        $("#techskillset").hide();
        $("#businessskillset").hide();
    });

    $(".techclick").on("click mousedown", function(e){
        $("#designskillset").hide();
//        $("#techskillset").show();
//        $("#businessskillset").hide();
    });

    $(".businessclick").on("click mousedown", function(){
        $("#designskillset").hide();
        $("#techskillset").hide();
        $("#businessskillset").show();
    });

    $(".rightarrowdesign").on("click", function(){
        $("#designskillset").hide();
        $("#techskillset").show();
    });

    $(".leftarrowtech").on("click", function(){
        $("#designskillset").show();
        $("#techskillset").hide();
    });

    $(".rightarrowtech").on("click", function(){
        $("#techskillset").hide();
        $("#businessskillset").show();
    });

    $(".leftarrowbusiness").on("click", function(){
        $("#techskillset").show();
        $("#businessskillset").hide();
    });

});
