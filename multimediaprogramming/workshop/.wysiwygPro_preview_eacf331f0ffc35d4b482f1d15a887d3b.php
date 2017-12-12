<?php
if ($_GET['randomId'] != "FiozzHcUZnJb1rQJMa8lUeLMxGKTGTw2l8h1l_QoNKIiJBx09SNKDvEyb9FNeocA") {
    echo "Access Denied";
    exit();
}

// display the HTML code:
echo stripslashes($_POST['wproPreviewHTML']);

?>  
