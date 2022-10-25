

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="ATNtoy/background.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopes Management</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopes Management</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
<!-- Bootstrap --> 
<form name="frm" method="post" action="">
        <h2>Shopes</h2>
        <p>
        <i class="fa fa-plus"></i> <a href="?page=addbr"> Add</a>
        </p>
        <table id="tableShop" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th><strong>No.</strong></th>
                    <th><strong>Shop Name</strong></th>
                    <th><strong>Edit</strong></th>
                    <th><strong>Delete</strong></th>
                </tr>
             </thead>

			<tbody>
            <?php
                include_once("connection.php");
                if(isset($_GET["function"])=="del")
                {
                    if(isset($_GET["id"]))
                    {
                       $id = $_GET["id"];
                        pg_query($conn, "delete from Shop where Shop_id='$id'");
                    }
                         
                }

                $No = 1;
                $result = pg_query($conn, "select * from Shop");
                while ($row=pg_fetch_array($result, NULL, PGSQL_ASSOC))
                {
                ?>
			<tr>
                <td class="cotCheckBox"><?php echo $No; ?></td>
                <td><?php echo $row['Shop_name']?></td>
                <td style='text-align:center'><a href="?page=upbr&&id=<?php echo $row['Shop_id'];?>"><i class="fa fa-edit"></i></td>
                <td style='text-align:center'><a href="?page=Shop&&function=del&&id=<?php echo $row['Shop_id']; ?>"
                 onclick="return ConfirmDelete()"><i class="fa fa-close"></i></td>
            </tr>
            <?php
                $No++;
                }
                
                ?>
			</tbody>
        </table>   
 </form>

