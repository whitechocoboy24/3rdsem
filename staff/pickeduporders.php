<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    // If they are not logged in, redirect them to the login page
    header('Location: login.php');
    exit;
}

// Include the database connection file
require_once 'db_connection.php';



// Retrieve orders from the database
if (isset($_POST['filter_orders'])) {
    $month = $_POST['month'] ?? '';
    $year = $_POST['year'] ?? '';
    $day = $_POST['day'] ?? '';
    if ($month != "" && $year != "" && $day != "") {
        $query = "SELECT * FROM orders WHERE status = 'pickedup' AND MONTH(order_date) = '$month' AND YEAR(order_date) = '$year' AND DAY(order_date) = '$day'";
    } elseif ($month != "" && $year != "") {
        $query = "SELECT * FROM orders WHERE status = 'pickedup' AND MONTH(order_date) = '$month' AND YEAR(order_date) = '$year'";
    } elseif ($month != "") {
        $query = "SELECT * FROM orders WHERE status = 'pickedup' AND MONTH(order_date) = '$month'";
    } elseif ($year != "") {
        $query = "SELECT * FROM orders WHERE status = 'pickedup' AND YEAR(order_date) = '$year'";
    } else {
        $query = "SELECT * FROM orders WHERE status = 'pickedup'";
    }
} elseif (isset($_POST['search'])) {
    $search = $_POST['search'];
    $query = "SELECT * FROM orders WHERE status = 'pickedup' AND (orders LIKE '%$search%' OR pickup_address LIKE '%$search%')";
} else {
    $query = "SELECT * FROM orders WHERE status = 'pickedup'";
}
$result = $conn->query($query);

// Initialize a variable to count the number of sales had gone user selected date
$total_sales = 0;
// Initialize a variable to count the number of orders got on the selected date
$total_orders = 0;
// Initialize a variable to count the number of customers
$visitors = array();
// Initialize a variable to count the number of total profit to the user selected date orders
$total_profit = 0;
// Initialize a variable to count the number of delivered orders
$total_delivered_orders = 0;
// Initialize a variable to count the number of pickedup orders
$total_pickedup_orders = 0;

if ($result->num_rows >  0) {
    // Display orders in a table
    $orders_table = "<table>";
    $orders_table .= "<tr><th>Order ID</th><th>Price</th><th>Products</th><th>Wash Method</th><th>Pickup Address</th><th>Delivery address</th><th>Order Date</th><th>Update status</th></tr>";
    $order_ids = array();
    $rows = array();
    $products = array();
    while ($row = $result->fetch_assoc()) {
        $rows[] = $row;
        $total_sales += $row['total_amount'];
        $visitors[] = $row['user_id'];
        
        // Calculate profit for each order
        $profit = $row['total_amount'] * 0.15; 
        $total_profit += $profit;
        
        // Check if the order is pickedup
        if ($row['status'] == 'pickedup') {
            $total_pickedup_orders++;
        }

        // Check if the order is delivered
        if ($row['status'] == 'delivered') {
            $total_delivered_orders++;
        }
        
        // Retrieve wash method from carted table
        $carted_query = "SELECT wash_method, dress_type, quantity FROM carted WHERE user_id = '" . $row['id'] . "'";
        $carted_result = $conn->query($carted_query);
        $carted_rows = $carted_result->fetch_all(MYSQLI_ASSOC);

        if (!in_array($row['id'], $order_ids)) {
            $order_ids[] = $row['id'];
            $products[$row['id']] = array();
        }

        foreach ($carted_rows as $carted_row) {
            $products[$row['id']][] = $carted_row['dress_type'] . " - " . $carted_row['wash_method'] . " x " . $carted_row['quantity'];
        }
    }

    $unique_user_ids = array_unique(array_column($rows, 'id'));
    foreach ($unique_user_ids as $user_id) {
        $user_rows = array_filter($rows, function($row) use ($user_id) {
            return $row['id'] == $user_id;
        });

        $first_row = reset($user_rows);
        $orders_table .= "<tr>";
        $orders_table .= "<td>" . $first_row['user_id'] . "</td>";
        $orders_table .= "<td>Rs." . number_format($first_row['total_amount'], 2) . "</td>";
        $orders_table .= "<td>";
        $orders_table .= "<ul>"; // Start the unordered list
        foreach ($user_rows as $row) {
            // Check if wash_method is not null
            if (!is_null($row['orders'])) {
                // Split the wash methods by comma and trim whitespace
                $orders = explode(',', $row['orders']);
                foreach ($orders as $method) {
                    $orders_table .= "<li>" . trim($method) . "</li>"; // Add each method as a list item
                }
            } else {
                $orders_table .= "<li>No wash method specified</li>"; // Handle null case
            }
        }
        $orders_table .= "</ul>"; // End the unordered list
        $orders_table .= "</td>";

        $orders_table .= "<td>";
        $orders_table .= "<ul>"; // Start the unordered list
        foreach ($user_rows as $row) {
            // Check if wash_method is not null
            if (!is_null($row['wash_method'])) {
                // Split the wash methods by comma and trim whitespace
                $wash_methods = explode(',', $row['wash_method']);
                foreach ($wash_methods as $method) {
                    $orders_table .= "<li>" . trim($method) . "</li>"; // Add each method as a list item
                }
            } else {
                $orders_table .= "<li>No wash method specified</li>"; // Handle null case
            }
        }
        $orders_table .= "</ul>"; // End the unordered list
        $orders_table .= "</td>";
        $orders_table .= "<td>" . $first_row['pickup_address'] . "</td>";
        $orders_table .= "<td>" . $first_row['delivery_address'] . "</td>";
        $orders_table .= "<td>" . date('Y-m-d', strtotime($first_row['order_date'])) . "</td>";

        $orders_table .= "<td>
            <form action='' method='post' class='update-status-form'>
                <input type='hidden' name='id' value='" . $first_row['id'] . "'>
                <button type='submit' name='update_status_button' value='delivered'>Delivered</button>
            </form>
        </td>";
        $orders_table .= "</tr>";
    }
    $orders_table .= "</table>";
} else {
    $orders_table = "No orders found.";
}
$unique_visitors = count(array_unique($visitors));

