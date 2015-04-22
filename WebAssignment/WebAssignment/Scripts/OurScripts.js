$(document).ready(function getAllDetails() {

    //  console.log("jquery is loaded");
    //Please note this will be different for every PC
    var url = "http://localhost:52673/JSONService.svc/GetTeamInfo";
    $.ajax({
        url: url,
        type: "GET",
        success: function (data) {
            var returnedData = data;
            console.log("Ajax call succeeded! :D");
            console.log(returnedData);

            //SLOW WAY OF APPENDING
            var numberOfObjects = returnedData.length;
            var htmlTable = [];
            htmlTable.push("<table class='table'>");
            htmlTable.push("<tr>");
            htmlTable.push("<th> First Name </th>");
            htmlTable.push("<th> Last Name </th>");
            htmlTable.push("<th> Position </th>");
            htmlTable.push("<th> Telephone </th>");
            htmlTable.push("<th> Email </th>");
            htmlTable.push("</tr>");
            for (i = 0; i < numberOfObjects; i++) {
                // console.log(returnedData[i].id);
                htmlTable.push("<tr>");

                htmlTable.push("<td>" + returnedData[i].FirstName + "</td>");
                htmlTable.push("<td>" + returnedData[i].LastName + "</td>");
                htmlTable.push("<td>" + returnedData[i].Position + "</td>");
                htmlTable.push("<td>" + returnedData[i].Telephone + "</td>");
                htmlTable.push("<td>" + returnedData[i].Email + "</td>");


                htmlTable.push("</tr>");
            }
            htmlTable.push("</table>");
            $('#displayJson').append(htmlTable.join(" "));

        },
        error: function (xhr) {
            console.log("Ajax call failed :'(");
            console.log(xhr);
        }
    });  

});

function emailFunction() {
    var name = prompt('Enter your Name:');
    var email = prompt('Enter your Email:');
    alert('Thank you ' + name + ', you have been added to our mailing list.');
}
