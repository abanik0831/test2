$(document).ready(function(){

   $(document).on("click", ".personalprofileinfofollowers", function(e){
       e.preventDefault();
       $('.personalprofileinfoupdates img').attr("src", "/assets/updates-dark.png");
       $('.personalprofileinfofollowers img').attr("src", "/assets/followers-light.png");
       $('.personalprofileinfofollowing img').attr("src", "/assets/following-dark.png");

       $("#followinguserlisting").hide();
       $("#followeduserlisting").css("display", "inline-block");
       $("#dash_profile_page").hide();
   });

    $(document).on("click", ".personalprofileinfofollowing", function(e){
        e.preventDefault();
        $('.personalprofileinfoupdates img').attr("src", "/assets/updates-dark.png");
        $('.personalprofileinfofollowing img').attr("src", "/assets/following-light.png");
        $('.personalprofileinfofollowers img').attr("src", "/assets/followers-dark.png");

        $("#followinguserlisting").css("display", "inline-block");
        $("#followeduserlisting").hide();
        $("#dash_profile_page").hide();
        });

    $(document).on("click", ".personalprofileinfoupdates", function(e){
        e.preventDefault();
        $(".personalprofileinfoupdates img").attr("src", "/assets/updates-light.png");
        $('.personalprofileinfofollowers img').attr("src", "/assets/followers-dark.png");
        $('.personalprofileinfofollowing img').attr("src", "/assets/following-dark.png");

        $("#followinguserlisting").hide();
        $("#followeduserlisting").hide();
        $("#dash_profile_page").show();
    });

    $(document).on("click mousedown", ".designclick", function(){
        $("#designskillset").show();
        $("#techskillset").hide();
        $("#businessskillset").hide();
    });

    $(document).on("click mousedown", ".techclick", function(e){
        $("#designskillset").hide();
//        $("#techskillset").show();
//        $("#businessskillset").hide();
    });

    $(document).on("click mousedown",".businessclick",  function(){
        $("#designskillset").hide();
        $("#techskillset").hide();
        $("#businessskillset").show();
    });

    $(document).on("click", ".rightarrowdesign", function(){
        $("#designskillset").hide();
        $("#techskillset").show();
    });

    $(document).on("click", ".leftarrowtech",function(){
        $("#designskillset").show();
        $("#techskillset").hide();
    });

    $(document).on("click", ".rightarrowtech", function(){
        $("#techskillset").hide();
        $("#businessskillset").show();
    });

    $(document).on("click", ".leftarrowbusiness", function(){
        $("#techskillset").show();
        $("#businessskillset").hide();
    });

});
