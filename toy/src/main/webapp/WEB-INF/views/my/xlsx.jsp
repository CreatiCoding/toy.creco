<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JSON to xlsx in Front-end</title>
    <script src="/js/xlsx.full.min.js"></script>
</head>

<body>
    <h1>JSON to xlsx in Front-end</h1>
    <textarea id="input" style="width:600px ; height:200px">
[
    { S: 1, h: 2, e: 3, e_1: 4, t: 5, J: 6, S_1: 7 },
    { S: 2, h: 3, e: 4, e_1: 5, t: 6, J: 7, S_1: 8 }
]
    </textarea>
    <div id="output">

    </div>
    <button type="click" onClick="doIt()">다운로드</button>
    <script>
        function doIt() {
            var jsonStr = document.querySelector("#input").innerHTML.trim().replace(/(['"])?([a-z0-9A-Z_]+)(['"])?:/g, '"$2": ');
            var arrayObj = JSON.parse(jsonStr)
            var ws = XLSX.utils.json_to_sheet(arrayObj);

            document.querySelector("#output").innerHTML = XLSX.utils.sheet_to_html(ws);
            var workbook = XLSX.utils.table_to_book(document.querySelector('#output'));
            XLSX.writeFile(workbook, 'test.xlsx');
        }
    </script>
</body>

</html>