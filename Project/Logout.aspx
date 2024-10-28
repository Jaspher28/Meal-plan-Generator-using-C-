<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Project.Logout" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <title>Logout Confirmation</title>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <!--Logout start-->
    <div class="bg-white p-8 rounded shadow-md text-center">
        <h1 class="text-2xl font-bold mb-4">Are you sure you want to logout?</h1>
        <div class="flex justify-around">
            <a href="Logout.aspx?confirm=yes" class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600">Yes</a>
            <a href="index.aspx" class="bg-red-500 text-white py-2 px-4 rounded hover:bg-red-600">No</a>
        </div>
    </div>
    <!--Logout end-->

</body>
</html>