$(function(){
    var page = 1;
    var pageLimit = 5;
    var totalRecord = 0;

    fetchData()

    $(".prev-btn").on("click", function () {
        if(page > 1){
            page--;
            fetchData();
        }
    });

    $(".next-btn").on("click", function () {
        if(page*pageLimit < totalRecord){
            page++;
            fetchData();
        }
    });

    function fetchData() {
        $.ajax({
            url: "url que devuelve la info",
            type: "GET",
            data: {
                page:page,
                pagelimit: pageLimit
            },
            success: function(data){
                console.log(data);

                if (data.success){
                    totalRecord
                    //Codigo que se va a realizar
                }
            },
            error: function(jqXHR,textStatus,errorThrown){
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);
            }
        });
    }
});
