$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == "")
	 {
	 $("#alertSuccess").hide();
	 }
	 $("#alertError").hide();
});

$(document).ready(function()
{
	if ($("#sBranch").text().trim() == "")
	 {
	 $("#sBranch").hide();
	 }
});

function validateItemForm()
{
	// NAME
	if ($("#name").val().trim() == "")
	 {
		 return "Insert Correct Name.";
	 }

	// NIC
	if ($("#nic").val().trim() == "")
	 {
		 return "Insert NIC";
	 }

	// DOB-------------------------------
	if ($("#dob").val().trim() == "")
	 {
		 return "Insert Date of Birth [DOB].";
	 }

	// is numerical value
	var phone = $("#phone").val().trim();
	if (!$.isNumeric(phone))
	 {
		 return "Insert correct phone number.";
	 }
	
	var sal = $("#salary").val().trim();
	if (!$.isNumeric(sal))
	 {
		 return "Insert a correct value for salary.";
	 }
	

	// Branch------------------------
	if ($("#select :selected").text() == "")
	 {
		 return "Select a Branch.";
 	}
return true;
}
$(document).on("click", "#btnSub", function(event)
{
		// Clear alerts---------------------
		 $("#alertSuccess").text("");
		 $("#alertSuccess").hide();
		 $("#alertError").text("");
		 $("#alertError").hide();
		 
	
		// Form validation-------------------
		var status = validateItemForm();
		if (status != true)
		 {
			 $("#alertError").text(status);
			 $("#alertError").show();
			 return;
		 }
	
	

		 var type = ($("#hidempID").val() == "") ? "POST" : "PUT";
	
		 $.ajax(
		 {
			 url : "EmployeeAPI",
			 type : type,
			 data : $("#formItem").serialize(),
			 dataType : "text",
			 complete : function(response, status)
			 {
			 onEmployeeComplete(response.responseText, status);
		 }
		 }); 


});
function onEmployeeComplete(response, status)
{
		if (status == "success")
		 {
		 var resultSet = JSON.parse(response);
		 if (resultSet.status.trim() == "success")
		 {
			 $("#alertSuccess").text("Successfully saved.");
			 $("#alertSuccess").show();
			 $("#empShow").html(resultSet.data);
		 } else if (resultSet.status.trim() == "error")
		 {
			 $("#alertError").text(resultSet.data);
			 $("#alertError").show();
		 }
		 } else if (status == "error")
		 {
			 $("#alertError").text("Error while saving.");
			 $("#alertError").show();
		 } else
 			{	
			 $("#alertError").text("Unknown error while saving..");
			 $("#alertError").show();
			 }
		
		
	$("#hidempID").val("");
	 $("#formItem")[0].reset();
}



$(document).on("click", ".btnUpdate", function(event)
{ 
	$("#sBranch").show();
	
	
	 $("#hidempID").val($(this).data("empid")); 
	 $("#nic").val($(this).closest("tr").find('td:eq(0)').text());
	$("#name").val($(this).closest("tr").find('td:eq(1)').text());
	 $("#dob").val($(this).closest("tr").find('td:eq(2)').text());
	 $("#address").val($(this).closest("tr").find('td:eq(3)').text());
	$("#phone").val($(this).closest("tr").find('td:eq(4)').text());
		$("#salary").val($(this).closest("tr").find('td:eq(5)').text());
	$("#position").val($(this).closest("tr").find('td:eq(6)').text());
	$("#sBranch").val($(this).closest("tr").find('td:eq(7)').text());
});


$(document).on("click", ".btnRemove", function(event)
{
	 $.ajax(
	 {
	 url : "EmployeeAPI",
	 type : "DELETE",
	 data : "empID=" + $(this).data("empid"),
	 dataType : "text",
	 complete : function(response, status)
	 {
	 	DeleteComplete(response.responseText, status);
	 }
	 });
});

function DeleteComplete(response, status)
{
			if (status == "success")
			{
			 var resultSet = JSON.parse(response);
			 if (resultSet.status.trim() == "success")
			 {
			 $("#alertSuccess").text("Successfully deleted.");
			 $("#alertSuccess").show();
			 $("#empShow").html(resultSet.data);
			 } else if (resultSet.status.trim() == "error")
			 {
			 $("#alertError").text(resultSet.data);
			 $("#alertError").show();
			 }
			 } else if (status == "error")
			 {
			 $("#alertError").text("Error while deleting.");
			 $("#alertError").show();
			 } else
			 {
			 $("#alertError").text("Unknown error while deleting..");
			 $("#alertError").show();
		 }
}
