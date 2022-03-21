<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="css\style.css">
</head>

<body>
    <img src="image\Banner8.jpg" alt="Banner image" class="image">

    <h1>Prime Numbers Generator</h1>

    <?php

        $Min_NumErr = $Max_NumErr = " ";
        $Min_Num = $Max_Num = " ";
         
         if ($_SERVER["REQUEST_METHOD"] == "POST") 
         {
            if (empty($_POST["Min_Num"])) 
            {
               $Min_NumErr = "Number is required";
            }
            else 
            {
               $Min_Num = test_input($_POST["Min_Num"]);
            }

            if (empty($_POST["Max_Num"])) 
            {
               $Max_NumErr = "Number is required";
            }
            else 
            {
               $Max_Num = test_input($_POST["Max_Num"]);
            }
         }

         function test_input($data) {
            $data = trim($data);
            $data = stripslashes($data);
            $data = htmlspecialchars($data);
            return $data;
         } 
      ?>



    <p><span class="error">* This field is required.</span></p>

    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        <table>
            <tr>
                <td>Value 1:</td>
                <td>
                    <input type="number" name="Min_Num">
                    <span class="error">* <?php echo $Min_NumErr;?></span>
                </td>
            </tr>

            <tr>
                <td>Value 2:</td>
                <td>
                    <input type="number" name="Max_Num">
                    <span class="error">* <?php echo $Max_NumErr;?></span>
                </td>
            </tr>

            <tr>
                <td>
                    <input type="submit" name="submit" value="Submit">
                </td>
            </tr>

        </table>

    </form>

    <?php

function Prime_Numbers_func($MinNum, $MaxNum)
{
    $Prime_Numbers_array = array();

    for($i = $MinNum;$i<=$MaxNum;$i++)
    {
        $Divisors_array = array();
        
        for($j=1; $j<=$i; $j++)
        {
            if(is_integer($i / $j))
            {
                $Divisors_array[] = $j;
            }
        }

        if(sizeof ($Divisors_array) === 2 AND $Divisors_array[0] === 1 AND $Divisors_array[1] === $i)
        {
            $Prime_Numbers_array[] = $i;
        }
    }
    return $Prime_Numbers_array;
}


$MinNum = $Min_Num;
$MaxNum = $Max_Num;

$Prime_Numbers_array = Prime_Numbers_func($MinNum, $MaxNum);

echo "<p>";

echo "<h2> Your given range is: ".$MinNum. " - ".$MaxNum. " </h2> "; 
echo "<h4> Total number of prime numbers in this range: ".sizeof($Prime_Numbers_array)."</h4>";

echo "</p>";


echo "<br>";
echo "<table border=\"2\" align=\"center\">";

echo "<tr><th> <p style='color:red';>
Prime numbers between ". $MinNum. " and ". $MaxNum. " </p> ";  
echo "</th>";


foreach($Prime_Numbers_array as $index => $Prime_Values)
{ 
    echo "<tr> <td >";
    echo $Prime_Values. "  ";
    echo "</td></tr>";   
}
echo "</table>";
?>
</body>

</html>