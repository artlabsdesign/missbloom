<?php
$result = mail('111sid111@mail.ru', 'subject', 'message');

if($result)
{
    echo 'все путем';
}
else
{
    echo 'что-то не так';
}
?>