this.CommentPoller = {
    poll: function() {
        setTimeout(this.request, 1000);
    },
    request: function() {
         $.get($("#20").data("url"));
    }
};

jQuery(function() {
    if ($("#20").length > 0) {
        CommentPoller.poll();
    }
});