// Update status
if (isset($_POST['update_status_button'])) {
    $id = $_POST['id'];
    $status = $_POST['update_status_button'];
    $query = "UPDATE orders SET status = '$status' WHERE id = '$id'";
    $conn->query($query);



    header('Location: pickeduporders.php');
    exit;
}

// Close the database connection
close_connection();
?>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <!-- My CSS -->
    <link rel="stylesheet" href="staff.css">
    <link rel="stylesheet" href="statuscss.css">

    <title>pickedup</title>
</head>
<body>

    <!-- SIDEBAR -->
    <section id="sidebar">
        <a href="#" class="brand">
           
            <span class="text">SpinCycle</span>
        </a>
        <ul class="side-menu top">
        <li>
                <a href="profanima.php">
                <i class="bx bxs-truck"></i>
                    <span class="text">Manage Profile</span>
                </a >
</li> 
            <li > 
                <a href="loadingstaff.php">
                    <i class='bx bxs-dashboard' ></i>
                    <span class="text">Orders</span>
                </a>
            </li>
            <li>
                <a href="loadingdeliv.php">
                <i class="bx bxs-box"></i>
                    <span class="text">Delivered Orders</span>
                </a>
            </li>
            <li class="active">
                <a href="loadingpick.php">
                <i class="bx bxs-truck"></i>
                    <span class="text">Picked-Up Orders</span>
                </a>
            </li>
            <li>
                <a href="loadingpaid.php">
                <i class="bx bx-history"></i>
                    <span class="text">Orders History</span>
                </a>
            </li>

        </ul>
        <ul class="side-menu">

            <li>
                <a href="logoutanimation.php" class="logout">
                    <i class='bx bxs-log-out-circle' ></i>
                    <span class="text">Logout</span>
                </a>
            </li>
        </ul>
    </section>
    <!-- SIDEBAR -->


    <!-- CONTENT -->
    <section id="content">
        <!-- NAVBAR -->
        <nav>
            <i class='bx bx-menu' ></i>
            <a href="#" class="nav-link">Categories</a>
            <form action="#">
                <div class="form-input">

                </div>
            </form>


            <span class="username">Welcome back, <?php echo $_SESSION['username']; ?></span>


        </nav>
        <!-- NAVBAR -->

        <!-- MAIN -->
        <main>
            <div class="head-title">
                <div class="left">
                    <h1>Picked-Up Orders</h1>
                    <ul class="breadcrumb">

                        <li><i class ='bx bx-chevron-right' ></i></li>
                        <li>
                            <a class="active" href="pickeduporders.php">Picked-Up</a>
                        </li>
                    </ul>
                </div>

                </div>
            <ul class="box-infod">
    <li>
        <i class='bx bx-calendar-week'></i>
        <div class="form-filter">
            <form action="" method="post">
                <select name="month" id="month">
                    <option value="">Select Month</option>
                    <option value="01">January</option>
                    <option value="02">February</option>
                    <option value="03">March</option>
                    <option value="04">April</option>
                    <option value="05">May</option>
                    <option value="06">June</option>
                    <option value="07">July</option>
                    <option value="08">August</option>
                    <option value="09">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>
                <select name="year" id="year">
                    <option value="">Select Year</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    <option value="2028">2028</option>
                    <option value="2029">2029</option>
                    <option value="2030">2030</option>
                    </select>
                <select name="day" id="day">
                    <option value="">Select Day</option>
                    <?php for ($i = 1; $i <= 31; $i++) { ?>
                        <option value="<?php echo str_pad($i, 2, '0', STR_PAD_LEFT); ?>"><?php echo $i; ?></option>
                    <?php } ?>
                </select>
                <button type="submit" name="filter_orders">filter</button>
            </form>
        </div>
    </li>
</ul>

          

            <div class="table-data">
                <div class="order">
                    <?php echo $orders_table; ?>
                </div>
               
            </div>
        </main>
        <!-- MAIN -->
    </section>
    <!-- CONTENT -->


    <script src="adminhome.js"></script>
</body>
</html>