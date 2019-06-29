<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>db data to test json in Front-end</title>
    <script src="/js/xlsx.full.min.js"></script>
</head>

<body>
    <h1>db row to json in Front-end</h1>
    <textarea id="input" style="width:600px ; height:200px">
cart_id	user_id	product_id	product_item_id	center_id	quantity	order_choice_code	sort_order	created_at	updated_at	worker_id
123	1	1	1	2	1	Y	1	2019-06-21 14:37:17	2019-06-27 12:31:00	1
124	1	2	1	2	1	Y	2	2019-06-27 22:20:47	NULL	1
    </textarea>
    <textarea id="output">

    </textarea>
    <button type="click" onClick="doIt()">변환</button>
    <script>
        function doIt() {
            var a = document.querySelector("#input").innerHTML.trim();

            a = a.split("\n").map(e => e.split("\t"))

            var column = a.shift();

            var r = a.reduce((acc, current) => {
                var e = {};
                for (idx in column) {
                    e[column[idx]] = current[idx] === "NULL" ? null : current[idx];
                }
                return [...acc, e];
            }, []);
            document.querySelector("#output").innerHTML = JSON.stringify(r, null, 2);
        }
    </script>
</body>

</html>